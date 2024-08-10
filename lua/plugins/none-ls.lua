return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function() 
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.diagnostics.yamllint,
			}
		})
	end
}
