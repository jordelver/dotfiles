local refs = require("weeknotes.refs")
local text = require("weeknotes.text")

local M = {}

local function is_top_level_bullet(line)
  return line:match("^%-%s+") ~= nil
end

local function is_bullet_block_line(line)
  return line:match("^%-%s+") ~= nil or line:match("^%s") ~= nil or line == ""
end

local function is_outer_quoted(value)
  if #value < 2 then
    return false
  end

  local first = value:sub(1, 1)
  local last = value:sub(-1)
  return (first == '"' and last == '"') or (first == "'" and last == "'")
end

local function parse_child_entry(raw_child)
  local normalized = text.normalize_ascii_quotes(raw_child)
  local trimmed = text.trim(normalized)

  if trimmed == "" then
    return nil
  end

  if text.is_url(trimmed) then
    return { kind = "url", text = trimmed }
  end

  if trimmed:match("^>%s*") then
    return {
      kind = "text",
      quoted = true,
      text = text.trim(trimmed:gsub("^>%s*", "")),
    }
  end

  if is_outer_quoted(trimmed) then
    return {
      kind = "text",
      quoted = true,
      text = text.strip_outer_quotes(trimmed),
    }
  end

  return {
    kind = "text",
    quoted = false,
    text = trimmed,
  }
end

local function inline_labels_in_order(value)
  local labels = {}
  for label in value:gmatch("%[([^%]]+)%]") do
    table.insert(labels, label)
  end

  return labels
end

local function parse_items(lines)
  local items = {}
  local current = nil

  for _, raw in ipairs(lines) do
    local line = text.normalize_paste_artifacts(raw):gsub("\t", "  ")
    local indent, bullet_text = line:match("^(%s*)%-%s+(.*)$")

    if bullet_text then
      if #indent == 0 then
        if current then
          table.insert(items, current)
        end

        current = {
          text = text.trim(bullet_text),
          children = {},
        }
      elseif current then
        table.insert(current.children, text.trim(bullet_text))
      end
    elseif current then
      local continuation = text.trim(line)
      if continuation ~= "" then
        if #current.children > 0 then
          current.children[#current.children] = current.children[#current.children] .. " " .. continuation
        else
          current.text = current.text .. " " .. continuation
        end
      end
    end
  end

  if current then
    table.insert(items, current)
  end

  return items
end

local function build_lines(items, wrap_width)
  local output = {}
  local ref_defs = {}
  local ref_order = {}
  local ref_seen = {}
  local child_indent = "  "
  local quote_prefix = child_indent .. "> "

  for index, item in ipairs(items) do
    local item_text = text.normalize_ascii_quotes(item.text)
    local child_entries = {}
    local child_urls = {}

    for _, child in ipairs(item.children) do
      local entry = parse_child_entry(child)
      if entry and entry.kind == "url" then
        table.insert(child_urls, entry.text)
      elseif entry and entry.kind == "text" then
        table.insert(child_entries, entry)
      end
    end

    local inline_labels = inline_labels_in_order(item_text)
    local has_inline_labels = #inline_labels > 0

    if has_inline_labels and #child_urls > 0 then
      text.append_wrapped_block(output, "- ", child_indent, item_text, wrap_width)

      local map_count = math.min(#inline_labels, #child_urls)
      for i = 1, map_count do
        local label = inline_labels[i]
        local mapped_url = child_urls[i]
        ref_defs[label] = ref_defs[label] or mapped_url
        if not ref_seen[label] then
          ref_seen[label] = true
          table.insert(ref_order, label)
        end
      end
    elseif child_urls[1] then
      ref_defs[item_text] = ref_defs[item_text] or child_urls[1]
      if not ref_seen[item_text] then
        ref_seen[item_text] = true
        table.insert(ref_order, item_text)
      end
      table.insert(output, "- [" .. item_text .. "]")
    else
      text.append_wrapped_block(output, "- ", child_indent, item_text, wrap_width)
    end

    if #child_entries > 0 then
      table.insert(output, "")
      for child_index, entry in ipairs(child_entries) do
        local prefix = entry.quoted and quote_prefix or child_indent
        text.append_wrapped_block(output, prefix, prefix, entry.text, wrap_width)

        if child_index < #child_entries then
          table.insert(output, "")
        end
      end
    end

    if index < #items then
      table.insert(output, "")
    end
  end

  text.trim_trailing_blank_lines(output)
  refs.append_definitions(output, ref_defs, ref_order)

  return output
end

function M.transform_range(line_start, line_end)
  local bufnr = vim.api.nvim_get_current_buf()
  local textwidth = vim.bo[bufnr].textwidth
  local wrap_width = textwidth > 0 and textwidth or 80
  local input_lines = vim.api.nvim_buf_get_lines(bufnr, line_start - 1, line_end, false)
  local output_lines = {}
  local index = 1

  while index <= #input_lines do
    local line = input_lines[index]

    if is_top_level_bullet(line) then
      local block = {}
      while index <= #input_lines and is_bullet_block_line(input_lines[index]) do
        table.insert(block, input_lines[index])
        index = index + 1
      end

      local transformed = build_lines(parse_items(block), wrap_width)
      for _, transformed_line in ipairs(transformed) do
        table.insert(output_lines, transformed_line)
      end
    else
      table.insert(output_lines, line)
      index = index + 1
    end
  end

  vim.api.nvim_buf_set_lines(bufnr, line_start - 1, line_end, false, output_lines)
  refs.rebuild_refs()
end

return M
