return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    require("bufferline").setup({
      options = {
        mode = "tabs",
        show_buffer_close_icons = false
      }
    })
  end
}
