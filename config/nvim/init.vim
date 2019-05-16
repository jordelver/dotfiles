filetype off

" Load file type plugins + indentation
filetype plugin indent on

" Set the shell explicitly as we're using Fish
set shell=/bin/bash

" Enable syntax highlighting
syntax enable

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

" Highlight the current column
set cursorcolumn

" Show tab completions for commands (`:<tab>`)
set wildmenu

" Maintain 3 lines of context when the cursor approaches end of the window
set scrolloff=3

" Map the leader key to <space>
let mapleader=" "

" Fuzzily open files
map <C-p> :FZF<cr>
map <leader>f :Files<cr>
map <leader>b :Buffers<cr>
map <leader>l :Lines<cr>

" Clear search highlights when hitting <enter>
nmap <cr> <Plug>SearchantStop

" Split lines, opposite of `J`
nnoremap S :SplitLine<cr>

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

" Mappings for yanking/pasting to system clipboard (+)
vnoremap <leader>d "+d
vnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>P "+P
nnoremap <leader>d "+d
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Copy whole file (keeping cursor position)
nnoremap <Leader>c :%y+<CR>

" Alias :Q to :q
command! Q q
command! Qall qall

" Alias :Wq to :wq
command! Wq wq

" Show the 80 character column gutter
set colorcolumn=80

" Show Git Gutter signs more quickly
set updatetime=100

" Turn off the 80 character column for quickfix (search results, etc) windows
autocmd BufReadPost quickfix setlocal colorcolumn=0

" Enter insert mode straight away when editing git commit messages
autocmd FileType gitcommit execute "normal! O" | startinsert

" Turn off spell checking for quickfix (search results, etc) windows
" and Fugitive git blame windows
autocmd BufReadPost,FileType quickfix,fugitiveblame setlocal nospell

" Treat `.envrc` files as shell for ENV variable highlighting
autocmd BufNewFile,BufRead .envrc set filetype=sh

" Wrap Markdown files to 80 characters
autocmd FileType markdown setlocal textwidth=80

" Turn spell check on for Markdown
autocmd BufReadPost,FileType markdown setlocal spell

" Turn off folding for git buffers (specifically this is for `:GV`)
autocmd! FileType git setlocal foldlevel=1

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-css-color'
Plug 'timakro/vim-searchant'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/OnSyntaxChange'
Plug 'drzel/vim-split-line'
Plug 'w0rp/ale'

" Language/framework specific plugins
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'elixir-lang/vim-elixir'
Plug 'dag/vim-fish'
Plug 'rust-lang/rust.vim'
Plug 'slim-template/vim-slim'
Plug 'posva/vim-vue'

" Colorschemes
Plug 'haishanh/night-owl.vim'

call plug#end()

" Use 24-bit colour
if (has("termguicolors"))
 set termguicolors
endif

" Set colorscheme (theme)
colorscheme night-owl

" Override nightowl's `CursorLine` highlighting
highlight CursorLine ctermfg=NONE ctermbg=233 cterm=NONE guifg=NONE guibg=#191919 gui=NONE
highlight CursorColumn ctermfg=NONE ctermbg=233 cterm=NONE guifg=NONE guibg=#191919 gui=NONE

" Override search highlighting
highlight Search ctermfg=NONE ctermbg=NONE guifg=#080808 guibg=#ffd700 gui=NONE cterm=NONE
highlight SearchCurrent ctermfg=NONE ctermbg=NONE guifg=#080808 guibg=#ffaf00 gui=NONE cterm=NONE

" Highlight text that goes over 50 characters in git commit messages
highlight gitcommitOverflow ctermfg=NONE ctermbg=NONE guifg=#cc0000 guibg=NONE gui=NONE cterm=NONE

" Highlight TODO comments
highlight rubyTODO ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#eeeeee guibg=#2d2c5d gui=NONE
highlight vimTODO ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#eeeeee guibg=#2d2c5d gui=NONE

" ale options so linters only run on save
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0

" Show syntax highlighting groups for word under cursor
" Useful for changing theme colours
nmap <leader>hg :call <SID>SynStack()<CR>
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

" Make FZF preview files when searching
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

