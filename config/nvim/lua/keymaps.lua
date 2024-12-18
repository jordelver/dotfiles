--------------------------------------------------------------------------------
-- Leader key
--------------------------------------------------------------------------------

-- Map the leader key to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
vim.keymap.set('n', '<leader>ev', ':edit $MYVIMRC<cr>', { silent = true, desc = 'Edit init.lua' })

-- Edit plugins
vim.keymap.set('n', '<leader>ep', ':edit ~/.config/nvim/lua/plugins.lua<cr>', { silent = true, desc = 'Edit plugins' })

-- Edit keymaps
vim.keymap.set('n', '<leader>ek', ':edit ~/.config/nvim/lua/keymaps.lua<cr>', { silent = true, desc = 'Edit keymaps' })

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
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })

-- Grep the entire codebase
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })

-- Fuzzily find open buffers
vim.keymap.set('n', '<leader>fb', function ()
  require("telescope.builtin").buffers({
    -- Sorts all buffers by most recently used
    sort_mru = true,
  })
end
, { noremap = true, desc = 'Telescope buffers' })

-- Fuzzily find Neovim help topics
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })

-- Fuzzily find Git commits
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope git_commits<cr>', { noremap = true })

-- Fuzzily find Git commits authored by me
vim.keymap.set('n', '<leader>fmc', function ()
  require("telescope.builtin").git_commits({
    git_command = {
      "git",
      "log",
      "--pretty=oneline",
      "--abbrev-commit",
      "--author=Jordan Elver",
      "--",
      "."
    }
  })
end
, { noremap = true, desc = 'Telescope filter my git commits' })

-- Resume the last picker including any state
vim.keymap.set('n', '<leader>fr', function ()
    require("telescope.builtin").resume()
end
, { noremap = true, desc = 'Telescope resume previous' })

-- Grep for the word under the cursor
vim.keymap.set('n', '<leader>fw', '<cmd>Telescope grep_string<cr>', { noremap = true })

-- Grep for the visually selected word(s) under the cursor
vim.keymap.set('v', '<leader>fw', '<cmd>Telescope grep_string<cr>', { noremap = true })

-- Clear search highlighting when hitting <enter> in normal mode, but not in the command-line window
vim.keymap.set('n', '<cr>', function()
    if vim.fn.getcmdwintype() == '' then
        return ':nohlsearch<cr>'
    else
        return '<cr>'
    end
end, { expr = true })

--------------------------------------------------------------------------------
-- Diagnostic keymaps
--------------------------------------------------------------------------------

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

--------------------------------------------------------------------------------
-- Test runners
--------------------------------------------------------------------------------

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

-- Toggle nvim-tree visibility
vim.keymap.set('', '<leader>nt', '<cmd>NvimTreeToggle<cr>', { noremap = true })

-- Easier git blaming
vim.keymap.set('', '<leader>gb', '<cmd>Git blame<cr>', { noremap = true })

-- Open fuzzily searchable Rails routes in a tmux split
vim.keymap.set('n', '<leader>rr', ":silent !tmux split-window 'bin/rails routes | fzf'<cr>", { silent = true, desc = 'Search `rails routes`' })

-- Restart the Rails server
vim.keymap.set('n', '<leader>rs', ':RestartRails<cr>', { silent = true, desc = 'Restart the Rails server' })

-- Toggle spellcheck
vim.keymap.set('n', '<leader>s', ':set spell!<cr>', { desc = 'Toggle spellcheck' })

-- Move windows without having to press w
vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-l>', '<C-w>l')

-- Maximize the window both horizontally and vertically
-- When using splits <C-w>| maximizes the split size horizontally. <C-w>_ maximizes
-- the split size vertically. This command does both at once.
vim.api.nvim_set_keymap('n', '<C-w>m', ':wincmd _<CR>:wincmd |<CR>', { silent = true })
