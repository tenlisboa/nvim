return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local lspconfig = require("lspconfig")
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "eslint", "jsonls", "tailwindcss", "phpactor", "ts_ls" },
      handlers = {
        function(server)
          lspconfig[server].setup({})
        end
      }
    })
  end
}
