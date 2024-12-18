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

  -- LSP Configuration & Plugins
  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
      -- https://github.com/williamboman/mason.nvim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      --
      -- > Neovim setup for init.lua and plugin development with full signature
      -- > help, docs and completion for the nvim lua API
      --
      -- https://github.com/folke/neodev.nvim
      'folke/neodev.nvim',
    },
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
  }

  use {
    'petertriho/cmp-git',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    '~/Projects/cmp-jira',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  ------------------------------------------------------------------------------
  -- Editing
  ------------------------------------------------------------------------------

  -- Delete/change/add parentheses/quotes/XML-tags/much more with ease
  use { "tpope/vim-surround" }

  -- TODO Remove this once the latest stable version is released
  --      https://github.com/neovim/neovim/blob/f59aeb5a9ae80f6f0e12ae52330f3f4e0e7e03e0/runtime/doc/news.txt#L181
  -- Provides `[<Space>` and `]<Space>` for adding space above and below lines amongst others
  use { "tpope/vim-unimpaired" }

  -- Wraps unix commands in Vim commands i.e. :Delete, :Remove, etc
  use { "tpope/vim-eunuch" }

  -- Automatically inserts ending structures such as `end`
  use { "tpope/vim-endwise" }

  -- Various utilities for dealing with words
  --
  -- > It's three superficially unrelated plugins in one that share a common
  -- > theme: working with variants of a word.
  --
  -- Allows case-insensitive substitution using `%S` instead of `%s`
  use { "tpope/vim-abolish" }

  -- Switch between single-line and multiline forms of code using `gS` and `gJ`
  use { "AndrewRadev/splitjoin.vim", branch = "main" }

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

  ------------------------------------------------------------------------------
  -- Git
  ------------------------------------------------------------------------------

  -- Git from Vim
  -- Adds a _lot_ of commands for interacting with Git including `:Gbrowse`
  use { "tpope/vim-fugitive" }

  -- Add GitHub support to Fugitive
  use { "tpope/vim-rhubarb" }

  -- Show various git UI
  use {
    "lewis6991/gitsigns.nvim",
    tag = "release",
    config = function()
      require("gitsigns").setup({
        show_deleted = false,
        signcolumn = true,
        numhl = true,
        linehl = false,
        word_diff = false,
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text_pos = 'eol',
          delay = 1500,
        },
        current_line_blame_formatter = '<author> [<author_time>] <summary>',
        current_line_blame_formatter_opts = {
          relative_time = true,
        },
      })
    end
  }

  ------------------------------------------------------------------------------
  -- Treesitter
  ------------------------------------------------------------------------------

  -- Highlight, edit, and navigate code
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  -- Show the context of the current module, method, function etc if the full
  -- definition doesn't fit in the available screen space
  use { "nvim-treesitter/nvim-treesitter-context" }

  ------------------------------------------------------------------------------
  -- Searching etc
  ------------------------------------------------------------------------------

  -- FZF
  use "junegunn/fzf"
  use "junegunn/fzf.vim"

  -- Allow seaching using FZF syntax
  --
  -- "telescope-fzf-native.nvim is a c port of fzf. It only covers the algorithm
  -- and implements few functions to support calculating the score. This means
  -- that the fzf syntax is supported:"
  --
  -- +------------+----------------------------+------------------------------------+
  -- | Token      | Match type                 | Description                        |
  -- +------------+----------------------------+------------------------------------+
  -- | sbtrkt     | fuzzy-match                | Items that match sbtrkt            |
  -- | 'wild      | exact-match (quoted)       | Items that include wild            |
  -- | ^music     | prefix-exact-match         | Items that start with music        |
  -- | .mp3$      | suffix-exact-match         | Items that end with .mp3           |
  -- | !fire      | inverse-exact-match        | Items that do not include fire     |
  -- | !^music    | inverse-prefix-exact-match | Items that do not start with music |
  -- | !.mp3$     | inverse-suffix-exact-match | Items that do not end with .mp3    |
  -- +------------+---------------------------+-------------------------------------+
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim", commit = "master",
    requires = {
      {"nvim-lua/plenary.nvim"}
    },
    config = function ()

      -- If multiple file selections are detected, open each file. If hitting
      -- <CR> on a single selection fall back to the default behaviour.
      -- https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1679797700
      local select_one_or_multi = function(prompt_bufnr)
        local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
        local multi = picker:get_multi_selection()
        if not vim.tbl_isempty(multi) then
          require('telescope.actions').close(prompt_bufnr)
          for _, j in pairs(multi) do
            if j.path ~= nil then
              vim.cmd(string.format("%s %s", "edit", j.path))
            end
          end
        else
          require('telescope.actions').select_default(prompt_bufnr)
        end
      end

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              -- Open files on <Enter>. See above.
              ["<CR>"] = select_one_or_multi,
            }
          },

          -- Update the title of the preview window dynamically, where it is supported
          dynamic_preview_title = true,

          -- Sort results bottom up
          sorting_strategy = 'descending',

          -- How transparent to make the Telescope window
          winblend = 5,

          -- Stack windows vertically, rather than the default
          layout_strategy = 'vertical',

          -- Configure the layout
          layout_config = {

            -- Take up nearly all of the available space
            height = 0.95,
            width = 0.95,

            -- Make the preview window take up more vertical space
            preview_height = 0.60,

            -- Makes sure that the prompt, results, and preview windows all show at once
            preview_cutoff = 0,
          },
        },
        pickers = {
          -- For the buffers picker only
          buffers = {
            mappings = {
              i = {
                -- Delete buffers using CTRL-D. Works for multiple selections.
                ["<C-d>"] = require("telescope.actions").delete_buffer,
              },
              n = {
                -- Delete buffers using CTRL-D. Works for multiple selections.
                ["<C-d>"] = require("telescope.actions").delete_buffer,
              },
            },
          },
        },
      })

      -- Load telescope-fzf-native.nvim extension
      require('telescope').load_extension('fzf')
    end
  }

  -- Displays a popup with possible key bindings of the command you started typing
  -- Useful for learning new keybindings
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500 -- The amount of time to wait before showing which-key
      require("which-key").setup {
        window = {
          border = "single", -- More space around the window
          winblend = 5, -- Semi-transparent window
        },
        layout = {
          align = "center" -- Align columns center
        },
      }
    end
  }

  -- Noice replaces the UI for messages, cmdline and the popupmenu
  -- Cmdline appears in the centre of the screen for example.
  use {
    "folke/noice.nvim",
    requires = {
      {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify"
      }
    },
    config = function ()
      require("noice").setup({

        -- override the look and feel of the popup cmdline prompt
        views = {
          cmdline_popup = {
            title = "",
            position = {
              row = "30%",
              col = "50%",
            },
            border = {
              style = "none",
              padding = { 1, 1 },
            },
            filter_options = {},
            win_options = {
              winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
          },
        },

        messages = {
          enabled = false,
        },

        lsp = {
          -- turn off the progress indicator
          progress = {
            enabled = false,
          },

          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },

        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end
  }

  -- Highlight, list and search todo comments
  use {
    "folke/todo-comments.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    },
    config = function ()
      require("todo-comments").setup()
    end
  }

  -- Highlight current search matches
  use { "PeterRincker/vim-searchlight" }

  ------------------------------------------------------------------------------
  -- Language/framework specific plugins
  ------------------------------------------------------------------------------

  -- Projectionist provides granular project configuration using "projections"
  use { "tpope/vim-projectionist" }

  -- Ruby language
  use { "vim-ruby/vim-ruby" }

  -- Rails helpers
  use { "tpope/vim-rails" }

  -- Support for Ruby's Bundler
  use { "tpope/vim-bundler" }

  -- Elixir language
  use { "elixir-lang/vim-elixir" }

  use {
    "elixir-tools/elixir-tools.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    },
    config = function ()
      require("elixir").setup()
    end
  }

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

  -- Zig language support
  use { "ziglang/zig.vim" }

  -- Add common programming words so they don't show up as spelling mistakes
  use { "psliwka/vim-dirtytalk", run = ":DirtytalkUpdate" }

  ------------------------------------------------------------------------------
  -- UI
  ------------------------------------------------------------------------------

  -- Allows checking Markdown `- [ ]` checkboxes using `<leader>tt`
  use { "jkramer/vim-checkbox" }

  -- Git co-authorship helper
  use { "maxjacobson/vim-fzf-coauthorship" }

  -- Tree view
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function ()
      require("nvim-tree").setup({
        filters = {
          -- Hide .git and node_modules directories
          custom = {
            "^\\.git$",
            "node_modules",
          },
        },
      })
    end
  }

  -- Replace the statusline with something fancier
  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "nvim-tree/nvim-web-devicons", opt = true
    },
    config = function ()
      require("lualine").setup {
        options = {
          -- No icons
          icons_enabled = false,

          -- Use the built-in support from the current colorscheme
          theme = "auto",

          -- Remove separators between components and sections
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {"mode"},
          lualine_b = {"branch", "diff", "diagnostics"},
          lualine_c = {"filename"},
          lualine_x = {"encoding", "fileformat", "filetype", "filesize"},
          lualine_y = {"progress"},
          lualine_z = {"location"},
        }
      }
    end
  }

  -- Colorize hex css-like colours in code
  use({
    "NvChad/nvim-colorizer.lua",
    config = function()
      require ("colorizer").setup({
        filetypes = {
          'css',
          'scss',
          'javascript',
          eelixir = { mode = "foreground" }
        },
        user_default_options = {
          RGB = true,          -- #RGB hex codes
          RRGGBB = true,       -- #RRGGBB hex codes
          names = true,        -- "Name" codes like Blue or blue
          RRGGBBAA = true,     -- #RRGGBBAA hex codes
          AARRGGBB = true,     -- 0xAARRGGBB hex codes
          rgb_fn = true,       -- CSS rgb() and rgba() functions
          hsl_fn = true,       -- CSS hsl() and hsla() functions
          mode = "background", -- Set the display mode.
          tailwind = true,     -- Enable tailwind colors
          always_update = true -- Update color values even if buffer is not focused
                               -- For example: cmp_menu, cmp_docs
        },
      })
    end
  })

  -- Add Tailwind CSS colour swatches to the nvim-cmp completion menu
  use({
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  })

  -- Highlight word under cursor on hover
  use {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure({
        providers = {
          -- Strangely, we only use regex matching. I'm only really looking to
          -- match word tokens to make sure they match or are spelt correctly
          -- and the LSP tries to do too much and doesn't seem to do a great job.
          'regex',
        },
        filetypes_denylist = {
          "markdown",
          "NvimTree",
        }
      })
    end
  }

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

  -- Extend and create a/i textobjects
  use {
    'echasnovski/mini.ai',
    config = function ()
      require('mini.ai').setup()
    end
  }

  -- Shows symbol overview for the current buffer
  use({
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup()
    end
  })

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require("packer").sync()
  end
