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
  theme = {
    name = "catppuccin",
    catppuccin_flavour = "frappe"
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
        cmd = { "clangd -I/usr/local" }
      }
    },
    gopls = {

    }
  },
}
