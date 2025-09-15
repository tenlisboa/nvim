local map_keys = require("utils.mapper")

vim.cmd(":tnoremap <Esc> <c-\\><c-n>")

map_keys({
  n = {
    ["<c-k>"] = ":wincmd k<cr>",
    ["<c-j>"] = ":wincmd j<cr>",
    ["<c-h>"] = ":wincmd h<cr>",
    ["<c-l>"] = ":wincmd l<cr>",
  },
})
