return {
  -- Noice replaces the UI for messages, cmdline and the popupmenu
  -- Cmdline appears in the centre of the screen for example.
  {
    "folke/noice.nvim",
    enabled = false,
    dependencies = {
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
}
