local map_keys = require("utils.mapper")

vim.cmd(":tnoremap <Esc> <c-\\><c-n>")

map_keys({
  n = {
    ["<c-k>"] = "<c-w>k",
    ["<c-j>"] = "<c-w>j",
    ["<c-h>"] = "<c-w>h",
    ["<c-l>"] = "<c-w>l",
  },
})
