-- Highlight commands to override the main colorscheme
vim.cmd [[
  " Override colorscheme with my own highlights every
  " time a colorscheme is sourced
  augroup OverrideColorScheme
    autocmd!
    autocmd ColorScheme * call ColorSchemeOverrides()
  augroup END

  function! ColorSchemeOverrides() abort
    " Override `CursorLine` highlighting
    highlight CursorLine        guifg=NONE guibg=#191919
    highlight CursorColumn      guifg=NONE guibg=#191919

    " Override search highlighting
    highlight Search            guifg=#080808 guibg=#ffd700 gui=NONE
    highlight Searchlight       guifg=#080808 guibg=#ffaf00 gui=NONE

    " Highlight text that goes over 50 characters in git commit messages
    highlight gitcommitOverflow guifg=#cc0000 guibg=NONE

    " Highlight TODO comments
    highlight rubyTODO          guifg=#eeeeee guibg=#2d2c5d
    highlight elixirTodo        guifg=#eeeeee guibg=#2d2c5d
    highlight vimTODO           guifg=#eeeeee guibg=#2d2c5d
    highlight jsCommentTodo     guifg=#eeeeee guibg=#2d2c5d
    highlight rustTodo          guifg=#eeeeee guibg=#2d2c5d
    highlight luaTodo           guifg=#eeeeee guibg=#2d2c5d
  endfunction
]]

-- Set colorscheme (theme)
vim.cmd [[ colorscheme moonlight ]]
