return {
  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  -- Show the context of the current module, method, function etc if the full
  -- definition doesn't fit in the available screen space
  { "nvim-treesitter/nvim-treesitter-context" }
}
