local status_ok, go = pcall(require, "go")
if not status_ok then
  return
end

local dapgo_status_ok, dapgo = pcall(require, "dap-go")
if not dapgo_status_ok then
  return
end

go.setup({
  -- Disable automatic LSP signature help to avoid popup spam
  lsp_cfg = {
    handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { silent = true }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        silent = true,
        focusable = false,
        border = "rounded",
      }),
    },
  },
  lsp_inlay_hints = {
    enable = false, -- Disable inline hints that might appear while typing
  },
})
dapgo.setup()
