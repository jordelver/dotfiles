-- Reload config
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Clear search highlighting when hitting <enter> in normal mode, but not in
-- the command-line window or quickfix/location list
vim.keymap.set('n', '<cr>', function()
  if vim.fn.getcmdwintype() == '' and vim.bo.filetype ~= 'qf' then
    return ':nohlsearch<cr>'
  else
    return '<cr>'
  end
end, { expr = true })

-- Search within visual selections
-- https://www.reddit.com/r/neovim/comments/1kv7som/search_within_selection_in_neovim/
vim.keymap.set('x', '/', '<C-\\><C-n>`</\\%V', { desc = 'Search forward within visual selection' })
vim.keymap.set('x', '?', '<C-\\><C-n>`>?\\%V', { desc = 'Search backward within visual selection' })

-- Mappings for yanking/pasting to system clipboard (+)
vim.keymap.set('v', '<leader>d', '"+d', { noremap = true })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('v', '<leader>p', '"+p', { noremap = true })
vim.keymap.set('v', '<leader>P', '"+P', { noremap = true })
vim.keymap.set('n', '<leader>d', '"+d', { noremap = true })
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true })
vim.keymap.set('n', '<leader>P', '"+P', { noremap = true })

-- Unmap arrow keys!
vim.keymap.set('', '<Left>', '<Nop>')
vim.keymap.set('', '<Right>', '<Nop>')
vim.keymap.set('', '<Up>', '<Nop>')
vim.keymap.set('', '<Down>', '<Nop>')

-- Toggle file tree explorer visibility
vim.keymap.set('', '<leader>nt', ':lua Snacks.picker.explorer()<cr>', { noremap = true })

-- Easier git blaming
vim.keymap.set('', '<leader>gb', '<cmd>Git blame<cr>', { noremap = true })

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

-- Highlight yanks
vim.api.nvim_create_augroup("custom_buffer", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "custom_buffer",
  pattern = "*",
  callback = function() vim.highlight.on_yank { timeout = 200 } end
})
