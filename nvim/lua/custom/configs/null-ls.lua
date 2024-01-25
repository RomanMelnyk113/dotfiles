local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- npm install --save-dev prettier 
null_ls.setup {
  debug = false,
  -- on_attach = on_attach,
  sources = {
    formatting.prettier.with {
      extra_filetypes = { "toml" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    formatting.shfmt,
    formatting.isort,
    formatting.gofmt,
    formatting.goimports,
    formatting.goimports_reviser,
    formatting.sqlfluff.with({
        extra_args = { "--dialect", "postgres" }, -- change to your dialect
    }),
    diagnostics.flake8,
    -- diagnostics.revive,
    -- diagnostics.golangci_lint,
    -- diagnostics.staticcheck,
    diagnostics.sqlfluff.with({
        extra_args = { "--dialect", "postgres" }, -- change to your dialect
    }),
    diagnostics.shellcheck,
    diagnostics.djlint.with { 
      extra_filetypes = { "tpl" }
    },
  },
}
