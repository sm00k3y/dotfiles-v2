-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- lua functions that many plugins use
  use("nvim-lua/plenary.nvim")

  -- Colorscheme
  use("folke/tokyonight.nvim")

  -- Vim-Tmux navigation with Vim keys (HJKL)
  use("christoomey/vim-tmux-navigator")

  -- Commenter
  use("numToStr/Comment.nvim")
  -- Extra plugin for context commenting jsx/tsx and others
  use('JoosepAlviste/nvim-ts-context-commentstring')

  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")

  -- File explorer (requires nvim-web-devicons)
  use("nvim-tree/nvim-tree.lua")

  -- Lua Statusline
  use("nvim-lualine/lualine.nvim")

  -- Native fzf - Makes telescope fuzzy finder quicker
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- Fuzzy Finder and previewer
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
  -- Using telescope for Code Actions
  use { 'nvim-telescope/telescope-ui-select.nvim' }

  -- use({ "nvim-telescope/telescope-ui-select.nvim" }) -- for showing lsp code actions

  -- treesitter for better syntax highlighting
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  -- indentation line
  use "lukas-reineke/indent-blankline.nvim"

  -- auto closing pairs and tags
  use("windwp/nvim-autopairs")
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

  -- git integration with nice icons
  use("lewis6991/gitsigns.nvim")

  -- Autocompletion
  use("hrsh7th/nvim-cmp")     -- completion plugin
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use("hrsh7th/cmp-buffer")   -- source for text in buffer
  use("hrsh7th/cmp-path")     -- source for file system paths
  -- use("hrsh7th/cmp-nvim-lua") -- source for Lua API

  -- Code Snippets
  use("L3MON4D3/LuaSnip")             -- snippet engine
  use("saadparwaiz1/cmp_luasnip")     -- for cmp autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- LSP plugins
  --
  -- Configurations for Nvim LSP
  use("neovim/nvim-lspconfig")

  -- managing & installing lsp servers, linters & formatters
  use({ "williamboman/mason.nvim", run = ":MasonUpdate" }) -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim")                 -- bridges gap b/w mason & lspconfig

  -- Formatting and linting
  use("jose-elias-alvarez/null-ls.nvim")

  -- Nice definitions and code-actions
  use("glepnir/lspsaga.nvim")
  -- Nice icons for autocompletion
  use("onsails/lspkind.nvim")
  -- END of LSP plugins

  use {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  }
end)
