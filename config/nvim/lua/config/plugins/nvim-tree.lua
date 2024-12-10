return {
  -- Tree view
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function ()
      require("nvim-tree").setup({
        filters = {
          -- Hide .git and node_modules directories
          custom = {
            "^\\.git$",
            "node_modules",
          },
        },
      })
    end
  }
}
