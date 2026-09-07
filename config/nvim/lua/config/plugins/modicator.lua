return {
  {
    'mawkler/modicator.nvim',
    dependencies = 'shaunsingh/moonlight.nvim',
    config = function ()
      require('modicator').setup()
    end,
  }
}
