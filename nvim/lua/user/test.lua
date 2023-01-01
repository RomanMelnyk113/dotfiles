local status_ok, test = pcall(require, "nvim-test")
if not status_ok then
  return
end

-- local status_ok, test = pcall(require, "nvim-test.runnners.go")
-- if not status_ok then
--   return
-- end

test.setup {
  run = true,                 -- run tests (using for debug)
  commands_create = true,     -- create commands (TestFile, TestLast, ...)
  filename_modifier = ":.",   -- modify filenames before tests run(:h filename-modifiers)
  silent = false,             -- less notifications
  term = "terminal",          -- a terminal to run ("terminal"|"toggleterm")
  termOpts = {
    direction = "float",   -- terminal's direction ("horizontal"|"vertical"|"float")
    width = 150,               -- terminal's width (for vertical|float)
    height = 44,              -- terminal's height (for horizontal|float)
    go_back = false,          -- return focus to original window after executing
    stopinsert = "auto",      -- exit from insert mode (true|false|"auto")
    keep_one = true,          -- keep only one terminal for testing
  },
  runners = {               -- setup tests runners
    cs = "nvim-test.runners.dotnet",
    go = "nvim-test.runners.go-test",
    haskell = "nvim-test.runners.hspec",
    javascriptreact = "nvim-test.runners.jest",
    javascript = "nvim-test.runners.jest",
    lua = "nvim-test.runners.busted",
    python = "nvim-test.runners.pytest",
    ruby = "nvim-test.runners.rspec",
    rust = "nvim-test.runners.cargo-test",
    typescript = "nvim-test.runners.jest",
    typescriptreact = "nvim-test.runners.jest",
  }
}

require("nvim-test.runners.go-test"):setup {
    command = "gotest",
    -- args = { "-race", "-v" },
    args = {
      "-v",
      -- "-race",
      "-count=1"
    },
    file_pattern = "\\v([^.]+_test)\\.go$", -- determine whether a file is a testfile
    find_files = { "{name}_test.go" }, -- find testfile for a file
    filename_modifier = nil,           -- modify filename before tests run (:h filename-modifiers)
    working_directory = nil,           -- set working directory (cwd by default)
  }
