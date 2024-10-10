-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
--
vim.g.mapleader = "\\"

vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 20 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.relativenumber = true
vim.opt.swapfile = false -- creates a swapfile

vim.opt.foldenable = true
vim.opt.foldlevelstart = -1
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"

-- disable logging, enable it back if needed for debbuging
vim.lsp.set_log_level("off")
