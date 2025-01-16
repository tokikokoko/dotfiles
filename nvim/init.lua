-- Package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('plugins')

-- require('fzf-functions')
require('keymap')
require('completion')

-- Colorscheme settings
vim.go.termguicolors = true
vim.go.background = 'light'
vim.cmd[[colorscheme catppuccin-latte]]
-- vim.cmd[[colorscheme melange]]

-- util function
local function executable(e)
  return vim.fn.executable(e) > 0
end

local function add(value, str, sep)
  sep = sep or ','
  str = str or ''
  value = type(value) == 'table' and table.concat(value, sep) or value
  return str ~= '' and table.concat({ value, str }, sep) or value
end

vim.go.syntax = 'on'
vim.go.lazyredraw = true
vim.wo.number = true
vim.wo.cursorline = false
vim.opt.clipboard:append{'unnamedplus'}
vim.go.backspace = 'indent,eol,start'
vim.go.tabstop = 2
vim.go.shiftwidth = 2
vim.go.expandtab = true

if executable('rg') then
  vim.o.grepprg =
    [[rg --hidden --glob "!.git" --smart-case --vimgrep]]
end

-- vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])

-- LSP
require("mason").setup()
require('mason-lspconfig').setup()
require("mason-lspconfig").setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {}
  end,
}
vim.diagnostic.config({
  virtual_text = false,
  underline = false,
})
-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Indent
-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("ibl").setup()
-- require("ibl").setup {
--   show_end_of_line = true,
--   show_current_context = true,
--   show_current_context_start = true,
-- }

-- Git
require('git').setup({
  keymaps = {
    -- Open blame window
    blame = "<Leader>gb",
    -- Close blame window
    quit_blame = "q",
    -- Open file/folder in git repository
    browse = "<Leader>go",
    -- Open pull request of the current branch
    open_pull_request = "<Leader>gp",
    -- Create a pull request with the target branch is set in the `target_branch` option
    create_pull_request = "<Leader>gn",
    -- Opens a new diff that compares against the current index
    diff = "<Leader>gd",
    -- Close git diff
    diff_close = "<Leader>gD",
    -- Revert to the specific commit
    revert = "<Leader>gr",
    -- Revert the current file to the specific commit
    revert_file = "<Leader>gR",
  },
  -- Default target branch when create a pull request
  target_branch = "master",
})

-- require('nvim-treesitter.configs').setup {
--   -- A list of parser names, or "all"
--   ensure_installed = {},
--   sync_install = false,
--   auto_install = true,
--   ignore_install = {},
--   highlight = {
--     enable = true,
--     disable = {},
--     additional_vim_regex_highlighting = true,
--   },
--   indent = {
--     enable = true,
--     disable = {},
--   },
-- }

-- Multicursor
-- vim.cmd([[let g:VM_maps = {}]])
-- vim.cmd([[let g:VM_maps['Find Under']         = '<C-d>']])
-- vim.cmd([[let g:VM_maps['Find Subword Under'] = '<C-d>']])




-- QuickRun
vim.g.quickrun_config = {
  ['*'] = {
    ['hook/time/enable'] = '1',
    ['outputter/buffer/opener'] = 'new',
    ['outputter/buffer/into'] = 1,
    ['outputter/buffer/close_on_empty'] = 1
  },
  ['go.test'] = {
    ['command'] = 'go',
    ['outputter'] = 'quickfix',
    ['outputter/quickfix'] = 1,
    ['outputter/quickfix/into'] = 1,
    ['outputter/quickfix/errorformat'] = "%-GFAIL,%-Gexit status 1,%-GFAIL%m,%A=== RUN   %m,%Z   %f:%l: %m,",
    ['hook/cd/enable'] = 1,
    ['hook/cd/directory'] = '%S:h',
    ['exec'] = "%c test -v",
  },
  ['go.mod.tidy'] = {
    ['command'] = 'go',
    ['outputter'] = 'quickfix',
    ['outputter/quickfix'] = 1,
    ['outputter/quickfix/into'] = 1,
    ['hook/cd/enable'] = 1,
    ['hook/cd/directory'] = '%S:h',
    ['exec'] = "%c mod tidy",
  },
  ['go.fmt'] = {
    ['command'] = 'go',
    ['outputter'] = 'quickfix',
    ['outputter/quickfix'] = 1,
    ['outputter/quickfix/into'] = 1,
    ['hook/cd/enable'] = 1,
    ['hook/cd/directory'] = '%S:h',
    ['exec'] = "%c fmt",
  }
}
vim.cmd([[au FileType quickrun nnoremap <silent><buffer>q :quit<CR>]])
-- Close quick fix by press q
vim.cmd([[au FileType qf nnoremap <silent><buffer>q :quit<CR>]])

