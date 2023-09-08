vim.cmd [[
  " Open a split for each dirty file in git
  function! OpenChangedFiles()
    only " Close all windows, unless they're modified
    let status = system('git status -s | grep "^ \?\(M\|A\|UU\|??\)" | sed "s/^.\{3\}//"')
    let filenames = split(status, "\n")
    exec "edit " . filenames[0]
    for filename in filenames[1:]
      exec "split " . filename
    endfor
  endfunction
  command! OpenChangedFiles :call OpenChangedFiles()

  " Restart Rails from within Vim using
  " Stolen from http://joncairns.com/2012/11/restarting-thin-or-passenger-rails-server-from-vim/
  function! RestartRails(dir)
    let l:ret = system("touch ".a:dir."/tmp/restart.txt")
    if l:ret == ""
      echo "Restarting Rails"
    else
      echohl Error | echo "Failed to restart Rails - is your working directory a Rails app?" | echohl None
    endif
  endfunction
  command! RestartRails call RestartRails(getcwd())

  " FZF Buffer Delete
  " https://www.reddit.com/r/neovim/comments/mlqyca/fzf_buffer_delete/
  function! s:list_buffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
  endfunction

  function! s:delete_buffers(lines)
    execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
  endfunction

  command! BD call fzf#run(fzf#wrap({
    \ 'source': s:list_buffers(),
    \ 'sink*': { lines -> s:delete_buffers(lines) },
    \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
    \ }))
]]
