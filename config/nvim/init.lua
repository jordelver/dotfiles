-- Set the shell explicitly as we're using Fish
vim.opt.shell = "/bin/bash"

-- Allow easy switching of buffers by only confirming save when closing them
vim.opt.confirm = true

-- Show substitutions 'live' as you type
vim.opt.inccommand = "nosplit"

-- Searches are case insensitive...
vim.opt.ignorecase = true

-- ... unless they contain at least one capital letter
vim.opt.smartcase = true

-- Turn on line numbers
vim.opt.number = true

-- Don't wrap lines
vim.opt.wrap = false

-- A tab is two spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Use spaces, not tabs
vim.opt.expandtab = true

-- Backspace through everything in insert mode
vim.opt.backspace = {"indent", "eol", "start"}
vim.opt.smarttab = true

-- Show 'invisible' characters
vim.opt.listchars = {tab  = "▸ ", trail = "·", eol = "¬", nbsp = "_", extends = "#"}
vim.opt.list = true

-- Highlight the current line
vim.opt.cursorline = true

-- Highlight the current column
vim.opt.cursorcolumn = true

-- Show the 80 character column gutter
vim.opt.colorcolumn = "80"

-- Maintain 3 lines of context when the cursor approaches end of the window
vim.opt.scrolloff = 3

-- Maintain undo history between sessions
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undodir/")

-- Show Git Gutter signs more quickly
vim.opt.updatetime = 100

-- Enable 24-bit colour
-- Uses "gui" attributes instead of "cterm" attributes.
vim.opt.termguicolors = true

-- Use a programming dictionary from https://github.com/psliwka/vim-dirtytalk/
-- as well as English
vim.opt.spelllang = {"en", "programming"}

-- Map the leader key to <space>
vim.g.mapleader = " "

-- Fuzzily find files
vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })

-- Grep the entire codebase
vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })

-- Fuzzily find open buffers
vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })

-- Fuzzily find Neovim help topics
vim.keymap.set('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })

-- Fuzzily find Git commits
vim.keymap.set('n', '<Leader>fc', '<cmd>Telescope git_commits<cr>', { noremap = true })

-- Grep for the word under the cursor
vim.keymap.set('n', '<Leader>fw', '<cmd>Telescope grep_string<cr>', { noremap = true })

-- Clear search highlights when hitting <enter>
vim.keymap.set('n', '<cr>', ':nohlsearch<cr>')

-- Split lines, opposite of `J`
vim.keymap.set('n', 'S', ':SplitLine<cr>', { noremap = true })

-- Toggle NERDTree visibility
vim.keymap.set('', '<leader>nt', ':NERDTreeToggle<cr>', { noremap = true })

-- Toggle spellcheck
vim.keymap.set('n', '<leader>s', ':set spell!<cr>')

-- Edit this file
vim.keymap.set('n', '<leader>ev', ':edit $MYVIMRC<cr>', { silent = true })

-- Edit plugins
vim.keymap.set('n', '<leader>ep', ':edit ~/.config/nvim/lua/plugins.lua<cr>', { silent = true })

-- Source this file
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<cr>', { silent = true })

-- Unmap arrow keys!
vim.keymap.set('', '<Left>', '<Nop>')
vim.keymap.set('', '<Right>', '<Nop>')
vim.keymap.set('', '<Up>', '<Nop>')
vim.keymap.set('', '<Down>', '<Nop>')

-- Move windows without having to press w
vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-l>', '<C-w>l')

-- Mappings for yanking/pasting to system clipboard (+)
vim.keymap.set('v', '<leader>d', '"+d', { noremap = true })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('v', '<leader>p', '"+p', { noremap = true })
vim.keymap.set('v', '<leader>P', '"+P', { noremap = true })
vim.keymap.set('n', '<leader>d', '"+d', { noremap = true })
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true })
vim.keymap.set('n', '<leader>P', '"+P', { noremap = true })

-- Copy whole file (keeping cursor position)
vim.keymap.set('n', '<leader>c', ':%y+<cr>', { noremap = true })

-- Move lines up and down whilst in NORMAL mode
vim.keymap.set('n', '<C-j>', ':m .+1<cr>==', { noremap = true })
vim.keymap.set('n', '<C-k>', ':m .-2<cr>==', { noremap = true })

-- Move lines up and down whilst in INSERT mode
vim.keymap.set('i', '<C-j>', '<Esc>:m .+1<CR>==gi', { noremap = true })
vim.keymap.set('i', '<C-k>', '<Esc>:m .-2<CR>==gi', { noremap = true })

-- Move lines up and down whilst in VISUAL mode
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true })

-- vim-test mappings
vim.keymap.set('n', 't<C-n>', ':TestNearest<cr>', { silent = true })
vim.keymap.set('n', 't<C-f>', ':TestFile<cr>', { silent = true })
vim.keymap.set('n', 't<C-s>', ':TestSuite<cr>', { silent = true })
vim.keymap.set('n', 't<C-l>', ':TestLast<cr>', { silent = true })
vim.keymap.set('n', 't<C-g>', ':TestVisit<cr>', { silent = true })

-- plenary test runner
vim.keymap.set('n', '<leader>t', '<Plug>PlenaryTestFile', { silent = true })

-- Move function arguments left and right
vim.keymap.set('n', '<C-h>', ':SidewaysLeft<cr>', { noremap = true })
vim.keymap.set('n', '<C-l>', ':SidewaysRight<cr>', { noremap = true })

-- Alias some keys
vim.cmd [[
  " Alias :Q to :q
  command! Q q
  command! Qall qall

  " Alias :Wq to :wq
  command! Wq wq

  " Override colorscheme with my own highlights every
  " time a colorscheme is sourced
  augroup OverrideColorScheme
    autocmd!
    autocmd ColorScheme * call ColorSchemeOverrides()
  augroup END
]]

require("plugins")

-- Configure languages so we get syntax highlighting in Markdown files
vim.g.markdown_fenced_languages = {'bash', 'elixir', 'fish', 'html', 'javascript', 'ruby', 'rust', 'typescript', 'vim'}

-- Highlight commands to override the main colorscheme
vim.cmd [[
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
vim.cmd [[
  colorscheme moonlight
]]

vim.cmd [[
  " Show syntax highlighting groups for word under cursor
  " Useful for changing theme colours
  nmap <leader>hg :call SynStack()<CR>
  function! SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endfunc

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
  nmap <leader>rr :call RestartRails(getcwd())<cr>

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