-- nvim-tree is a file explorer tree for neovim
-- https://github.com/nvim-tree/nvim-tree.lua

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<C-n>', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree', silent = true },
    -- { '\\', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree', silent = true },
    -- { '<leader>e', '<cmd>NvimTreeFocus<CR>', desc = 'Focus NvimTree', silent = true },
  },
  config = function()
    require('nvim-tree').setup {
      -- Disable netrw at the very start of your init.lua
      disable_netrw = true,
      hijack_netrw = true,
      sync_root_with_cwd = true,

      -- Git integration (from old config)
      git = {
        enable = true,
        ignore = false,
      },

      -- Renderer settings (from old config)
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
      },

      -- View settings
      view = {
        width = 30,
        side = 'left',
      },

      -- Filters
      filters = {
        dotfiles = false,
        custom = { '.git', 'node_modules', '.cache' },
      },

      -- Update focused file
      update_focused_file = {
        enable = true,
        update_root = true,
      },

      -- Actions
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            enable = true,
          },
        },
      },
    }
  end,
}
