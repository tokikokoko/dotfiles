vim.cmd([[let mapleader="\<Space>"]])

vim.cmd([[nnoremap <Leader>tc :tabnew<CR>]])
vim.cmd([[nnoremap <Leader>td :tabclose<CR>]])
vim.cmd([[nnoremap <Leader>tn :tabn<CR>]])
vim.cmd([[nnoremap <Leader>tp :tabp<CR>]])

vim.cmd([[nnoremap <Leader>wd :q<CR>]])
vim.cmd([[nnoremap <Leader>wv :vs<CR>]])
vim.cmd([[nnoremap <Leader>ws :split<CR>]])
vim.cmd([[nnoremap <Leader>wh :wincmd h<CR>]])
vim.cmd([[nnoremap <Leader>wj :wincmd j<CR>]])
vim.cmd([[nnoremap <Leader>wk :wincmd k<CR>]])
vim.cmd([[nnoremap <Leader>wl :wincmd l<CR>]])

vim.cmd([[nnoremap <Leader>an :Explore<CR>]])
vim.cmd([[nnoremap <Leader>at :terminal<CR>]])

-- vim.cmd([[nnoremap <Leader>lK <cmd>lua vim.lsp.buf.hover()<CR>]])
-- vim.cmd([[nnoremap <Leader>lf <cmd>lua vim.lsp.buf.formatting()<CR>]])
-- vim.cmd([[nnoremap <Leader>lm :LspCodeAction<CR>]])
-- vim.cmd([[nnoremap <Leader>ls :LspWorkspaceSymbol<CR>]])
-- vim.cmd([[nnoremap <Leader>lj :LspNextError<CR>]])
-- vim.cmd([[nnoremap <Leader>lk :LspPreviousError<CR>]])
vim.api.nvim_set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>lK', '<cmd>lua vim.lsp.buf.hover()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', {})
-- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
-- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
-- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
-- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)


vim.cmd([[nnoremap <Leader>fh :noh<CR>]])

vim.cmd([[nnoremap <Leader>pf :lua require('fzf-commands').files()<CR>]])
vim.cmd([[nnoremap <Leader>bb :lua require('fzf-commands').bufferpicker()<CR>]])


vim.cmd([[tnoremap <Esc> <C-\><C-n>]])


vim.api.nvim_set_keymap('n', '<leader>gg', ':<C-u>Ack<Space>', {})
