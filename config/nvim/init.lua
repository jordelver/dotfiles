require("options")
require("keymaps")

-- Alias some keys
vim.cmd [[
  " Alias :Q to :q
  command! Q q
  command! Qall qall

  " Alias :Wq to :wq
  command! Wq wq
]]

require("plugins")
require("colors")
require("functions")
