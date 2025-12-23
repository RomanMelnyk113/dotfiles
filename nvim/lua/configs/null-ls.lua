local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- NOTE: All formatting has been moved to conform.nvim
-- none-ls is now only used for diagnostics/linting
null_ls.setup {
  debug = false,
  temp_dir = vim.fn.stdpath("cache") .. "/null-ls", -- Use cache directory for temp files
  should_attach = function(bufnr)
    -- Don't attach to certain file types to avoid issues
    local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
    return ft ~= ""
  end,
  -- on_attach = on_attach,
  sources = {
    -- Diagnostics only (formatting handled by conform.nvim)
    diagnostics.sqlfluff.with({
        extra_args = { "--dialect", "clickhouse" }, -- change to your dialect
    }),
    diagnostics.djlint.with {
      extra_filetypes = { "tpl" }
    },

    -- Uncomment additional diagnostics as needed:
    -- diagnostics.flake8,
    -- diagnostics.revive,
    -- diagnostics.golangci_lint,
    -- diagnostics.staticcheck,
    -- diagnostics.shellcheck,
  },
}
