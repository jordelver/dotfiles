return {
  -- Highlight, list and search todo comments
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function ()
      require("todo-comments").setup()
    end
  }
}
