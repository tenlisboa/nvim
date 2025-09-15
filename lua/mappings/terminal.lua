local map_keys = require("utils.mapper")
local term_map = require("terminal.mappings")

map_keys({
  n = {
    ["<leader>to"] = term_map.toggle
  }
})
