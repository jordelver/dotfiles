local text = require("weeknotes.text")

local M = {}

local function push_unique(list, seen, value)
  if seen[value] then
    return
  end

  seen[value] = true
  table.insert(list, value)
end

local function sorted_labels(defs)
  local labels = {}
  for label, _ in pairs(defs) do
    table.insert(labels, label)
  end

  text.sort_labels(labels)
  return labels
end

local function labels_in_body(body_lines, defs)
  local labels = {}
  local seen = {}

  for _, line in ipairs(body_lines) do
    for label in line:gmatch("%[([^%]]+)%]") do
      if defs[label] then
        push_unique(labels, seen, label)
      end
    end
  end

  return labels
end

function M.append_definitions(output, defs, label_order)
  local labels = label_order or sorted_labels(defs)
  if #labels == 0 then
    return
  end

  table.insert(output, "")
  for _, label in ipairs(labels) do
    table.insert(output, "[" .. label .. "]: " .. defs[label])
  end
end

function M.rebuild_refs()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  local defs = {}
  local def_order = {}
  local def_seen = {}
  local body = {}

  for _, line in ipairs(lines) do
    local label, url = line:match("^%[([^%]]+)%]:%s+(%S+)%s*$")
    if label and url then
      push_unique(def_order, def_seen, label)
      defs[label] = defs[label] or url
    else
      table.insert(body, line)
    end
  end

  text.trim_trailing_blank_lines(body)

  local usage_order = labels_in_body(body, defs)
  local usage_seen = {}
  for _, label in ipairs(usage_order) do
    usage_seen[label] = true
  end

  for _, label in ipairs(def_order) do
    if defs[label] and not usage_seen[label] then
      table.insert(usage_order, label)
      usage_seen[label] = true
    end
  end

  M.append_definitions(body, defs, usage_order)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, body)
end

return M
