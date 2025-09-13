return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    config = function()
      require("nvim-autopairs").setup{}
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function(_, opts)
      require("ibl").setup(opts)
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup()
--     Old text                    Command         New text
-- --------------------------------------------------------------------------------
--     surr*ound_words             ysiw)           (surround_words)
--     *make strings               ys$"            "make strings"
--     [delete ar*ound me!]        ds]             delete around me!
--     remove <b>HTML t*ags</b>    dst             remove HTML tags
--     'change quot*es'            cs'"            "change quotes"
--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--     delete(functi*on calls)     dsf             function calls
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          section_separators = '',
          component_separators = '',
        },
      }
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- cmp_nvim_lsp
      "neovim/nvim-lspconfig", -- lspconfig
      "onsails/lspkind-nvim",  -- lspkind (VS pictograms)
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" }, -- Snippets
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          -- https://github.com/rafamadriz/friendly-snippets/blob/main/snippets/go.json
        end
      }, { "saadparwaiz1/cmp_luasnip", enabled = true }
    },
    config = function()
      local luasnip = require("luasnip")
      local types = require("luasnip.util.types")

      -- Display virtual text to indicate snippet has more nodes
      luasnip.config.setup({
        ext_opts = {
          [types.choiceNode] = {
            active = { virt_text = { { "⇥", "GruvboxRed" } } }
          },
          [types.insertNode] = {
            active = { virt_text = { { "⇥", "GruvboxBlue" } } }
          }
        }
      })

      local cmp = require("cmp")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" })
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, { name = "luasnip" }, { name = "buffer" }
        }),
      })
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  },
  {
    'ray-x/navigator.lua',
    dependencies = {
        { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
        { 'neovim/nvim-lspconfig' },
    },
    config = function()
      require("navigator").setup({
        debug = false, -- log output, set to true and log path: ~/.cache/nvim/gh.log
        width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
        height = 0.3, -- max list window height, 0.3 by default
        preview_height = 0.35, -- max height of preview windows
        border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}, -- border style, can be one of 'none', 'single', 'double', 'shadow', etc
        on_attach = function(client, bufnr)
          -- disable diagnostics handling by navigator to avoid conflicts
        end,
        lsp = {
          diagnostic = {
            enable = true, -- disable navigator diagnostic handling
          },
        },
      })
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
}
