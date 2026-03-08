local text = require("weeknotes.text")

local M = {}

local uv = vim.uv or vim.loop

local function notify(message, level)
  vim.notify(message, level or vim.log.levels.INFO, { title = "weeknotes" })
end

local function canonical_path(path)
  return uv.fs_realpath(path) or path
end

local function parse_frontmatter_bounds(lines)
  if lines[1] ~= "---" then
    return nil, nil
  end

  for index = 2, #lines do
    if lines[index] == "---" then
      return 1, index
    end
  end

  return nil, nil
end

local function extract_subtitle_value(line)
  local value = line:match("^subtitle:%s*(.*)$")
  if not value then
    return nil
  end

  local trimmed = text.trim(value)
  if trimmed:match('^".*"$') then
    return trimmed:sub(2, -2):gsub('\\"', '"')
  end

  return trimmed
end

local function normalize_subtitle_input(value)
  return text.trim(text.normalize_paste_artifacts(value or ""))
end

local function update_subtitle_frontmatter(bufnr, subtitle)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local fm_start, fm_end = parse_frontmatter_bounds(lines)
  if not fm_start or not fm_end then
    return nil, "Missing YAML frontmatter"
  end

  local subtitle_line = nil
  for index = fm_start + 1, fm_end - 1 do
    if lines[index]:match("^subtitle:%s*") then
      subtitle_line = index
      break
    end
  end

  if not subtitle_line then
    return nil, "Frontmatter missing subtitle field"
  end

  lines[subtitle_line] = "subtitle: " .. subtitle
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

  return true
end

local function current_subtitle(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local fm_start, fm_end = parse_frontmatter_bounds(lines)
  if not fm_start or not fm_end then
    return ""
  end

  for index = fm_start + 1, fm_end - 1 do
    local value = extract_subtitle_value(lines[index])
    if value ~= nil then
      return value
    end
  end

  return ""
end

function M.slugify(subtitle)
  local value = text.normalize_ascii_quotes(normalize_subtitle_input(subtitle)):lower()
  value = value:gsub("['\"]", "")
  value = value:gsub("[^%w%s%-]", " ")
  value = value:gsub("%s+", "-")
  value = value:gsub("%-+", "-")
  value = value:gsub("^%-+", "")
  value = value:gsub("%-+$", "")
  return value
end

function M.build_destination_path(path, subtitle)
  local directory, filename = path:match("^(.*)/([^/]+)$")
  if not filename then
    directory = "."
    filename = path
  end

  local number = filename:match("^(%d+)%-.*%.md$")
  if not number then
    return nil, "Filename must match <number>-<slug>.md"
  end

  local slug = M.slugify(subtitle)
  if slug == "" then
    return nil, "Subtitle produced an empty slug"
  end

  return string.format("%s/%s-%s.md", directory, number, slug)
end

function M.set_subtitle_and_rename()
  local bufnr = vim.api.nvim_get_current_buf()
  local path = vim.api.nvim_buf_get_name(bufnr)

  if path == "" then
    notify("Current buffer has no file path", vim.log.levels.ERROR)
    return
  end

  vim.ui.input({
    prompt = "Weeknote subtitle: ",
    default = current_subtitle(bufnr),
  }, function(input)
    if input == nil then
      return
    end

    local subtitle = normalize_subtitle_input(input)
    if subtitle == "" then
      notify("Subtitle cannot be empty", vim.log.levels.WARN)
      return
    end

    local ok, message = update_subtitle_frontmatter(bufnr, subtitle)
    if not ok then
      notify(message, vim.log.levels.ERROR)
      return
    end

    local destination, path_error = M.build_destination_path(path, subtitle)
    if not destination then
      notify(path_error, vim.log.levels.ERROR)
      return
    end

    local source_canonical = canonical_path(path)
    local destination_canonical = canonical_path(destination)
    local destination_is_different = source_canonical ~= destination_canonical

    if destination_is_different and uv.fs_stat(destination) then
      notify("Destination file already exists", vim.log.levels.ERROR)
      return
    end

    vim.cmd("silent write")

    if destination_is_different then
      local renamed, rename_error = uv.fs_rename(path, destination)
      if not renamed then
        notify("Failed to rename file: " .. tostring(rename_error), vim.log.levels.ERROR)
        return
      end

      vim.api.nvim_buf_set_name(bufnr, destination)
    end

    notify("Updated subtitle and filename")
  end)
end

return M
