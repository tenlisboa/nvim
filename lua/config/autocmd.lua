
-- Navigator plugin working with cmp and autopairs
vim.cmd("autocmd FileType guihua lua require('cmp').setup.buffer { enabled = false }")
vim.cmd("autocmd FileType guihua_rust lua require('cmp').setup.buffer { enabled = false }")
vim.cmd([[
  highlight CursorLine cterm=NONE ctermbg=DarkGray guibg=#3c3c3c
]])
   