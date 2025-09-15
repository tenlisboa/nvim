return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
    "nvim-telescope/telescope-file-browser.nvim"
  },
  cmd = "Telescope",
  config = function()
    local tl = require('telescope')

    tl.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/", "vendor" },
        hidden = true,
        respect_gitignore = false,
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
          hidden = true,
          no_ignore = false,
          follow = true,
        }
      },
      extensions = {
        file_browser = {
          theme = "ivy",
          hidden = true,
          respect_gitignore = false,
          grouped = true,
          select_buffer = true,
          initial_mode = "normal",
          mappings = {
            ["n"] = {
              ["N"] = tl.extensions.file_browser.actions.create,
              ["h"] = tl.extensions.file_browser.actions.goto_parent_dir,
              ["l"] = tl.extensions.file_browser.actions.change_cwd,
              ["/"] = function() vim.cmd('startinsert') end,
            },
          }
        }
      }
    })

    tl.load_extension('fzf')
    tl.load_extension('file_browser')
  end
}
