-- Making :Q and :W case insensitive because I have fat fingers
-- https://www.reddit.com/r/neovim/comments/1lpvpgf/comment/n0y4x55/
vim.api.nvim_create_user_command("Q", "q", { bang = true })
vim.api.nvim_create_user_command("W", "w", { bang = true })
vim.api.nvim_create_user_command("Wq", "wq", { bang = true })

-- Alias Gbrowse -> GBrowse because I can't type
vim.api.nvim_create_user_command('Gbrowse', 'GBrowse', {})
