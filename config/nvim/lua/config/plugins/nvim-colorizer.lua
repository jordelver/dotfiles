return {
  -- Colorize hex css-like colours in code
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require ("colorizer").setup({
        filetypes = {
          'css',
          'scss',
          'javascript',
          eelixir = { mode = "foreground" }
        },
        user_default_options = {
          RGB = true,          -- #RGB hex codes
          RRGGBB = true,       -- #RRGGBB hex codes
          names = true,        -- "Name" codes like Blue or blue
          RRGGBBAA = true,     -- #RRGGBBAA hex codes
          AARRGGBB = true,     -- 0xAARRGGBB hex codes
          rgb_fn = true,       -- CSS rgb() and rgba() functions
          hsl_fn = true,       -- CSS hsl() and hsla() functions
          mode = "background", -- Set the display mode.
          tailwind = true,     -- Enable tailwind colors
          always_update = true -- Update color values even if buffer is not focused
                               -- For example: cmp_menu, cmp_docs
        },
      })
    end
  }
}
