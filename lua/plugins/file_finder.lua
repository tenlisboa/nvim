return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
  },
  cmd = "Telescope",
  config = function()
    local tl = require('telescope')
    local tl_actions = require('telescope.actions')

    tl.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/", "vendor" },
      },
    })
    
  end
}
