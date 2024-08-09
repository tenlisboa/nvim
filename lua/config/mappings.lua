local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map("n", "<leader>eb", ":e ~/.config/nvim/init.lua<CR>", opts)
 
