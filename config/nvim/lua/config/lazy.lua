-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Map the leader key to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Require all vim.opt.* options
require("config.options")

-- Custom keymaps
require("config.keymaps")

-- LSP
require("config.lsp")

-- Diagnostics
require("config.diagnostic")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "shaunsingh/moonlight.nvim",
      branch = "pure-lua",
      config = function ()
        require("config.colorscheme_overrides")
        vim.g.moonlight_style = "moonlight"
        vim.cmd.colorscheme "moonlight"
      end
    },

    { import = "config.plugins" },
  }
})
