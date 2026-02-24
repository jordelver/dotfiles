local config_root = vim.fn.expand("~/.config/nvim")
local data_root = vim.fn.stdpath("data")

vim.opt.runtimepath:prepend(config_root)
vim.opt.runtimepath:prepend(data_root .. "/lazy/plenary.nvim")

vim.cmd("filetype plugin indent on")
