local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map("n", "<leader>eb", ":e ~/.config/nvim/init.lua<CR>", opts)
map("n", "<leader>sv", ":source ~/.config/nvim/init.lua<CR>", opts)
 
-- Move lines up/down
map("n", "<M-j>", ":m .+1<CR>==", opts)
map("n", "<M-k>", ":m .-2<CR>==", opts)
map("i", "<M-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<M-k>", "<Esc>:m .-2<CR>==gi", opts)
map("v", "<M-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<M-k>", ":m '<-2<CR>gv=gv", opts)

-- Tab and shift tab
map("v", "<Tab>", ">gv", opts)
map("v", "<S-Tab>", "<gv", opts)

-- Git Mappiings
map("n", "<leader>gs", ":Git<CR>", opts)
map("n", "<leader>gc", ":Git commit<CR>", opts)
map("n", "<leader>gp", ":Git push<CR>", opts)
map("n", "<leader>gl", ":Git pull<CR>", opts)
map("n", "<leader>gf", ":Git fetch<CR>", opts)
map("n", "<leader>gco", ":Git checkout ", opts)
map("n", "<leader>gc", ":Git commit<CR>", opts)

-- DAP
map("n", "<A-d>", ":lua require('dap').continue()<cr>", opts)
map("n", "co", ":lua require('dap').continue()<cr>", opts)
map("n", "so", ":lua require('dap').step_over()<cr>", opts)
map("n", "si", ":lua require('dap').step_into()<cr>", opts)
map("n", "sx", ":lua require('dap').terminate()<cr>", opts)

-- Terminal
map("n", "<leader>th", ":split <cr> :terminal<cr>", opts)
map("n", "<leader>tv", ":vsplit <cr> :terminal<cr>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)
