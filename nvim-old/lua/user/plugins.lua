local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin Mangager
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Lua Development
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-lua/popup.nvim"
  use "christianchiarulli/lua-dev.nvim"
  -- use "folke/lua-dev.nvim"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "ray-x/lsp_signature.nvim"
  use "SmiteshP/nvim-navic"
  -- use 'stevearc/aerial.nvim' -- try it out later
  use "simrat39/symbols-outline.nvim"
  use "b0o/SchemaStore.nvim"
  use "RRethy/vim-illuminate"
  use "j-hui/fidget.nvim"
  use "lvimuser/lsp-inlayhints.nvim"
  -- use "simrat39/inlay-hints.nvim"
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

  -- Completion
  use "christianchiarulli/nvim-cmp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use "onsails/lspkind.nvim"
  -- use { "tzachar/cmp-tabnine", run = "./install.sh" }

  -- Snippet
  -- use "L3MON4D3/LuaSnip" --snippet engine
  -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Syntax/Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "kylechui/nvim-surround"

  -- Marks
  -- use "christianchiarulli/harpoon"
  -- use "MattesGroeger/vim-bookmarks"

  -- Fuzzy Finder/Telescope
  use "nvim-telescope/telescope.nvim"
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- use "nvim-telescope/telescope-media-files.nvim"
  -- use "tom-anders/telescope-vim-bookmarks.nvim"

  -- Note Taking
  -- use "mickael-menu/zk-nvim"

  -- Color
  use "norcalli/nvim-colorizer.lua"
  -- use "ziontee113/color-picker.nvim"
  -- use "max397574/colortils.nvim"
  use {
    "max397574/colortils.nvim",
    cmd = "Colortils",
  }

  -- Colorschemes
  use 'navarasu/onedark.nvim'
  -- use 'joshdick/onedark.vim'
  use "lunarvim/onedarker.nvim"
  use "lunarvim/darkplus.nvim"
  -- use "folke/tokyonight.nvim"
  -- use "lunarvim/colorschemes"

  -- Utility
  use "rcarriga/nvim-notify"
  use "stevearc/dressing.nvim"
  -- use "ghillb/cybu.nvim"
  -- use "moll/vim-bbye"
  -- use "lewis6991/impatient.nvim"
  -- use "lalitmee/browse.nvim"

  -- Registers
  -- use "tversteeg/registers.nvim"

  -- Icon
  use "kyazdani42/nvim-web-devicons"
  use "ChristianChiarulli/neovim-codicons"
  use 'mortepau/codicons.nvim'

  -- Debugging
  use  "klen/nvim-test" 
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use 'leoluz/nvim-dap-go'
  use 'mfussenegger/nvim-dap-python'
  use "theHamsta/nvim-dap-virtual-text"
  use({
    "andythigpen/nvim-coverage",
    requires = "nvim-lua/plenary.nvim",
  })
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
      "nvim-neotest/neotest-python",
      "folke/neodev.nvim"
    }
  }
  -- use "Pocco81/DAPInstall.nvim"

  -- Tabline
  -- use "akinsho/bufferline.nvim"
  -- use "tiagovla/scope.nvim"
  -- use "NvChad/ui"

  -- Statusline
  use "christianchiarulli/lualine.nvim"

  -- Startup
  use "goolord/alpha-nvim"

  -- Indent
  use {"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}}

  -- File Explorer
  use "nvim-tree/nvim-tree.lua"
  -- use "christianchiarulli/lir.nvim"

  -- Comment
  use "numToStr/Comment.nvim"
  use "folke/todo-comments.nvim"

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Project
  use "ahmedkhalf/project.nvim"
  use "windwp/nvim-spectre"

  -- Session
  -- use "rmagatti/auto-session"
  -- use "rmagatti/session-lens"

  -- Quickfix
  -- use "kevinhwang91/nvim-bqf"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"
  use "ruifm/gitlinker.nvim"
  -- use "mattn/vim-gist"
  -- use "mattn/webapi-vim"
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Github
  use "pwntester/octo.nvim"

  -- Editing Support
  use "windwp/nvim-autopairs"
  -- use "monaqa/dial.nvim"
  -- use "nacro90/numb.nvim"
  use "andymass/vim-matchup"
  -- use "folke/zen-mode.nvim"
  -- use "Pocco81/true-zen.nvim"
  use "karb94/neoscroll.nvim"
  -- use "junegunn/vim-slash"

  -- Motion
  use "phaazon/hop.nvim"
  -- use "jinh0/eyeliner.nvim"

  -- Keybinding
  use "folke/which-key.nvim"

  -- Golang
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommanded if need floating window support

  -- Typescript TODO: set this up, also add keybinds to ftplugin
  use "jose-elias-alvarez/typescript.nvim"

  -- Markdown
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }
  -- Fold
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- VIM chrome
  use {
      'glacambre/firenvim',
      run = function() vim.fn['firenvim#install'](0) end 
  }

  use("nathom/filetype.nvim")

  -- Jupyter
  -- use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }
  -- use { 'luk400/vim-jukit' }


  -- Graveyard
  -- use "romgrk/nvim-treesitter-context"
  -- use "mizlan/iswap.nvim"
  -- use {'christianchiarulli/nvim-ts-rainbow'}
  -- use "nvim-telescope/telescope-ui-select.nvim"
  -- use "nvim-telescope/telescope-file-browser.nvim"
  -- use 'David-Kunz/cmp-npm' -- doesn't seem to work
  -- use { "christianchiarulli/JABS.nvim" }
  -- use "tpope/vim-repeat"
  -- use "Shatur/neovim-session-manager"
  -- use "metakirby5/codi.vim"
  -- use { "nyngwang/NeoZoom.lua", branch = "neo-zoom-original" }
  -- use "rcarriga/cmp-dap"
  -- use "filipdutescu/renamer.nvim"
  -- use "https://github.com/rhysd/conflict-marker.vim"
  -- use "rebelot/kanagawa.nvim"
  -- use "unblevable/quick-scope"
  -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  -- use "gbprod/cutlass.nvim"
  -- use "christianchiarulli/lsp-inlay-hints"
  -- use "rmagatti/goto-preview"
  -- use "stevearc/aerial.nvim"
  -- use "nvim-lua/lsp_extensions.nvim"
  -- use { "christianchiarulli/nvim-gps", branch = "text_hl" }
  -- use "stevearc/stickybuf.nvim"
  -- use "folke/trouble.nvim"
  -- use "drybalka/tree-climber.nvim"
  -- use "phaazon/hop.nvim"
  -- use { "michaelb/sniprun", run = "bash ./install.sh" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)