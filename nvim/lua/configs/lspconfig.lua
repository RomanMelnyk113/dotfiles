local nvlsp = require "nvchad.configs.lspconfig"

nvlsp.defaults() -- loads nvchad's defaults

local servers = { "html", "cssls", "gopls", "sqls", "pyright", "vtsls" }

-- Use new vim.lsp.config API for Neovim 0.11+
if vim.fn.has('nvim-0.11') == 1 then
  for _, lsp in ipairs(servers) do
    vim.lsp.config[lsp] = {
      cmd = vim.lsp.config[lsp] and vim.lsp.config[lsp].cmd or nil,
      filetypes = vim.lsp.config[lsp] and vim.lsp.config[lsp].filetypes or nil,
      root_markers = vim.lsp.config[lsp] and vim.lsp.config[lsp].root_markers or nil,
      capabilities = nvlsp.capabilities,
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
    }

    -- Enable the LSP
    vim.lsp.enable(lsp)
  end
else
  -- Fallback to old lspconfig for older Neovim versions
  local lspconfig = require "lspconfig"
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end
end

-- Without the loop, you would have to manually set up each LSP 
-- 
-- lspconfig.html.setup {
--   on_attach = nvlsp.on_attach,
--   capabilities = nvlsp.capabilities,
-- }
