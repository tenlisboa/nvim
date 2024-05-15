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


      vim.keymap.set('n', ';;', 'gcc', { remap = true })
      vim.keymap.set('v', ';;', 'gc', { remap = true })
      vim.keymap.set('t', '<Esc>', "<C-\\><C-n>", { noremap = true })

      vim.o.background = 'dark'
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
    {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      config = true,
    },
    "nvim-lua/plenary.nvim",
    "wakatime/vim-wakatime",
    {
      "Civitasv/cmake-tools.nvim",
      dependencies = "nvim-lua/plenary.nvim",
    },
    {
      "tpope/vim-fugitive",
    },
    {
      "Exafunction/codeium.vim"
    }
  },
  theme = {
    name = "gruvbox",
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
        ["<leader>gf"] = { ":Gvdiffsplit<cr>", "Show Git diff" },
        ["<leader>glol"] = { ":Git log<cr>", "Show Git logs" },
        ["<leader>gc"] = { ":Git commit --no-verify<cr>", "Git commit" },
        ["<leader>gca"] = { ":Git commit --amend --no-verify <cr>", "Git commit amend" },
      },
      v = {
        ["<tab>"] = { ">gv", "Move a group of lines right" },
        ["<S-tab>"] = { "<gv", "Move a group of lines left" },
        ["<M-j>"] = { ":m'>+<cr>`<my`>mzgv`yo`z", "Move lines down" },
        ["<M-k>"] = { ":m'<-2<cr>`>my`<mzgv`yo`z", "Move lines up" },
        ["<leader>ca"] = { ":lua vim.lsp.buf.code_action()<CR>", "Code action" },
      }
    }
  },
  formatters = {
    prettierd = {}
  },
  lsps = {
    cssls = {},
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
    gopls = {},
    jsonls = {
      filetypes = { "json", "jsonc" },
      settings = {
        json = {
          -- Schemas https://www.schemastore.org
          schemas = {
            {
              fileMatch = { "package.json" },
              url = "https://json.schemastore.org/package.json"
            },
            {
              fileMatch = { "tsconfig*.json" },
              url = "https://json.schemastore.org/tsconfig.json"
            },
            {
              fileMatch = {
                ".prettierrc",
                ".prettierrc.json",
                "prettier.config.json"
              },
              url = "https://json.schemastore.org/prettierrc.json"
            },
            {
              fileMatch = { ".eslintrc", ".eslintrc.json" },
              url = "https://json.schemastore.org/eslintrc.json"
            },
            {
              fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
              url = "https://json.schemastore.org/babelrc.json"
            },
            {
              fileMatch = { "lerna.json" },
              url = "https://json.schemastore.org/lerna.json"
            },
            {
              fileMatch = { "now.json", "vercel.json" },
              url = "https://json.schemastore.org/now.json"
            },
            {
              fileMatch = {
                ".stylelintrc",
                ".stylelintrc.json",
                "stylelint.config.json"
              },
              url = "http://json.schemastore.org/stylelintrc.json"
            }
          }
        }
      },
    },
    elixirls = {},
  },
}
