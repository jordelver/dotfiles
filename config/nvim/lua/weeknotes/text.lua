local M = {}

function M.trim(value)
  return (value:gsub("^%s+", ""):gsub("%s+$", ""))
end

function M.normalize_ascii_quotes(value)
  local normalized = value
    :gsub("“", '"')
    :gsub("”", '"')
    :gsub("„", '"')
    :gsub("‟", '"')
    :gsub("‘", "'")
    :gsub("’", "'")
    :gsub("‚", "'")
    :gsub("‛", "'")

  return normalized
end

function M.normalize_paste_artifacts(value)
  return value
    :gsub("\226\128\168", " ") -- U+2028 LINE SEPARATOR
    :gsub("\226\128\169", " ") -- U+2029 PARAGRAPH SEPARATOR
    :gsub("\194\160", " ") -- U+00A0 NO-BREAK SPACE
    :gsub("\226\128\139", "") -- U+200B ZERO WIDTH SPACE
    :gsub("\226\128\140", "") -- U+200C ZERO WIDTH NON-JOINER
    :gsub("\226\128\141", "") -- U+200D ZERO WIDTH JOINER
end

function M.is_url(value)
  return value:match("^https?://%S+$") ~= nil
end

function M.strip_outer_quotes(value)
  local trimmed = M.trim(value)
  if #trimmed < 2 then
    return trimmed
  end

  local first = trimmed:sub(1, 1)
  local last = trimmed:sub(-1)
  local is_double = first == '"' and last == '"'
  local is_single = first == "'" and last == "'"

  if is_double or is_single then
    return M.trim(trimmed:sub(2, -2))
  end

  return trimmed
end

function M.wrap_text(text, max_width)
  local words = {}
  for word in text:gmatch("%S+") do
    table.insert(words, word)
  end

  if #words == 0 then
    return { "" }
  end

  local wrapped = {}
  local current = ""

  for _, word in ipairs(words) do
    local candidate = current == "" and word or (current .. " " .. word)
    if #candidate <= max_width or current == "" then
      current = candidate
    else
      table.insert(wrapped, current)
      current = word
    end
  end

  if current ~= "" then
    table.insert(wrapped, current)
  end

  return wrapped
end

function M.append_wrapped_block(output, first_prefix, next_prefix, text, wrap_width)
  local first_width = math.max(20, wrap_width - #first_prefix)
  local next_width = math.max(20, wrap_width - #next_prefix)
  local wrapped = M.wrap_text(text, first_width)

  if #wrapped > 0 then
    table.insert(output, first_prefix .. wrapped[1])
  end

  for index = 2, #wrapped do
    local continuation_lines = M.wrap_text(wrapped[index], next_width)
    for _, continuation in ipairs(continuation_lines) do
      table.insert(output, next_prefix .. continuation)
    end
  end
end

function M.trim_trailing_blank_lines(lines)
  while #lines > 0 and lines[#lines] == "" do
    table.remove(lines)
  end
end

function M.sort_labels(labels)
  table.sort(labels, function(a, b)
    return a:lower() < b:lower()
  end)
end

return M
