return {

  -- utilities
  {
    "kylechui/nvim-surround",
    opts = {
      -- Configuration here, or leave empty to use defaults
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "<C-s>",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
      },
    }
  },

  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", ":UndotreeToggle<CR>", noremap = true, silent = true, desc = "Toggle undotree" },
    }
  },

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
    version = 'nightly', -- optional, updated every week. (see issue #1193)
    opts = {
      sort_by = "case_sensitive",
      view = {
        adaptive_size = true,
        mappings = {
          list = {
            { key = "u", action = "dir_up" },
          },
        },
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    },
    keys = {
      { "<leader>ne", ":NvimTreeFindFile<CR>", { noremap = true, silent = true, desc = "Tree find file" } },
      { "<leader>nn", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Tree toggle" } },
      { "<leader>nf", ":NvimTreeFocus<CR>", { noremap = true, silent = true, desc = "Tree focus" } },
    }
  },

  -- underline or highlight word at cursor
  { "echasnovski/mini.cursorword",
    config = function()
      require("mini.cursorword").setup({})
    end,
  },

  -- manage session
  { "echasnovski/mini.sessions",
    config = function()
      require("mini.sessions").setup({})
    end,
  },

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

  {
    "junegunn/vim-easy-align",
    keys = {
      { "ga", "<Plug>(EasyAlign)", desc = "Easy Align", mode = { "n", "x" } },
    }
  }
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
