return require('lazy').setup({
  -- 'dense-analysis/ale',

  -- You can alias plugin names
  { 'dracula/vim', as = 'dracula' },
  "cideM/yui",
  "neovim/nvim-lspconfig",
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = ":TSUpdate",
  --   config = function ()
  --     local configs = require("nvim-treesitter.configs")

  --     configs.setup({
  --         -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
  --         sync_install = true,
  --         highlight = { enable = true },
  --         indent = { enable = true },
  --       })
  --   end
  --  },

  -- completion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',

  -- appears
  "lukas-reineke/indent-blankline.nvim",
  -- use {
  --   'nvim-lualine/lualine.nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  -- }
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "savq/melange-nvim" },
  "rebelot/kanagawa.nvim",

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

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
  -- { dir = '~/Workspace/uuid-rs.nvim', build = ":UuidBuild" },
})
