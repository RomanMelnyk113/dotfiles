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

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

vim.g.codeium_os = 'Darwin'
vim.g.codeium_arch = 'arm64'

-- vim.g.python_host_prog = '/Users/romanmelnyk/.venvs/nvim/bin/python3'
-- vim.g.python3_host_prog = '/Users/romanmelnyk/.venvs/nvim/bin/python3'
