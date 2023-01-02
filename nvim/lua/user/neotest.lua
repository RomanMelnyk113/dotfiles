local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
  return
end

neotest.setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-plenary"),
    require("neotest-go")({
      dap = { justMyCode = true },
      experimental = {
        test_table = true,
      },
      args = { "-count=1", "-timeout=60s" }
    }),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "go", "vim", "lua" },
    }),
  },
})
