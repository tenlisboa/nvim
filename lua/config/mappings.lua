local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

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
map("n", "F9", ":lua require('dap').continue()<cr>", opts)
map("n", "F10", ":lua require('dap').step_over()<cr>", opts)
map("n", "F11", ":lua require('dap').step_into()<cr>", opts)
map("n", "F12", ":lua require('dap').terminate()<cr>", opts)

-- Terminal
map("n", "<leader>th", ":split <cr> :terminal<cr>", opts)
map("n", "<leader>tv", ":vsplit <cr> :terminal<cr>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- Buffers

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
map("n", "<A-b>", "<Cmd>BufferCloseAllButCurrent<CR>", opts)

-- Telescope

map("n", "-", ":Telescope file_browser<CR>", opts)
