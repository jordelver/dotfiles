-- Taken from https://github.com/goolord/nvim/blob/main/lua/modules/colors.lua

local function hl(group, options)
  vim.api.nvim_set_hl(0, group, options)
end

-- Highlight commands to override the main colorscheme
local function apply_colors()

  -- Override `CursorLine` highlighting
  hl("CursorLine", { fg = nil, bg = "#191919" })
  hl("CursorColumn", { fg = nil, bg = "#191919" })

  -- Override search highlighting
  hl("Search", { fg = "#080808", bg = "#ffd700" })
  hl("Searchlight", { fg = "#080808", bg = "#ffaf00" })

  -- Highlight text that goes over 50 characters in git commit messages
  hl("gitcommitOverflow", { fg = "#cc0000", bg = nil })

  -- Highlight TODO comments
  hl("rubyTODO",      { fg = "#eeeeee", bg = "#2d2c5d" })
  hl("elixirTodo",    { fg = "#eeeeee", bg = "#2d2c5d" })
  hl("vimTODO",       { fg = "#eeeeee", bg = "#2d2c5d" })
  hl("jsCommentTodo", { fg = "#eeeeee", bg = "#2d2c5d" })
  hl("rustTodo",      { fg = "#eeeeee", bg = "#2d2c5d" })
  hl("luaTodo",       { fg = "#eeeeee", bg = "#2d2c5d" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = apply_colors,
})
