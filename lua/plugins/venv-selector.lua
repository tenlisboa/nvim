return {
  "linux-cultist/venv-selector.nvim",
  branch = "regexp",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python",
  },
  opts = {
    settings = {
      options = {
        notify_user_on_venv_activation = true,
      },
      search = {
        poetry = {
          command = "fd python$ ~/.cache/pypoetry/virtualenvs --full-path --color never -HI -a -L",
        },
      },
    },
  },
  keys = {
    { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select Python venv" },
  },
}
