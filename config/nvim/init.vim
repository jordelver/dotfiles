filetype off

" Load file type plugins + indentation
filetype plugin indent on

" Set the shell explicitly as we're using Fish
set shell=/bin/bash

" Enable syntax highlighting
syntax enable

" Set colorscheme (theme)
colorscheme all_hallows_eve

" Highlight matches
set hlsearch

" Incremental searching
set incsearch

" Searches are case insensitive...
set ignorecase

" ... unless they contain at least one capital letter
set smartcase

" Turn on line numbers
set number

" Don't wrap lines
set nowrap

" A tab is two spaces
set tabstop=2 shiftwidth=2

" Use spaces, not tabs
set expandtab

" Backspace through everything in insert mode
set backspace=indent,eol,start
set smarttab

" Show 'invisible' characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:#
set list

" Automatically re-read files if they change on disk
set autoread

" Always show the status bar (ensures vim-airline bar is always shown)
set laststatus=2

" Highlight the current line
set cursorline

" Show tab completions for commands (`:<tab>`)
set wildmenu

" Maintain 3 lines of context when the cursor approaches end of the window
set scrolloff=3

" Map the leader key to , (default: \)
let mapleader=" "

" Fuzzy file search
map <C-p> :FZF<cr>

" Clear search highlights when hitting <enter>
nmap <cr> <Plug>SearchantStop

" Toggle line numbers on/off
nnoremap <leader>l :NumbersToggle<cr>

" Toggle NERDTree
map <leader>n :NERDTreeToggle<CR>

" Toggle spellcheck
nmap <silent> <leader>s :set spell!<cr>

" Edit this file
nmap <silent> <leader>ev :edit $MYVIMRC<cr>

" Source this file
nmap <silent> <leader>sv :source $MYVIMRC<cr>

" Unmap arrow keys!
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Move windows without having to press w
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Alias :Q to :q
command! Q q
command! Qall qall

" Alias :Wq to :wq
command! Wq wq

" Show the 80 character column gutter
set colorcolumn=80

" Turn off the 80 character column for quickfix (search results, etc) windows
autocmd BufReadPost quickfix setlocal colorcolumn=0

" Enter insert mode straight away when editing git commit messages
autocmd FileType gitcommit execute "normal! O" | startinsert

" Turn off spell checking for quickfix (search results, etc) windows
" and Fugitive git blame windows
autocmd BufReadPost,FileType quickfix,fugitiveblame setlocal nospell

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'kchmck/vim-coffee-script'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-css-color'
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elixir-lang/vim-elixir'
Plug 'dag/vim-fish'
Plug 'rust-lang/rust.vim'
Plug 'timakro/vim-searchant'

call plug#end()

" Show syntax highlighting groups for word under cursor
" Useful for changing theme colours
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
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
    exec "vs " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

