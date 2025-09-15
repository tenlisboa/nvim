local function map_keys(keymap_table, opts)
  opts = opts or { noremap = true, silent = true }

  for mode, mappings in pairs(keymap_table) do
    for key, command in pairs(mappings) do
      vim.keymap.set(mode, key, command, opts)
    end
  end
end

return map_keys
