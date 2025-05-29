return {
  -- Highlight, list and search todo comments
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    opts = {
      highlight = {
        pattern = [[.*<(KEYWORDS)\s*]], -- removes the colon requirement
      },
      search = {
        pattern = [[\b(KEYWORDS)\b]], -- removes the colon requirement
      },
    },
  }
}
