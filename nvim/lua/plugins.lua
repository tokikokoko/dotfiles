return require('lazy').setup({
  -- 'dense-analysis/ale',

  -- You can alias plugin names
  { 'dracula/vim',      as = 'dracula' },
  "cideM/yui",
  "neovim/nvim-lspconfig",
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- completion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',

  -- appears
  "lukas-reineke/indent-blankline.nvim",
  { "catppuccin/nvim",  name = "catppuccin", priority = 1000 },
  { "savq/melange-nvim" },
  "rebelot/kanagawa.nvim",

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  'rcarriga/nvim-notify',

  -- Git
  'dinhhuy258/git.nvim',

  -- Markdown
  'plasticboy/vim-markdown',

  'frenzyexists/aquarium-vim',

  -- Task runner
  'thinca/vim-quickrun',

  -- Edit
  'tpope/vim-surround',
  'mg979/vim-visual-multi',

  -- Search
  'rlane/pounce.nvim',

  -- Util
  'lambdalisue/fern.vim',

  { 'tokikokoko/uuid-rs.nvim', build = ":UuidBuild" },

  { 'vim-denops/denops.vim', lazy = false },
  { "yuki-yano/denops-lazy.nvim" },


  -- { dir = '~/Workspace/uuid-rs.nvim', build = ":UuidBuild" },
  -- { dir = '/home/keita/ghq/github.com/vim-denops/denops-helloworld.vim' },
})
