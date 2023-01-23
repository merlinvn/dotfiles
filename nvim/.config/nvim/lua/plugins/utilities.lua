return {

  -- utilities
  "kylechui/nvim-surround",

  "mbbill/undotree",

  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  {
    "asiryk/auto-hlsearch.nvim",
    version = "1.0.0",
    config = function()
      require("auto-hlsearch").setup()
    end
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    version = 'nightly' -- optional, updated every week. (see issue #1193)
  },

  -- underline or highlight word at cursor
  "echasnovski/mini.cursorword",

  -- manage session
  "echasnovski/mini.sessions",


  -- remove buffers but reserver window layout
  {
    "echasnovski/mini.bufremove",
    version = false,
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
      { "<leader>q", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>Q", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- },
  --
  -- -- "tpope/vim-surround", -- Surround text objects easily
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function() require("nvim-autopairs").setup {
  --       disable_filetype = { "TelescopePromp", "vim" }
  --     }
  --   end
  -- },

}
