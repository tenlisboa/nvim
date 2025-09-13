return {
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "ts_ls", "eslint", "jsonls", "tailwindcss", "intelephense" }
      })
    end
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jay-babu/mason-null-ls.nvim"
    },
    config = function()
      local null_ls = require("null-ls")
      local mason_null = require("mason-null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.diagnostics.golangci_lint,
          null_ls.builtins.diagnostics.yamllint,
        }
      })

      mason_null.setup({
        ensure_installed = { "prettierd", "golangci_lint" }
      })
    end
  }
}
