-- Setup Packer if it doesn't already exist
-- https://github.com/wbthomason/packer.nvim#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.cmd([[packadd packer.nvim]])
end

-- Rerun PackerCompile everytime plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer = require("packer")
packer.init {
  -- We want to put the compiled packer file outside of the main nvim config so
  -- that we can compile separate versions on different machines. This is
  -- required as the compiled file has hardcoded paths in it which may differ
  -- between machines.
  compile_path = vim.fn.stdpath "data" .. "/site/pack/loader/start/packer.nvim/plugin/packer.lua"
}

-- Specify plugins
packer.startup(function(use)
  use { "wbthomason/packer.nvim" }

  ------------------------------------------------------------------------------
  -- Editing
  ------------------------------------------------------------------------------

  -- Delete/change/add parentheses/quotes/XML-tags/much more with ease
  use { "tpope/vim-surround" }

  -- Provides `[<Space>` and `]<Space>` for adding space above and below lines amongst others
  use { "tpope/vim-unimpaired" }

  -- Provides `gc` mapping to comment out code correctly for a given language
  use { "tpope/vim-commentary" }

  -- Wraps unix commands in Vim commands i.e. :Delete, :Remove, etc
  use { "tpope/vim-eunuch" }

  -- Automatically inserts ending structures such as `end`
  use { "tpope/vim-endwise" }

  -- Switch between single-line and multiline forms of code using `gS` and `gJ`
  use { "AndrewRadev/splitjoin.vim", branch = "main" }

  -- Commands to move items such as arguments left and right
  use { "AndrewRadev/sideways.vim", branch = "main" }

  -- Line up text
  use { "godlygeek/tabular" }

  -- Easily split the line at the cursor - opposite of `J`
  use { "drzel/vim-split-line" }

  -- Adds events we can listen for on syntax changes
  use { "vim-scripts/OnSyntaxChange" }

  -- Run things asynchronously without blocking Vim
  use {
    "tpope/vim-dispatch",
    config = function ()
      -- Make the dispatch tmux window bigger
      vim.g.dispatch_quickfix_height = 20
    end
  }

  -- Test runner that can run tests at different granularities.
  use {
    "vim-test/vim-test",
    config = function ()
      -- Make test commands execute using dispatch.vim
      vim.g['test#strategy'] = "dispatch"
    end
  }

  ------------------------------------------------------------------------------
  -- Git
  ------------------------------------------------------------------------------

  -- Git from Vim
  use { "tpope/vim-fugitive" }

  -- Add GitHub support to Fugitive
  use { "tpope/vim-rhubarb" }

  -- Simple commit browser
  use { "junegunn/gv.vim" }

  -- Show various git UI
  use {
    "lewis6991/gitsigns.nvim",
    tag = "release",
    config = function()
      require("gitsigns").setup({
        show_deleted = true,
        signcolumn = true,
        numhl = true,
        linehl = false,
        current_line_blame = true
      })
    end
  }

  ------------------------------------------------------------------------------
  -- Treesitter
  ------------------------------------------------------------------------------

  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  ------------------------------------------------------------------------------
  -- Searching etc
  ------------------------------------------------------------------------------

  -- FZF
  use "/usr/local/opt/fzf"
  use "junegunn/fzf.vim"

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    requires = {
      {"nvim-lua/plenary.nvim"}
    }
  }

  -- Highlight current search matches
  use { "PeterRincker/vim-searchlight" }

  ------------------------------------------------------------------------------
  -- Linting
  ------------------------------------------------------------------------------

  use {
    "dense-analysis/ale",
    config = function ()
      vim.g.ale_linters = {
        ruby = {"standardrb", "rubocop"},
        rust = {"rustfmt", "analyzer"}
      }
    end
  }

  ------------------------------------------------------------------------------
  -- Language/framework specific plugins
  ------------------------------------------------------------------------------

  -- Ruby language
  use { "vim-ruby/vim-ruby" }

  -- Rails helpers
  use { "tpope/vim-rails" }

  -- Support for Ruby's Bundler
  use { "tpope/vim-bundler" }

  -- Elixir language
  use { "elixir-lang/vim-elixir" }

  -- Fish shell
  use { "dag/vim-fish" }

  -- Terraform
  use { "hashivim/vim-terraform" }

  -- JavaScript / TypeScript / JSX
  use { "yuezk/vim-js" }
  use { "HerringtonDarkholme/yats.vim" }
  use { "maxmellon/vim-jsx-pretty" }

  -- Highlight columns in CSV files
  use {
    "mechatroner/rainbow_csv",
    config = function () require("plugins.rainbow_csv") end
  }

  -- Rust language support
  use {
    "rust-lang/rust.vim",
    config = function ()
      -- Automatically format rust files upon save
      vim.g.rustfmt_autosave = 1
    end
  }

  -- Add common programming words so they don't show up as spelling mistakes
  use { "psliwka/vim-dirtytalk", run = ":DirtytalkUpdate" }

  ------------------------------------------------------------------------------
  -- UI
  ------------------------------------------------------------------------------

  -- Allows marking several words at one time in different colours using `<leader>m`
  use { "inkarkat/vim-ingo-library" }
  use {
    "inkarkat/vim-mark",
    config = function ()
      vim.g.mwDefaultHighlightingPalette = "maximum"
    end
  }

  -- Allows checking Markdown `- [ ]` checkboxes using `<leader>tt`
  use { "jkramer/vim-checkbox" }

  -- Git co-authorship helper
  use { "maxjacobson/vim-fzf-coauthorship" }

  -- Allows `<Tab>` completion in insert mode
  use { "ervandew/supertab" }

  -- Tree view
  use { "scrooloose/nerdtree" }

  -- Colorize hex css-like colours in code
  use { "ap/vim-css-color" }

  ------------------------------------------------------------------------------
  -- Colorschemes
  ------------------------------------------------------------------------------

  use {
    "shaunsingh/moonlight.nvim",
    branch = "pure-lua",
    config = function ()
      vim.g.moonlight_style = "moonlight"
    end
  }

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require("packer").sync()
  end
end)
