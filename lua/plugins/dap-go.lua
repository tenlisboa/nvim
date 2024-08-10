return {
	"leoluz/nvim-dap-go",

	config = function()
		require("dap-go").setup {
			delve = {
				path = "dlv",
				initialize_timeout_sec = 20,
				port = "${port}",
				args = {},
				build_flags = "",
				detached = vim.fn.has("win32") == 0,
				cwd = nil,
			},
		}
	end
}
