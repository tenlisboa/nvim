return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = { "mfussenegger/nvim-dap" },
	requires = { "williamboman/mason.nvim" },
	config = function()
		vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = '', linehl = '', numhl = '' })
		vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })

		require("mason-nvim-dap").setup({
			ensure_installed = { "delve" },
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			}
		})
	end
}
