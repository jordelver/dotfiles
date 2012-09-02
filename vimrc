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

"" Start NERDTree at startup
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * wincmd l

"" Key bindings
let mapleader="," " change the mapleader from \ to ,

map <C-f> :Ack<space>
map <leader>n :NERDTreeToggle<CR>
map <leader>m :MarkedOpen<CR>
nnoremap <CR> :nohlsearch<CR>
nnoremap <leader>l :NumbersToggle<CR>

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
