-- Neotest - A framework for interacting with tests within Neovim
-- https://github.com/nvim-neotest/neotest

return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',

    -- Test adapters
    'nvim-neotest/neotest-plenary',
    'nvim-neotest/neotest-python',
    -- 'nvim-neotest/neotest-vim-test',
    'fredrikaverpil/neotest-golang', -- Using neotest-golang instead of neotest-go

    -- Optional: for debugging tests
    'mfussenegger/nvim-dap',
  },
  keys = {
    -- Test execution
    {
      '<leader>rs',
      function()
        require('neotest').run.run()
      end,
      desc = 'Run nearest test',
    },
    {
      '<leader>rl',
      function()
        require('neotest').run.run_last()
      end,
      desc = 'Run last test',
    },
    {
      '<leader>rf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = 'Run test file',
    },
    {
      '<leader>dt',
      function()
        require('neotest').run.run { strategy = 'dap' }
      end,
      desc = 'Debug nearest test',
    },

    -- Test output and summary
    {
      '<leader>rp',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'Toggle test summary',
    },
    {
      '<leader>ro',
      function()
        require('neotest').output.open { enter = true, last_run = true }
      end,
      desc = 'Show test output',
    },
    {
      '<leader>rO',
      function()
        require('neotest').output_panel.toggle { last_run = true, enter = true }
      end,
      desc = 'Toggle test output panel',
    },

    -- Test navigation
    {
      ']t',
      function()
        require('neotest').jump.next { status = 'failed' }
      end,
      desc = 'Jump to next failed test',
    },
    {
      '[t',
      function()
        require('neotest').jump.prev { status = 'failed' }
      end,
      desc = 'Jump to previous failed test',
    },
  },
  config = function()
    local neotest = require 'neotest'

    -- Define icons
    local icons = {
      passed = '✓',
      running = '',
      failed = '✗',
      skipped = '⊘',
      unknown = '?',
      running_animated = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
    }

    neotest.setup {
      adapters = {
        -- Python adapter with DAP support
        require('neotest-python') {
          dap = { justMyCode = false },
        },

        -- Plenary adapter for testing Neovim plugins
        require 'neotest-plenary',

        -- Golang adapter (neotest-golang instead of neotest-go)
        require('neotest-golang') {
          go_test_args = {
            '-count=1',
            '-timeout=60s',
            '-coverprofile=coverage.out',
          },
        },
      },

      -- Status configuration
      status = {
        enabled = true,
        signs = true,
        virtual_text = false,
      },

      -- UI configuration
      icons = {
        child_indent = '│',
        child_prefix = '├',
        collapsed = '─',
        expanded = '╮',
        failed = icons.failed,
        final_child_indent = ' ',
        final_child_prefix = '╰',
        non_collapsible = '─',
        passed = icons.passed,
        running = icons.running,
        running_animated = icons.running_animated,
        skipped = icons.skipped,
        unknown = icons.unknown,
        watching = '',
      },

      -- Floating window configuration
      floating = {
        border = 'rounded',
        max_height = 0.8,
        max_width = 0.8,
      },

      -- Output configuration
      output = {
        open_on_run = false,
      },

      -- Summary window configuration
      summary = {
        enabled = true,
        animated = true,
        follow = true,
        expand_errors = true,
        open = 'botright vsplit | vertical resize 50',
        mappings = {
          attach = 'a',
          clear_marked = 'M',
          clear_target = 'T',
          debug = 'd',
          debug_marked = 'D',
          expand = { '<CR>', '<2-LeftMouse>' },
          expand_all = 'e',
          jumpto = 'i',
          mark = 'm',
          next_failed = 'J',
          output = 'o',
          prev_failed = 'K',
          run = 'r',
          run_marked = 'R',
          short = 'O',
          stop = 'u',
          target = 't',
          watch = 'w',
        },
      },

      -- Diagnostic configuration
      diagnostic = {
        enabled = true,
        severity = vim.diagnostic.severity.ERROR,
      },

      -- Quickfix configuration
      quickfix = {
        enabled = true,
        open = false,
      },
    }

    -- Set up signs for test status in the sign column
    vim.fn.sign_define('neotest_passed', { text = icons.passed, texthl = 'NeotestPassed' })
    vim.fn.sign_define('neotest_failed', { text = icons.failed, texthl = 'NeotestFailed' })
    vim.fn.sign_define('neotest_running', { text = icons.running, texthl = 'NeotestRunning' })
    vim.fn.sign_define('neotest_skipped', { text = icons.skipped, texthl = 'NeotestSkipped' })
    vim.fn.sign_define('neotest_unknown', { text = icons.unknown, texthl = 'NeotestUnknown' })

    -- Define highlight groups
    vim.api.nvim_set_hl(0, 'NeotestPassed', { fg = '#96C763' })
    vim.api.nvim_set_hl(0, 'NeotestFailed', { fg = '#E06C75' })
    vim.api.nvim_set_hl(0, 'NeotestRunning', { fg = '#E5C07B' })
    vim.api.nvim_set_hl(0, 'NeotestSkipped', { fg = '#56B6C2' })
    vim.api.nvim_set_hl(0, 'NeotestUnknown', { fg = '#6A9589' })
  end,
}
