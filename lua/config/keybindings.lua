local function map_key(mode, key_to_bind, action_to_execute)
  vim.keymap.set(mode, key_to_bind, action_to_execute)
end

-- Copy
map_key("v", "<C-c>", '"+y')

-- Cut
map_key("v", "<C-x>", '"+c')

-- Paste
map_key("i", "<C-v>", "<C-R><C-O>+")
map_key("v", "<C-v>", '"+p')
map_key("n", "<C-v>", '"+p')

-- Split
map_key("n", "<leader>vs", ":vsplit<cr>")
map_key("n", "<leader>hs", ":split<cr>")

-- Disable search highlight
map_key("n", "<Esc><Esc>", ":noh<cr>")

-- Tabs
map_key("n", "<tab>", ">>")
map_key("n", "<S-tab>", "<<")
map_key("v", "<tab>", ">gv")
map_key("v", "<S-tab>", "<gv")

-- Ident entire file
map_key("n", "===", "mxgg=G`x")

-- Ctrl-a
map_key("n", "<C-a>", "ggvG")

-- Source vim configurations
map_key("n", "<leader>so", ":so ~/.config/nvim/init.lua<cr>")

-- Move entire line of text
map_key("n", "<M-j>", "mz:m+<cr>`z")
map_key("n", "<M-k>", "mz:m-2<cr>`z")
map_key("v", "<M-j>", ":m'>+<cr>`<my`>mzgv`yo`z")
map_key("v", "<M-k>", ":m'<-2<cr>`>my`<mzgv`yo`z")

-- Movement between splits
map_key("n", "<C-h>", "<C-W>h")
map_key("n", "<C-j>", "<C-W>j")
map_key("n", "<C-k>", "<C-W>k")
map_key("n", "<C-l>", "<C-W>l")

-- Movement between buffers
map_key("n", "<leader>j", ":bp<CR>")
map_key("n", "<leader>l", ":bn<CR>")
map_key("n", "<leader>x", ":bdelete<CR>")

-- GoTO
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function (ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      end
})

