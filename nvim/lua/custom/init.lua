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
