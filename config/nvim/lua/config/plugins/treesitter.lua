return {
  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
  },

  -- Show the context of the current module, method, function etc if the full
  -- definition doesn't fit in the available screen space
  { "nvim-treesitter/nvim-treesitter-context" }
}
