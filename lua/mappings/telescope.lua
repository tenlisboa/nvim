local map_keys = require("utils.mapper")
local tl_actions = require("telescope.actions")
local tl_builtins = require("telescope.builtin")

map_keys({
  n = {
    ["-"] = ":lua require('telescope.builtin').find_files()<CR>",
    ["<leader>fg"] = ":lua require('telescope.builtin').live_grep()<CR>",
    ["<leader>fb"] = ":lua require('telescope.builtin').buffers()<CR>",
  },
  i = {
    ["<C-q>"] = ":lua require('telescope.actions').send_selected_to_qflist()<CR>:lua require('telescope.actions').open_qflist()<CR>"  -- send selected to quickfixlist
  },
})
