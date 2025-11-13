local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
  return
end
-- get neotest namespace (api call creates or returns namespace)
-- local neotest_ns = vim.api.nvim_create_namespace("neotest")
-- vim.diagnostic.config({
--   virtual_text = {
--     format = function(diagnostic)
--       local message =
--         diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
--       return message
--     end,
--   },
-- }, neotest_ns)

neotest.setup {
  adapters = {
    require "neotest-python" {
      dap = { justMyCode = false },
    },
    require "neotest-plenary",
    -- Golang adapter (neotest-golang instead of neotest-go)
    require "neotest-golang" {
      runner = "gotestsum",
      go_test_args = {
        "-count=1",
        "-timeout=60s",
        "-coverprofile=coverage.out",
      },
    },
    -- require("neotest-go")({
    --   -- experimental = {
    --   --   test_table = true,
    --   -- },
    --   args = { "-count=1", "-timeout=60s", "-coverprofile=coverage.out" }
    --   -- args = { "-count=1", "-race", "-timeout=60s", "-coverprofile=coverage.out" }
    --   -- args = { "-count=1", "-timeout=60s" }
    -- }),
    -- require("neotest-vim-test")({
    --   ignore_file_types = { "python", "vim", "lua" },
    -- }),
  },
  -- Output panel configuration for better visibility
  output = {
    enabled = true,
    open_on_run = true,
  },
  output_panel = {
    enabled = true,
    open = "botright split | resize 15",
  },
  -- Floating window configuration with borders
  floating = {
    border = "rounded", -- Options: "single", "double", "rounded", "solid", "shadow"
    max_height = 0.8,
    max_width = 0.9,
    options = {},
  },
  -- Summary window configuration
  summary = {
    enabled = true,
    expand_errors = true,
    follow = true,
    mappings = {
      attach = "a",
      expand = { "<CR>", "<2-LeftMouse>" },
      expand_all = "e",
      jumpto = "i",
      output = "o",
      run = "r",
      short = "O",
      stop = "u",
    },
  },
  -- Icons for better visual feedback
  icons = {
    passed = "✓",
    running = "●",
    failed = "✗",
    skipped = "○",
    unknown = "?",
  },
  -- Highlights for better contrast
  highlights = {
    passed = "NeotestPassed",
    running = "NeotestRunning",
    failed = "NeotestFailed",
    skipped = "NeotestSkipped",
  },
}
