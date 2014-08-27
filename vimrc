set nocompatible
filetype off

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
  silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  silent !vim +PluginInstall +qall
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle required!
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ervandew/supertab'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/xterm-color-table.vim'
Plugin 'itspriddle/vim-marked'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mileszs/ack.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'vim-scripts/matchit.zip'
Plugin 'tpope/vim-tbone'
Plugin 'jgdavey/vim-turbux'

call vundle#end()
filetype plugin indent on

"" Enable syntax highlighting
syntax enable

"" Treat *.ru files as ruby files (remove this if using vim-ruby)
au BufRead,BufNewFile *.ru setfiletype ruby

"" Make the Sign Column always show up
au BufRead,BufNewFile * call ShowSignColumn()

"" Turn off the 80 character column for quickfix (search results, etc) windows
au BufReadPost quickfix setlocal colorcolumn=0

"" Turn off spell checking for quickfix (search results, etc) windows
"" and Fugitive git blame windows
au BufReadPost,FileType quickfix,fugitiveblame setlocal nospell

"" Enter insert mode straight away when editing git commit messages
au FileType gitcommit execute "normal! O" | startinsert

set encoding=utf-8

"" Show current command information at the bottom of the screen
set showcmd

"" Load file type plugins + indentation
filetype plugin indent on

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set smarttab

"" Automatically re-read files if they change on disk
set autoread

"" Briefly indicate closing brackets
set showmatch

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Turn on line numbers
set number

"" Show shell-like command completions when in command mode (:)
set wildmenu

"" Maintain 3 lines of context when the cursor approaches end of the window
set scrolloff=3

"" Always show the status bar
set laststatus=2

"" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode

"" Set colorscheme (theme)
colorscheme all_hallows_eve

"" Show 'invisible' characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:#
set list

"" Show the 80 character column gutter
if exists("&colorcolumn")
  set colorcolumn=80
endif

"" Show the filename in the window titlebar
set title

"" Turn on spell checking
set spell

"" Disable markdown folding
let g:vim_markdown_folding_disabled=1

"" Key bindings
let mapleader="," " change the mapleader from \ to ,

map <C-f> :Ack<space>
map <leader>n :NERDTreeToggle<CR>
map <leader>m :MarkedOpen<CR>
nnoremap <CR> :nohlsearch<CR>
nnoremap <leader>l :NumbersToggle<CR>
nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

"" Add shortcut for adding the ticket number to git commit messages
nmap <leader>cn jjf#s#

"" Unmap arrow keys!
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"" Move windows without having to press w
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"" Remap ` to ' as it's more convenient to type
"" ' jumps to the line of the mark
"" ` jumps to the line and column of the mark
nnoremap ' `
nnoremap ` '

"" Ignore source control directories and friends in CTRL-P searches
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.swp,.DS_Store,*cache*/*

"" Bind :Q to :q
command! Q q
command! Qall qall

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close all buffers which are not visible
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show syntax highlighting groups for word under cursor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add a 'dummy' sign to the Sign Column to make it show up all the time
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ShowSignColumn()
  sign define dummy
  execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
endfunc

