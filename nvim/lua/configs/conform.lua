local options = {
  formatters_by_ft = {
    -- Lua
    lua = { "stylua" },

    -- Web (JS/TS/CSS/HTML)
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    toml = { "prettier" },

    -- Python
    python = { "isort", "black" },

    -- Go
    go = { "goimports" }, -- goimports includes gofmt

    -- Shell
    sh = { "shfmt" },
    bash = { "shfmt" },

    -- SQL
    sql = { "sqlfluff" },
  },

  formatters = {
    prettier = {
      prepend_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    black = {
      prepend_args = { "--fast" },
    },
    sqlfluff = {
      prepend_args = { "--dialect", "clickhouse" },
    },
  },

  -- Uncomment to enable format on save
  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
