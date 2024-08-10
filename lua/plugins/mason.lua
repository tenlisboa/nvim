return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	config = function() 
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "gopls", "tsserver", "eslint", "htmx", "jsonls", "tailwindcss" }
		})
	end
}
