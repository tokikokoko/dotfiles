local keymap = vim.keymap.set
-- require('lspsaga')

-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "<leader>ll", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("v", "<leader>la", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

-- Rename
keymap("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Definition preview
keymap("n", "<leader>li", "<cmd>Lspsaga preview_definition<CR>", { silent = true })

-- Show line diagnostics
-- keymap("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>lt", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "<leader>ln", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "<leader>lp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })

-- Only jump to error
keymap("n", "<leader>lN", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "<leader>lP", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n","<leader>lo", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
keymap("n", "<leader>lk", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

