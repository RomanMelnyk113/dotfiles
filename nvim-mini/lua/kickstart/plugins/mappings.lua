-- General mappings that don't belong to a specific plugin
-- Based on NvChad defaults and custom mappings

-- Fold keymaps
vim.keymap.set('n', '<C-z>', 'za', { desc = 'Toggle fold', noremap = true, silent = true })

-- Map semicolon to colon for easier command mode access
vim.keymap.set('n', ';', ':', { desc = 'Enter command mode', nowait = true })

-- Format keymaps
vim.keymap.set('n', '<leader>fm', function()
  vim.lsp.buf.format { async = true }
end, { desc = 'Format buffer' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>lf', function()
  vim.diagnostic.open_float()
end, { desc = 'Open diagnostic float window' })

-- Save file with Ctrl+S
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Better indenting in visual mode
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })

-- Note: LSP keymaps like <leader>gd and <leader>gr are configured
-- in init.lua within the LspAttach autocmd

return {}
