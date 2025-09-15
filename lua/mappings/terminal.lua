local map_keys = require("utils.mapper")
local term_map = require("terminal.mappings")

map_keys({
  n = {
    ["<leader>ts"] = term_map.operator_send,
    ["<leader>to"] = term_map.toggle,
    ["<leader>tO"] = term_map.toggle({ open_cmd = "enew" }),
    ["<leader>tr"] = term_map.run,
    ["<leader>tk"] = term_map.kill,
    ["<leader>t]"] = term_map.cycle_next,
    ["<leader>t["] = term_map.cycle_prev,
    ["<leader>tl"] = term_map.move({ open_cmd = "belowright vnew" }),
    ["<leader>tL"] = term_map.move({ open_cmd = "botright vnew" }),
    ["<leader>th"] = term_map.move({ open_cmd = "belowright new" }),
    ["<leader>tH"] = term_map.move({ open_cmd = "botright new" }),
  },
  x = {
    ["<leader>ts"] = term_map.operator_send,
  }
})
