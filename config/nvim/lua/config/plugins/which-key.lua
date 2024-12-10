return {
  -- Displays a popup with possible key bindings of the command you started typing
  -- Useful for learning new keybindings
  {
    "folke/which-key.nvim",
    enabled = false,
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
}
