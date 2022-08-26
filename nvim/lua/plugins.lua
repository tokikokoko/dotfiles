vim.cmd [[packadd packer.nvim]]

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'w0rp/ale',
    ft = { 'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex' },
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }
  -- You can alias plugin names
  use { 'dracula/vim', as = 'dracula' }
  use "neovim/nvim-lspconfig"
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require("lspsaga")

      saga.init_lsp_saga({
        -- your configuration
      })
    end,
  })

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- appears
  use 'glepnir/indent-guides.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- fuzzy finder
  use 'vijaymarupudi/nvim-fzf'
  use 'vijaymarupudi/nvim-fzf-commands'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Grep
  use 'mileszs/ack.vim'

  -- Git
  use 'dinhhuy258/git.nvim'

  -- Markdown
  use 'plasticboy/vim-markdown'

  use 'frenzyexists/aquarium-vim'

  -- Task runner
  use 'thinca/vim-quickrun'

  -- Edit
  use 'tpope/vim-surround'
end)
