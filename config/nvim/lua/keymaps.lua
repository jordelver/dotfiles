--------------------------------------------------------------------------------
-- Leader key
--------------------------------------------------------------------------------

-- Map the leader key to <space>
vim.g.mapleader = " "

--------------------------------------------------------------------------------
-- Editing
--------------------------------------------------------------------------------

-- Split lines, opposite of `J`
vim.keymap.set('n', 'S', ':SplitLine<cr>', { noremap = true })

-- Move lines up and down whilst in NORMAL mode
vim.keymap.set('n', '<C-j>', ':m .+1<cr>==', { noremap = true })
vim.keymap.set('n', '<C-k>', ':m .-2<cr>==', { noremap = true })

-- Move lines up and down whilst in INSERT mode
vim.keymap.set('i', '<C-j>', '<Esc>:m .+1<CR>==gi', { noremap = true })
vim.keymap.set('i', '<C-k>', '<Esc>:m .-2<CR>==gi', { noremap = true })

-- Move lines up and down whilst in VISUAL mode
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true })

-- Move function arguments left and right
vim.keymap.set('n', '<C-h>', ':SidewaysLeft<cr>', { noremap = true })
vim.keymap.set('n', '<C-l>', ':SidewaysRight<cr>', { noremap = true })

--------------------------------------------------------------------------------
-- Config helpers
--------------------------------------------------------------------------------

-- Edit this file
vim.keymap.set('n', '<leader>ev', ':edit $MYVIMRC<cr>', { silent = true })

-- Edit plugins
vim.keymap.set('n', '<leader>ep', ':edit ~/.config/nvim/lua/plugins.lua<cr>', { silent = true })

-- Edit keymaps
vim.keymap.set('n', '<leader>ek', ':edit ~/.config/nvim/lua/keymaps.lua<cr>', { silent = true })

-- Source this file
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<cr>', { silent = true })

--------------------------------------------------------------------------------
-- Yanking/pasting
--------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------
-- Searching
--------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------
-- Test runners
--------------------------------------------------------------------------------

-- vim-test
vim.keymap.set('n', 't<C-n>', ':TestNearest<cr>', { silent = true })
vim.keymap.set('n', 't<C-f>', ':TestFile<cr>', { silent = true })
vim.keymap.set('n', 't<C-s>', ':TestSuite<cr>', { silent = true })
vim.keymap.set('n', 't<C-l>', ':TestLast<cr>', { silent = true })
vim.keymap.set('n', 't<C-g>', ':TestVisit<cr>', { silent = true })

-- plenary
vim.keymap.set('n', '<leader>t', '<Plug>PlenaryTestFile', { silent = true })

--------------------------------------------------------------------------------
-- Miscellaneous
--------------------------------------------------------------------------------

-- Unmap arrow keys!
vim.keymap.set('', '<Left>', '<Nop>')
vim.keymap.set('', '<Right>', '<Nop>')
vim.keymap.set('', '<Up>', '<Nop>')
vim.keymap.set('', '<Down>', '<Nop>')

-- Toggle NERDTree visibility
vim.keymap.set('', '<leader>nt', ':NERDTreeToggle<cr>', { noremap = true })

-- Toggle spellcheck
vim.keymap.set('n', '<leader>s', ':set spell!<cr>')

-- Move windows without having to press w
vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-l>', '<C-w>l')