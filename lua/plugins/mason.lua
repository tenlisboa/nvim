return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "eslint", "jsonls", "tailwindcss", "phpactor" }
    })
  end
}
