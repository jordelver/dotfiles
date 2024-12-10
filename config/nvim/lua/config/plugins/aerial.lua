return {
  -- Shows symbol overview for the current buffer
  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup()
    end
  }
}
