return require("packer").startup(function (use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
  }

  -- Wakatime
  use 'wakatime/vim-wakatime'

  use 'projekt0n/github-nvim-theme'

  -- Git
  use "tpope/vim-fugitive"
  use "tanvirtin/vgit.nvim"

  -- Autopairs
  use "windwp/nvim-autopairs"

  -- Nvim tree
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    }
  }

  use {
    "NvChad/nvterm",
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make"
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Autotagging
  use "windwp/nvim-ts-autotag"

  -- LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"

  -- Auto Comment
  use "terrortylor/nvim-comment"

  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
end)

