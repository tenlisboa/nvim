return {
  "mfussenegger/nvim-dap",
  requires = { "williamboman/mason.nvim" },
  config = function()
    vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#993939" })
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for _, language in ipairs({ "typescript", "javascript", "javascriptreact", "typescriptreact" }) do
      require("dap").configurations[language] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = "Launch File",
          program = "${file}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          protocol = 'inspector',
          skipFiles = { "<node_internals>/**" },
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach to debugger',
          cwd = "${workspaceFolder}",
          skipFiles = { "<node_internals>/**" },
          sourceMaps = true,
          protocol = 'inspector',
          port = function()
            return vim.ui.input({ prompt = "Debugger Port: " }, function(input)
              if input ~= nil then
                return tonumber(input)
              else
                return 9229
              end
            end)
          end,
          webRoot = "${workspaceFolder}",
        }

      }
    end

    require("mason-nvim-dap").setup({
      ensure_installed = { "delve", "js-debug-adapter", "php-debug-adapter" },
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      }
    })
  end,

  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
    {
      "microsoft/vscode-js-debug",
      build =
      "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out && git restore package-lock.json"
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      config = function()
        require("dap-vscode-js").setup({
          debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
          adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }
        })
      end
    }
  },
}
