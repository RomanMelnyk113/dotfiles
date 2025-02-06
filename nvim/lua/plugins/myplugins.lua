local overrides = require "configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "configs.conform"
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require "configs.project"
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    lazy = false,
    config = function()
      require "configs.null-ls"
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = function()
      require "configs.symbol-outline"
    end,
  },
  {
    "linrongbin16/gitlinker.nvim",
    config = function()
      require("gitlinker").setup()
    end,
  },
  {
    "princejoogie/dir-telescope.nvim",
    -- telescope.nvim is a required dependency
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("dir-telescope").setup {
        -- these are the default options set
        hidden = true,
        no_ignore = false,
        show_preview = true,
      }
    end,
  },

  -- Testing
  {
    "nvim-neotest/neotest",
    config = function()
      require("configs.neotest")
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
      "nvim-neotest/neotest-python",
      "folke/neodev.nvim",
    },
  },
  -- DAP
  {
    "leoluz/nvim-dap-go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require "configs.dap"
    end,
  },

  -- GOlang
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require "configs.go"
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.diffview"
    end,
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.coverage"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, { name = "codeium" })
      table.insert(opts.sources, { name = "vim-dadbod-completion" })
    end,
  },
  {
    'Exafunction/codeium.vim',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    event = 'BufEnter',
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', 'll', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true, noremap = true})
      vim.keymap.set('i', '<C-]>', function() return vim.fn['codeium#CycleCompletions'](1) end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<C-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
        { expr = true, silent = true })
      vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
      -- require("codeium").setup({})
    end
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'plsql', 'clickhouse' }, lazy = true }, -- Optional
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = {
  --     sources = {
  --       { name = "codeium" },
  --       { name = "vim-dadbod-completion" },
  --       { name = "gopls" },
  --     },
  --     -- mapping = {
  --     --   ["<C-Space>"] = require "nvchad.configs.cmp".mapping.complete(), -- Replace with whatever you want
  --     -- },
  --   },
  -- },
  -- { "mfussenegger/nvim-dap-python" },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
