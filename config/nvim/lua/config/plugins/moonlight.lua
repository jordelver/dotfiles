return {
  "shaunsingh/moonlight.nvim",
  branch = "pure-lua",
  config = function ()
    require("config.colorscheme_overrides")
    vim.g.moonlight_style = "moonlight"
    vim.cmd.colorscheme "moonlight"
  end
}
