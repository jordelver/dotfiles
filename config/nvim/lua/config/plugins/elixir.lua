return {
  -- Elixir language
  { "elixir-lang/vim-elixir" },
  {
    "elixir-tools/elixir-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function ()
      require("elixir").setup()
    end
  }
}
