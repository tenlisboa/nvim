require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "css",
    "dockerfile",
    "html",
    "javascript",
    "json",
    "lua",
    "prisma",
    "go",
    "python",
    "tsx",
    "yaml"
  },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  autotag = {
    enable = true,
  },
}
