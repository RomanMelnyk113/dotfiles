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

  -- nvim-notify - Elegant notifications
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local status_ok, notify = pcall(require, "notify")
      if not status_ok then
        return
      end
      notify.setup {
        stages = "fade_in_slide_out",
        timeout = 3000,
        background_colour = "#000000",
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },
        max_width = 50,
        max_height = 10,
        render = "compact",
      }
      vim.notify = notify
    end,
  },

  -- noice.nvim - Modern UI for messages, cmdline and popups
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      local status_ok, noice = pcall(require, "noice")
      if not status_ok then
        return
      end
      noice.setup {
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            enabled = true,
          },
          signature = {
            enabled = true,
          },
          progress = {
            enabled = true,
            format = "lsp_progress",
            format_done = "lsp_progress_done",
            view = "mini",
          },
        },
        presets = {
          bottom_search = true,
          command_palette = false,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
        cmdline = {
          view = "cmdline",
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              kind = "",
              find = "written",
            },
            opts = { skip = true },
          },
        },
        views = {
          cmdline_popup = {
            border = {
              style = "rounded",
            },
          },
        },
      }
    end,
  },

  -- indent-blankline.nvim - Indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    config = function()
      local status_ok, ibl = pcall(require, "ibl")
      if not status_ok then
        return
      end
      ibl.setup {
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = false,
          injected_languages = true,
          highlight = { "Function", "Label" },
          priority = 500,
        },
        exclude = {
          filetypes = {
            "help",
            "alpha",
            "dashboard",
            "nvim-tree",
            "Trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
        },
      }
    end,
  },

  -- dressing.nvim - Better UI for inputs and selects
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      local status_ok, dressing = pcall(require, "dressing")
      if not status_ok then
        return
      end
      dressing.setup {
        input = {
          enabled = true,
          default_prompt = "Input:",
          prompt_align = "left",
          insert_only = true,
          start_in_insert = true,
          border = "rounded",
          relative = "cursor",
          prefer_width = 40,
          width = nil,
          max_width = { 140, 0.9 },
          min_width = { 20, 0.2 },
          win_options = {
            winblend = 0,
            wrap = false,
          },
        },
        select = {
          enabled = true,
          backend = { "telescope", "builtin", "nui" },
          trim_prompt = true,
          telescope = require("telescope.themes").get_cursor {
            layout_config = {
              width = 0.8,
              height = 0.5,
            },
          },
          builtin = {
            border = "rounded",
            relative = "editor",
            win_options = {
              winblend = 0,
            },
            width = nil,
            max_width = { 140, 0.8 },
            min_width = { 40, 0.2 },
            height = nil,
            max_height = 0.9,
            min_height = { 10, 0.2 },
          },
        },
      }
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      local status_ok, conform = pcall(require, "conform")
      if not status_ok then
        return
      end
      conform.setup(require "configs.conform")
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.project"
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
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
      local status_ok, gitlinker = pcall(require, "gitlinker")
      if not status_ok then
        return
      end
      gitlinker.setup()
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
  {
    "nvim-mini/mini.pick",
    cmd = "Pick",
    keys = {
      { "<leader>fp", "<cmd>Pick files<cr>", desc = "Pick files" },
    },
    config = function()
      local status_ok, mini_pick = pcall(require, "mini.pick")
      if not status_ok then
        return
      end
      mini_pick.setup()
    end,
  },

  -- Testing
  {
    "nvim-neotest/neotest",
    config = function()
      require "configs.neotest"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-python",
      -- "nvim-neotest/neotest-vim-test",
      "fredrikaverpil/neotest-golang", -- Using neotest-golang instead of neotest-go
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

  -- Python venv selector
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    branch = "regexp",
    ft = "python",
    cmd = "VenvSelect",
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>",       desc = "Select VirtualEnv" },
      { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached VirtualEnv" },
    },
    config = function()
      local status_ok, venv_selector = pcall(require, "venv-selector")
      if not status_ok then
        return
      end
      venv_selector.setup {
        auto_refresh = true,
      }
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
    event = "InsertEnter",
    opts = function(_, opts)
      table.insert(opts.sources, { name = "windsurf" })
      table.insert(opts.sources, { name = "vim-dadbod-completion" })
    end,
  },
  {
    "Exafunction/windsurf.vim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    event = "BufEnter",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "kk", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true, noremap = true })
      vim.keymap.set("i", "<C-]>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-[>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
      -- require("codeium").setup({})
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
