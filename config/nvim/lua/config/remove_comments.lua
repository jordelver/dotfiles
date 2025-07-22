local M = {}

function M.remove_comments()
  local ts    = vim.treesitter
  local bufnr = vim.api.nvim_get_current_buf()
  local ft    = vim.bo[bufnr].filetype
  local lang  = ts.language.get_lang(ft) or ft

  local ok, parser = pcall(ts.get_parser, bufnr, lang)
  if not ok then return vim.notify("No parser for " .. ft, vim.log.levels.WARN) end

  local tree  = parser:parse()[1]
  local root  = tree:root()
  local query = ts.query.parse(lang, "(comment) @comment")

  local ranges = {}
  for _, node in query:iter_captures(root, bufnr, 0, -1) do
    table.insert(ranges, { node:range() })
  end

  table.sort(ranges, function(a, b)
    if a[1] == b[1] then return a[2] < b[2] end
    return a[1] > b[1]
  end)

  for _, r in ipairs(ranges) do
    vim.api.nvim_buf_set_text(bufnr, r[1], r[2], r[3], r[4], {})
  end
end

return M
