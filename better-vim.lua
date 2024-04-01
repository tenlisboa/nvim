return {
  dashboard = {
    header = {
      "██╗     ██╗███████╗██████╗  ██████╗  █████╗ ",
      "██║     ██║██╔════╝██╔══██╗██╔═══██╗██╔══██╗",
      "██║     ██║███████╗██████╔╝██║   ██║███████║",
      "██║     ██║╚════██║██╔══██╗██║   ██║██╔══██║",
      "███████╗██║███████║██████╔╝╚██████╔╝██║  ██║",
      "╚══════╝╚═╝╚══════╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝",
      "",
      "",
    }
  },
  hooks = {
    after_setup = function()
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
      vim.opt.foldcolumn = '1'   -- '0' is not bad
      vim.opt.foldlevel = 99     -- Using ufo provider need a large value, feel free to decrease the value
      vim.opt.foldlevelstart = 1
      vim.opt.foldenable = false -- if this option is true and fold method option is other than normal, every time a document is opened everything will be folded.
    end
  },
  noice = {
    messages = {
      view = "mini",         -- default view for messages
      view_error = "notify", -- view for errors
      view_warn = "notify",  -- view for warnings
    },
  },
  plugins = {
    "arzg/vim-colors-xcode",
    "nvim-lua/plenary.nvim",
    {
      "Civitasv/cmake-tools.nvim",
      dependencies = "nvim-lua/plenary.nvim",
    },
  },
  theme = {
    name = "xcodedark",
  },
  flags = {
    format_on_save = true
  },
  mappings = {
    by_mode = {
      n = { -- Normal mode mappings
        ["<leader>th"] = { ":split <cr>:terminal <cr>", "Open terminal horizontally" },
        ["<leader>tv"] = { ":vsplit <cr>:terminal <cr>", "Open terminal vertically" },
      },
    }
  },
  lsps = {
    clangd = {
      settings = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders"
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
          semanticHighlighting = true
        },
      }
    },
    cmake = {},
    gopls = {}
  },
}
