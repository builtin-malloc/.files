--------------------------------------------------------------------------------
-- PLUGIN MANAGER --------------------------------------------------------------
--------------------------------------------------------------------------------

require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "NLKNguyen/papercolor-theme",
    lazy = false,
    config = function()
      vim.opt.termguicolors  = true
      vim.opt.background = "light"
      vim.cmd("colorscheme PaperColor")
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup()
    end
  },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
})

--------------------------------------------------------------------------------
-- FUZZY FINDER ----------------------------------------------------------------
--------------------------------------------------------------------------------

local telescope = require("telescope")

telescope.setup({
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
  }
})

--------------------------------------------------------------------------------
-- COMPLETION ------------------------------------------------------------------
--------------------------------------------------------------------------------

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }),
})
