return {
  -- Show various git UI
  {
    "lewis6991/gitsigns.nvim",
    tag = "release",
    config = function()
      require("gitsigns").setup({
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
}
