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
  }
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

