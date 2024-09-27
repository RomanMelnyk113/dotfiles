local lsp1 = require('nvchad.configs.lspconfig')
local on_attach = lsp1.on_attach
local capabilities = lsp1.capabilities

local lspconfig = require"lspconfig"


-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "ts_ls", "gopls", "pyright", "sqls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup()
-- require'lspconfig'.pyright.setup{}
-- 
vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', { desc="LSP references" })
vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', { desc="LSP definitions" })
