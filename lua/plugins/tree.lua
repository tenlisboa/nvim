-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  renderer = {
    highlight_git = true
  },
  filters = {
    dotfiles = false,
  },
})

vim.keymap.set("n", "<leader>ff", ":NvimTreeFindFile<cr>")

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
