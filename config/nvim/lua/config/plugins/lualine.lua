return {
  -- Replace the statusline with something fancier
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
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
}
