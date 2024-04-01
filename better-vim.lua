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
  plugins = {
    "arzg/vim-colors-xcode",
    "nvim-lua/plenary.nvim", {
    "Civitasv/cmake-tools.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("cmake-tools").setup {}
    end,
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
    clangd = {},
    cmake = {},
    gopls = {}
  },
}
