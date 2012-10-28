"" Use to pathogen to manage plugins
call pathogen#infect()

set nocompatible                " choose no compatibility with legacy vi

"" Enable syntax highlighting
syntax enable

"" Treat *.ru files as ruby files (remove this if using vim-ruby)
au BufRead,BufNewFile *.ru setfiletype ruby

set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show syntax highlighting groups for word under cursor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

