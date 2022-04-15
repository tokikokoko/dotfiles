vim.cmd [[packadd packer.nvim]]

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }
  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

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
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- fuzzy finder
  use 'vijaymarupudi/nvim-fzf'
  use 'vijaymarupudi/nvim-fzf-commands'

  -- Grep
  use 'mileszs/ack.vim'

  -- Git
  use 'tpope/vim-fugitive'

  -- Markdown
  use 'plasticboy/vim-markdown'

  use 'frenzyexists/aquarium-vim'
  use 'arcticicestudio/nord-vim'
end)

