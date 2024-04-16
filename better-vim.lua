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
      vim.opt.foldcolumn = '1'   -- '1' is not bad
      vim.opt.foldlevel = 99     -- Using ufo provider need a large value, feel free to decrease the value
      vim.opt.foldlevelstart = 1
      vim.opt.foldenable = false -- if this option is true and fold method option is other than normal, every time a document is opened everything will be folded.
    end
  },
  noice = {
    messages = {
      view = "mini",         -- default view for messages
      view_error = "notify", -- view for errors
      view_warn = "mini",    -- view for warnings
    },
    notify = {
      view = "mini"
    }
  },
  plugins = {
    "arzg/vim-colors-xcode",
    "nvim-lua/plenary.nvim",
    {
      "Civitasv/cmake-tools.nvim",
      dependencies = "nvim-lua/plenary.nvim",
    },
    {
      "tpope/vim-fugitive",
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
        ["<tab>"] = { ">>", "Move line right" },
        ["<S-tab>"] = { "<<", "Move line left" },
        ["<M-j>"] = { "mz:m+<cr>`z", "Move lines down" },
        ["<M-k>"] = { "mz:m-2<cr>`z", "Move lines up" },
        ["<leader>gs"] = { ":Git<cr>", "Show Git changes" },
        ["<leader>gf"] = { ":Gvdiffsplit<cr>", "Show Git diff"},
      },
      v = {
        ["<tab>"] = { ">gv", "Move a group of lines right" },
        ["<S-tab>"] = { "<gv", "Move a group of lines left" },
        ["<M-j>"] = { ":m'>+<cr>`<my`>mzgv`yo`z", "Move lines down" },
        ["<M-k>"] = { ":m'<-2<cr>`>my`<mzgv`yo`z", "Move lines up" },     }
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
