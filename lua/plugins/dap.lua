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
          name = 'Next.js - Run dev',
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          runtimeExecutable = 'npm',
          runtimeArgs = {
            'run',
            'dev',
          },
          protocol = 'inspector',
          skipFiles = { "<node_internals>/**" },
        },
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
        -- {
        --   type = "pwa-node",
        --   request = "launch",
        --   name = "Debug NEST.js App",
        --   cwd = "${workspaceFolder}",
        --   sourceMaps = true,
        --   runtimeExecutable = "nest",
        --   runtimeArgs = function()
        --     return { "start", vim.ui.input({ prompt = "App name: " }, function (input)
        --       if input ~= nil then
        --         return input
        --       else
        --         return ""
        --       end
        --     end), "-w", "-d" }
        --   end,
          -- websocketAddress = function()
          --  return string.match(
          --   vim.api.nvim_exec('!docker logs [conatiner-name]|& grep -oE "ws.*" | tail -1', true),
          --   "ws:.*"
          --  )
          -- end,
        -- },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach to debbuger',
          cwd = "${workspaceFolder}",
          skipFiles = { "<node_internals>/**" },
          sourceMaps = true,
          protocol = 'inspector',
          port = 9229,
          webRoot = "${workspaceFolder}",
        }

      }
    end

    require("mason-nvim-dap").setup({
      ensure_installed = { "delve", "js-debug-adapter" },
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
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
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
