-- Highlight commands to override the main colorscheme
local function apply_colors()

  -- Override `CursorLine` highlighting
  vim.api.nvim_set_hl(0, "CursorLine", { fg = nil, bg = "#191919" })
  vim.api.nvim_set_hl(0, "CursorColumn", { fg = nil, bg = "#191919" })

  -- Override search highlighting
  vim.api.nvim_set_hl(0, "Search", { fg = "#080808", bg = "#ffd700" })
  vim.api.nvim_set_hl(0, "Searchlight", { fg = "#080808", bg = "#ffaf00" })

  -- Highlight text that goes over 50 characters in git commit messages
  vim.api.nvim_set_hl(0, "gitcommitOverflow", { fg = "#cc0000", bg = nil })

  -- Highlight TODO comments
  vim.api.nvim_set_hl(0, "rubyTODO",      { fg = "#eeeeee", bg = "#2d2c5d" })
  vim.api.nvim_set_hl(0, "elixirTodo",    { fg = "#eeeeee", bg = "#2d2c5d" })
  vim.api.nvim_set_hl(0, "vimTODO",       { fg = "#eeeeee", bg = "#2d2c5d" })
  vim.api.nvim_set_hl(0, "jsCommentTodo", { fg = "#eeeeee", bg = "#2d2c5d" })
  vim.api.nvim_set_hl(0, "rustTodo",      { fg = "#eeeeee", bg = "#2d2c5d" })
  vim.api.nvim_set_hl(0, "luaTodo",       { fg = "#eeeeee", bg = "#2d2c5d" })

  -- Clear weird highlighting in the quickfix window
  vim.api.nvim_set_hl(0, "qfFileName", {})
  vim.api.nvim_set_hl(0, "qfLineNr", {})
  vim.api.nvim_set_hl(0, "QuickFixLine", {})
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = apply_colors,
})
