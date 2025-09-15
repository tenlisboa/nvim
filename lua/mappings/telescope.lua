local map_keys = require("utils.mapper")

map_keys({
  n = {
    ["-"] = "<cmd>Telescope file_browser<CR>",
    ["<leader>ff"] = "<cmd>Telescope find_files<CR>",
    ["<leader>fg"] = "<cmd>Telescope live_grep<CR>",
    ["<leader>fb"] = "<cmd>Telescope buffers<CR>",
  },
  i = {
    ["<C-q>"] =
    "<cmd>lua require('telescope.actions').send_selected_to_qflist()<CR><cmd>lua require('telescope.actions').open_qflist()<CR>" -- send selected to quickfixlist
  },
})
