return require('lazy').setup({
  -- 'dense-analysis/ale',

  -- You can alias plugin names
  { 'dracula/vim',      as = 'dracula' },
  "cideM/yui",
  "neovim/nvim-lspconfig",
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = 'nvim-treesitter.configs',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "elixir", "javascript", "html", "vue", "rust" },
        sync_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },

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
  { "catppuccin/nvim",  name = "catppuccin", priority = 1000 },
  { "savq/melange-nvim" },
  "rebelot/kanagawa.nvim",

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  'rcarriga/nvim-notify',

  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        views = {
          cmdline_popup = {
            position = {
              row = 5,
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
          },
          popupmenu = {
            relative = "editor",
            position = {
              row = 8,
              col = "50%",
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
          },
        },
        routes = {
          {
            view = "notify",
            filter = { event = "msg_showmode" },
          },
        },
        presets = {
          bottom_search = false,      -- use a classic bottom cmdline for search
          command_palette = false,    -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,         -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true,      -- add a border to hover docs and signature help
        },
      })

      require("notify").setup({
        timeout = 800,
        stages = 'slide',
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
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

  { 'tokikokoko/uuid-rs.nvim',                                          build = ":UuidBuild" },

  {
    'hat0uma/csvview.nvim',
    config = function()
      require('csvview').setup({
        parser = {
          --- The number of lines that the asynchronous parser processes per cycle.
          --- This setting is used to prevent monopolization of the main thread when displaying large files.
          --- If the UI freezes, try reducing this value.
          --- @type integer
          async_chunksize = 100,

          --- The delimiter character
          --- You can specify a string, a table of delimiter characters for each file type, or a function that returns a delimiter character.
          --- e.g:
          ---  delimiter = ","
          ---  delimiter = function(bufnr) return "," end
          ---  delimiter = {
          ---    default = ",",
          ---    ft = {
          ---      tsv = "\t",
          ---    },
          ---  }
          --- @type string | {default: string, ft: table<string,string>} | fun(bufnr:integer): string
          delimiter = {
            default = ",",
            ft = {
              tsv = "\t",
            },
          },

          --- The quote character
          --- If a field is enclosed in this character, it is treated as a single field and the delimiter in it will be ignored.
          --- e.g:
          ---  quote_char= "'"
          --- You can also specify it on the command line.
          --- e.g:
          --- :CsvViewEnable quote_char='
          --- @type string
          quote_char = '"',

          --- The comment prefix characters
          --- If the line starts with one of these characters, it is treated as a comment.
          --- Comment lines are not displayed in tabular format.
          --- You can also specify it on the command line.
          --- e.g:
          --- :CsvViewEnable comment=#
          --- @type string[]
          comments = {
            -- "#",
            -- "--",
            -- "//",
          },
        },
        view = {
          --- minimum width of a column
          --- @type integer
          min_column_width = 2,

          --- spacing between columns
          --- @type integer
          spacing = 2,

          --- The display method of the delimiter
          --- "highlight" highlights the delimiter
          --- "border" displays the delimiter with `│`
          --- see `Features` section of the README.
          ---@type "highlight" | "border"
          display_mode = "border",
        },
      })
    end
  },

  { 'vim-denops/denops.vim',                                            lazy = false },
  { "yuki-yano/denops-lazy.nvim" },


  -- { dir = '~/Workspace/uuid-rs.nvim', build = ":UuidBuild" },
  { dir = '/home/keita/ghq/github.com/vim-denops/denops-helloworld.vim' },
})
