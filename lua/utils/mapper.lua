local function map_keys(keymap_table, opts)
  opts = opts or { noremap = true, silent = true }

  local has_keymap_set = pcall(function() return vim.keymap.set end)

  for mode, mappings in pairs(keymap_table) do
    for key, command in pairs(mappings) do
      if command == false then
        if has_keymap_set then
          vim.keymap.set(mode, key, "", opts)
        else
          vim.api.nvim_set_keymap(mode, key, "", opts)
        end
      elseif type(command) == "function" or (has_keymap_set and type(command) ~= "string") then
        -- Use vim.keymap.set for functions or tables (Lua handlers)
        if has_keymap_set then
          vim.keymap.set(mode, key, command, opts)
        else
          error("Cannot map non-string command without vim.keymap.set (Neovim >= 0.7 required)")
        end
      else
        -- Use legacy API for string commands
        if has_keymap_set then
          vim.keymap.set(mode, key, command, opts)
        else
          vim.api.nvim_set_keymap(mode, key, command, opts)
        end
      end
    end
  end
end

return map_keys
