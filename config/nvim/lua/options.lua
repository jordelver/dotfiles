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

-- When a word is CamelCased, assume "Cased" is a separate word: every
-- upper-case character in a word that comes after a lower case character
-- indicates the start of a new word.
--
-- So, "LiveBook" would not be considered a spelling mistake.
vim.opt.spelloptions = "camel"

-- Open new horizontal splits below the current one
vim.opt.splitbelow = true

-- Open new vertical splits to the right of the current one
vim.opt.splitright = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Turn off mouse support
-- When focussing the terminal by clicking it's window the cursor is moves which I find undesirable.
vim.opt.mouse = ""

-- Don't show the mode ("-- INSERT --" etc) in the Cmdline
-- We have lualine.nvim setup as a statusline replacement and it would show up
-- twice every time we change mode - ick.
vim.opt.showmode = false

-- Turn on and set the winbar contents
-- The winbar is a statusbar-like UI element that shows at the top of each buffer
-- Show the full filename right-aligned
vim.opt.winbar = '%=%m %f'

-- Frankly, I don't care. Just use all the memory. kthx
-- I was running out of memory whilst using Telescope and I ain't got time for that.
vim.opt.maxmempattern = 2000000
