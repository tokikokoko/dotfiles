require('plugins')
require('completion')
require('keymap')
require('fzf-functions')

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  opts.on_attach = on_attach

  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)

vim.cmd [[colorscheme nord]]

vim.wo.number = true
vim.wo.cursorline = true
vim.go.clipboard = 'unnamed'
vim.go.backspace = 'indent,eol,start'
vim.go.termguicolors = true
vim.cmd([[autocmd FileType lua setl tabstop=2 expandtab shiftwidth=2 softtabstop=2]])
vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])

-- lualine
-- e
require('lualine').setup {
  options = {
    theme = 'dracula'
  }
}

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


-- File format
vim.cmd([[autocmd FileType html setl tabstop=4 expandtab shiftwidth=2 softtabstop=2]])
vim.cmd([[autocmd FileType javascript setl tabstop=4 expandtab shiftwidth=2 softtabstop=2]])
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

-- Colorscheme settings
vim.go.background = 'dark'

-- set autoread
-- trigger `autoread` when files changes on disk
vim.cmd([[set autoread]])
vim.cmd([[autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif]])
-- notification after file change
vim.cmd([[autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]])
