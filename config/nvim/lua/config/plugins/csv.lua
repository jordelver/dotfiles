return {
  -- Highlight columns in CSV files
  {
    "mechatroner/rainbow_csv",
    config = function ()
      vim.g.rcsv_colorpairs = {
        {'NONE', '#4f4b76'},
        {'NONE', '#706b90'},
        {'NONE', '#938eab'},
        {'NONE', '#b6b2c6'},
        {'NONE', '#dad8e2'},
        {'NONE', '#4f4b76'},
        {'NONE', '#706b90'},
        {'NONE', '#938eab'},
        {'NONE', '#b6b2c6'},
        {'NONE', '#dad8e2'}
      }
    end
  }
}
