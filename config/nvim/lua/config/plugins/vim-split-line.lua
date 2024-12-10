return {
  -- Easily split the line at the cursor - opposite of `J`
  {
    "drzel/vim-split-line",
    config = function ()
      vim.keymap.set('n', 'S', ':SplitLine<cr>', { noremap = true })
    end
  }
}
