-- Snacks - Collection of useful Neovim utilities
-- https://github.com/folke/snacks.nvim
-- Provides: dashboard, notifications, smooth scrolling, indent guides, and more

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    -- Dashboard with recent files and quick actions
    dashboard = {
      enabled = true,
      preset = {
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
        ]],
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ':Telescope find_files' },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ':Telescope oldfiles' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ':Telescope live_grep' },
          { icon = ' ', key = 'c', desc = 'Config', action = ':e $MYVIMRC' },
          { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
          { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy', enabled = true },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
    },

    -- Smooth scrolling
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 15, total = 150 },
        easing = 'linear',
      },
    },

    -- Indent guides (replaces indent-blankline)
    indent = {
      enabled = true,
      char = '│',
      only_scope = false,
      only_current = false,
    },

    -- Scope highlighting
    scope = {
      enabled = true,
    },

    -- Input dialogs
    input = {
      enabled = true,
    },

    -- Notifications
    notifier = {
      enabled = false, -- Disabled because we're using nvim-notify via noice
    },

    -- Quick file navigation
    quickfile = {
      enabled = true,
    },

    -- Better statuscolumn
    statuscolumn = {
      enabled = false, -- Can enable if you want
    },

    -- Word highlighting
    words = {
      enabled = true,
    },

    -- Git integration
    git = {
      enabled = true,
    },

    -- Zen mode
    zen = {
      enabled = true,
    },
  },
  keys = {
    {
      '<leader>z',
      function()
        require('snacks').zen()
      end,
      desc = 'Toggle Zen Mode',
    },
    {
      '<leader>gg',
      function()
        require('snacks').lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>gB',
      function()
        require('snacks').git.blame_line()
      end,
      desc = 'Git Blame Line',
    },
    {
      '<leader>un',
      function()
        require('snacks').notifier.hide()
      end,
      desc = 'Dismiss All Notifications',
    },
  },
}
