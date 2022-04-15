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

-- Colorscheme settings
vim.go.background = 'dark'
