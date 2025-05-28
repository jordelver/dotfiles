return {
  -- Git from Vim
  -- Adds a _lot_ of commands for interacting with Git including `:GBrowse`
  {
    "tpope/vim-fugitive",
    config = function()
      -- Alias Gbrowse -> GBrowse because I can't type
      vim.api.nvim_create_user_command('Gbrowse', 'GBrowse', {})
    end
  },

  -- Add GitHub support to Fugitive
  { "tpope/vim-rhubarb" }
}
