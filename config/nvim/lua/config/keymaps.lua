-- Reload config
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Clear search highlighting when hitting <enter> in normal mode, but not in the command-line window
vim.keymap.set('n', '<cr>', function()
  if vim.fn.getcmdwintype() == '' then
    return ':nohlsearch<cr>'
  else
    return '<cr>'
  end
end, { expr = true })

-- Unmap arrow keys!
vim.keymap.set('', '<Left>', '<Nop>')
vim.keymap.set('', '<Right>', '<Nop>')
vim.keymap.set('', '<Up>', '<Nop>')
vim.keymap.set('', '<Down>', '<Nop>')

-- Toggle nvim-tree visibility
vim.keymap.set('', '<leader>nt', '<cmd>NvimTreeToggle<cr>', { noremap = true })

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
