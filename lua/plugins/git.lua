return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      require("gitblame").setup()
    end
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
  }
}
