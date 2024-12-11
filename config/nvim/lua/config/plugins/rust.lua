return {
  -- Rust language support
  {
    "rust-lang/rust.vim",
    config = function ()
      -- Automatically format rust files upon save
      vim.g.rustfmt_autosave = 1
    end
  }
}
