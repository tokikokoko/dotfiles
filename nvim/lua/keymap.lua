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
vim.cmd([[nnoremap <Leader>aF :Fern %:h<CR>]])
vim.cmd([[nnoremap <Leader>af :Fern . -reveal=% -drawer -toggle<CR>]])
vim.cmd([[nnoremap <Leader>at :terminal<CR>]])

vim.cmd([[nnoremap <Leader>lK <cmd>lua vim.lsp.buf.hover()<CR>]])
vim.cmd([[nnoremap <Leader>lf <cmd>lua vim.lsp.buf.formatting()<CR>]])
vim.cmd([[nnoremap <Leader>lm :LspCodeAction<CR>]])
vim.cmd([[nnoremap <Leader>ls :LspWorkspaceSymbol<CR>]])
vim.cmd([[nnoremap <Leader>lj :LspNextError<CR>]])
vim.cmd([[nnoremap <Leader>lk :LspPreviousError<CR>]])
vim.api.nvim_set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', {})


vim.cmd([[nnoremap <Leader>fh :noh<CR>]])

-- vim.cmd([[nnoremap <Leader>pf :lua require('fzf-commands').files()<CR>]])
-- vim.cmd([[nnoremap <Leader>bb :lua require('fzf-commands').bufferpicker()<CR>]])

-- telescope
local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

telescope.setup({
  pickers = {
    find_files = {
      hidden = true,
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
  },
})

local telescopeBuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', telescopeBuiltin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescopeBuiltin.live_grep, {})
vim.keymap.set('n', '<leader>bb', telescopeBuiltin.buffers, {})
vim.api.nvim_set_keymap('n', '<leader>s', '<cmd>Pounce<CR>', {})

vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

vim.api.nvim_set_keymap('n', '<leader>gg', ':<C-u>Ack<Space>', {})

-- clipboard
-- vim.cmd([[vnoremap <C-y> :'<,'>w !xclip -selection clipboard<Cr><Cr>]])
