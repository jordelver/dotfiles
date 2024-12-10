return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",

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
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    keys = {
      -- Fuzzily find files
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzily find files" },

      -- Grep the entire codebase
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Fuzzily grep" },

      -- Fuzzily find open buffers
      {
        "<leader>fb", function()
          require("telescope.builtin").buffers({
            -- Sorts all buffers by most recently used
            sort_mru = true
          })
        end,
        desc = 'Telescope buffers'
      },

      -- Fuzzily find Neovim help topics
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Fuzzily find Neovim help topics" },

      -- Fuzzily find Git commits
      { "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Fuzzily find Git commits" },

      -- Fuzzily find Git commits authored by me
      {
        "<leader>fmc", function ()
          require("telescope.builtin").git_commits({
            git_command = {
              "git",
              "log",
              "--pretty=oneline",
              "--abbrev-commit",
              "--author=Jordan Elver",
              "--",
              "."
            }
          })
        end,
        desc = 'Telescope filter my git commits'
      },

      -- Resume the last picker including any state
      { "<leader>fr", function () require("telescope.builtin").resume() end, desc = 'Telescope resume previous' },

      -- Grep for the word under the cursor
      { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Grep word under cursor", mode = { "n", "v" } },
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
        extensions = {
          fzf = {}
        }
      })

      -- Load telescope-fzf-native.nvim extension
      require('telescope').load_extension('fzf')
    end
  }
}