end)

-- LSP settings.
-- This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
-- Add any additional override configuration in the following tables. They will be passed to
-- the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        -- Get the language server to recognize the various globals
        -- This stops warnings in Neovim Lua config files
        globals = {
          'vim',
          'require',
        },
      },
    },
  },

  tailwindcss = {},
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

cmp.setup {

  -- Setup nvim-cmp to work with Luasnip snippets engine
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  -- Show borders around the completions popups
  -- Makes the popup menus easier to see
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  -- Keybindings to interact with the completion UI
  mapping = cmp.mapping.preset.insert {

    -- Scroll up the documentation window
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),

    -- Scroll down the documentation window
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    --
    ['<C-Space>'] = cmp.mapping.complete {},

    -- Close the completion menu and don't complete anything when pressing <Esc>
    ['<C-e>'] = cmp.mapping.close(),

    -- Confirm the suggested completion
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },

    -- Move to the next completion option
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),

    -- Move in reverse to the previous completion option
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },

  -- completion sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lsp_signature_help' },
    {
      name = 'buffer',
      -- The number of characters that need to be typed to trigger auto-completion.
      keyword_length = 3,
      option = {
        -- Look in all open buffers for buffer completions
        -- https://github.com/hrsh7th/cmp-buffer#all-buffers
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
    { name = 'path' },
  },

  -- Shows completion text as grayed as you type
  -- Hard to explain, so see `:h cmp-config.experimental.ghost_text`
  experimental = {
    ghost_text = true,
  },

  -- Formatting of the menu
  formatting = {
    format = lspkind.cmp_format({

      -- Boolean to show the `~` expandable indicator in cmp's floating window
      expandable_indicator = true,

      -- Show the icon, then the text description
      mode = 'symbol_text',

      -- Prevent the popup from showing more than provided characters
      -- (e.g 50 will not show more than 50 characters)
      maxwidth = 50,

      -- When popup menu exceed maxwidth, the truncated part would show
      -- ellipsis_char instead (must define maxwidth first)
      ellipsis_char = '...',

      -- Show abbreviated source next to each entry
      menu = {
        buffer = "[BUF]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[LUA]",
        path = "[PATH]",
        luasnip = "[SNIP]",
      },

      -- We want to keep the existing formatting provided by lspkind whilst
      -- also using `tailwindcss-colorizer-cmp` to add colours for the
      -- Tailwind CSS LSP so we call the `tailwindcss-colorizer-cmp` formatter here.
      before = function (entry, vim_item)
        return require('tailwindcss-colorizer-cmp').formatter(entry, vim_item)
      end
    })
  },
}