-- Golang
vim.cmd([[au FileType go nnoremap <Leader>rt :QuickRun go.test<CR>]])
vim.cmd([[au FileType go nnoremap <Leader>rf :QuickRun go.fmt<CR>]])

-- notify
vim.notify = require("notify")

-- noice
require("noice").setup({
  presets = {
    -- you can enable a preset by setting it to true, or a table that will override the preset config
    -- you can also add custom presets that you can enable/disable with enabled=true
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = false, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
  }
})


-- File format
vim.cmd([[autocmd FileType html setl tabstop=4 expandtab shiftwidth=2 softtabstop=2]])
vim.cmd([[autocmd FileType javascript setl tabstop=2 expandtab shiftwidth=2 softtabstop=2]])
vim.cmd([[autocmd FileType vue syntax sync fromstart]])
vim.cmd([[autocmd FileType haskell setl tabstop=8 expandtab shiftwidth=4 softtabstop=4]])
vim.cmd([[autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4]])
vim.cmd([[autocmd FileType ruby setl tabstop=4 expandtab shiftwidth=2 softtabstop=2]])
vim.cmd([[autocmd FileType elixir setl tabstop=4 expandtab shiftwidth=2 softtabstop=2]])
vim.cmd([[autocmd FileType elm setl tabstop=8 expandtab shiftwidth=4 softtabstop=4]])
vim.cmd([[autocmd FileType typescript.tsx setl tabstop=4 expandtab shiftwidth=2 softtabstop=2]])
vim.cmd([[autocmd FileType typescript setl tabstop=4 expandtab shiftwidth=2 softtabstop=2]])
vim.cmd([[autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx]])
vim.cmd([[autocmd FileType go setl tabstop=4 expandtab shiftwidth=4 softtabstop=4]])
vim.cmd([[autocmd FileType rust setl tabstop=8 expandtab shiftwidth=4 softtabstop=4]])
vim.cmd([[autocmd FileType lua setl tabstop=2 expandtab shiftwidth=2 softtabstop=2]])
vim.cmd([[autocmd FileType yaml setl tabstop=2 expandtab shiftwidth=2 softtabstop=2]])
vim.cmd([[autocmd FileType sh setl tabstop=4 expandtab shiftwidth=4 softtabstop=4]])
vim.cmd([[autocmd FileType fish setl tabstop=8 expandtab shiftwidth=4 softtabstop=4]])
vim.cmd([[autocmd FileType sql setl tabstop=2 expandtab shiftwidth=2 softtabstop=2]])
vim.cmd([[autocmd FileType markdown setl tabstop=4 expandtab shiftwidth=4 softtabstop=4]])
vim.cmd([[autocmd FileType dockerfile setl tabstop=4 expandtab shiftwidth=4 softtabstop=4]])

vim.g.ackprg = 'rg --vimgrep --no-heading'
vim.g.vim_markdown_folding_disabled = 1
vim.cmd([[au FileType markdown nnoremap <Leader>fo :vim "^\#\+" % \| cw<CR>]])

-- set autoread
-- trigger `autoread` when files changes on disk
vim.cmd([[set autoread]])
vim.cmd([[autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif]])
-- notification after file change
vim.cmd([[autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]])

