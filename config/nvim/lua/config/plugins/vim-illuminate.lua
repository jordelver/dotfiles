return {
  -- Highlight word under cursor on hover
  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure({
        providers = {
          -- Strangely, we only use regex matching. I'm only really looking to
          -- match word tokens to make sure they match or are spelt correctly
          -- and the LSP tries to do too much and doesn't seem to do a great job.
          'regex',
        },
        filetypes_denylist = {
          "markdown",
          "NvimTree",
          "qf",
        }
      })
    end
  }
}