require("cmp_jira").setup()

-- Set completion sources for `gitcommit` buffers
cmp.setup.filetype('gitcommit', {

  -- Look for git and Jira completions first and then fallback to buffer if there are none
  sources = cmp.config.sources({
    { name = 'git' },
    { name = 'jira' },
  }, {
    { name = 'buffer' },
  })
})

local format = require("cmp_git.format")
local sort = require("cmp_git.sort")

require("cmp_git").setup({
  -- enable for for git commit buffers only
  filetypes = { "gitcommit" },

  -- in order of most to least prioritized
  remotes = { "upstream", "origin" },

  enableRemoteUrlRewrites = false,

  git = {
    commits = {
      limit = 100,
      sort_by = sort.git.commits,
      format = format.git.commits,
    },
  },
  -- GitHub specific configuration

  github = {
    issues = {
      fields = { "title", "number", "body", "updatedAt", "state" },
      filter = "all", -- assigned, created, mentioned, subscribed, all, repos
      limit = 100,
      state = "all", -- open, closed, all
      sort_by = sort.github.issues,
      format = format.github.issues,
    },
    mentions = {
      limit = 100,
      sort_by = sort.github.mentions,
      format = format.github.mentions,
    },
    pull_requests = {
      fields = { "title", "number", "body", "updatedAt", "state" },
      limit = 100,
      state = "all", -- open, closed, merged, all
      sort_by = sort.github.pull_requests,
      format = format.github.pull_requests,
    },
  },

  -- trigger keymaps
  trigger_actions = {
    {
      debug_name = "git_commits",
      trigger_character = ":",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.git:get_commits(callback, params, trigger_char)
      end,
    },
    {
      debug_name = "github_issues_and_pr",
      trigger_character = "#",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.github:get_issues_and_prs(callback, git_info, trigger_char)
      end,
    },
    {
      debug_name = "github_mentions",
      trigger_character = "@",
      action = function(sources, trigger_char, callback, params, git_info)
        return sources.github:get_mentions(callback, git_info, trigger_char)
      end,
    },
  },
})

-- Disable virtual_text (inline) diagnostics and use floating window
-- format the message such that it shows source, message and
-- the error code.
--
-- Show the message with <space>e
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  float = {
    border = "single",
    format = function(diagnostic)
      return string.format(
      "%s (%s) [%s]",
      diagnostic.message,
      diagnostic.source,
      diagnostic.code or diagnostic.user_data.lsp.code
      )
    end,
  },
})
