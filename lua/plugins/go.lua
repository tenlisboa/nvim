return {
  {
    "ray-x/go.nvim",
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require("go").setup()
    end
  },
}
