return {
  -- Run things asynchronously without blocking Vim
  {
    "tpope/vim-dispatch",
    config = function ()
      -- Make the dispatch tmux window bigger
      vim.g.dispatch_quickfix_height = 20
    end
  }
}
