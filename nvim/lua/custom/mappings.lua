---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["gr"] = { "<cmd>Telescope lsp_references<CR>", "LSP references" },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-p>"] = { "<cmd>Telescope projects<CR>", "Toggle telescope projects", opts = { nowait = true } },
    ["<C-m>"] = { "<cmd>SymbolsOutline<CR>", "Toggle symbol outline", opts = { nowait = true } },
    ["<leader>fg"] = { "<cmd>Telescope dir live_grep<CR>", "Find in folder", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.dap = {
  n = {
    ["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
    -- c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    -- i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
    -- o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
    ["<leader>dO"] = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
    -- r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
    ["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
    ["<leader>dt"] = { "<cmd>lua require'dap-go'.debug_test()<cr>", "Test" },
    -- u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
    -- x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },

    ["<leader>dR"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    ["<leader>dE"] = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
    ["<leader>dC"] = {
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
      "Conditional Breakpoint",
    },
    ["<leader>dU"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
    -- b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    ["<leader>dd"] = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    ["<leader>de"] = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    ["<leader>dg"] = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    ["<leader>dh"] = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    ["<leader>dS"] = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    ["<leader>dp"] = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    ["<leader>dq"] = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    ["<leader>ds"] = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    -- t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    ["<leader>dx"] = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  },
}

M.neotest = {
  n = {
    ["<leader>rs"] = { '<cmd>lua require("neotest").run.run()<cr>', "Test Nearest" },
    ["<leader>rl"] = { '<cmd>lua require("neotest").run.run_last()<cr>', "Test Last" },
    ["<leader>rf"] = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', "Test File" },

    ["<leader>rp"] = { '<cmd>lua require("neotest").summary.toggle()<cr>', "Test Summary" },

    ["<leader>rO"] = {
      '<cmd>lua require("neotest").output_panel.toggle({ last_run = true, enter = true })<cr>',
      "Test Output panel",
    },
    ["<leader>ro"] = { '<cmd>lua require("neotest").output.open({ enter = true, last_run = true })<cr>', "Test Output" },
  },
}

-- more keybinds!

return M
