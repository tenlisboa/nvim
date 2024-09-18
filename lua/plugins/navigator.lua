return {
    "ray-x/navigator.lua",
    dependencies = {
      {"hrsh7th/nvim-cmp"},
      {"nvim-treesitter/nvim-treesitter"},
      {"ray-x/guihua.lua", run = "cd lua/fzy && make"},
      {
        "ray-x/lsp_signature.nvim", -- Show function signature when you type
        event = "VeryLazy",
        config = function() require("lsp_signature").setup() end
      }
    },
    config = function()
        require("navigator").setup({
            lsp_signature_help = true, -- enable ray-x/lsp_signature
            lsp = {format_on_save = true}
        })
    end
}
