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
    },
  },

  {
    "mbbill/undotree",
    keys = {
      {
        "<leader>u",
        ":UndotreeToggle<CR>",
        noremap = true,
        silent = true,
        desc = "Toggle undotree",
      },
    },
  },

  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  {
    "asiryk/auto-hlsearch.nvim",
    version = "1.0.0",
    config = function()
      require("auto-hlsearch").setup()
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    version = "nightly", -- optional, updated every week. (see issue #1193)
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
      {
        "<leader>of",
        ":NvimTreeFindFile<CR>",
        noremap = true,
        silent = true,
        desc = "Tree find file",
      },
      {
        "<leader>ot",
        ":NvimTreeToggle<CR>",
        noremap = true,
        silent = true,
        desc = "Tree toggle",
      },
      {
        "<leader>op",
        ":NvimTreeFocus<CR>",
        noremap = true,
        silent = true,
        desc = "Tree focus",
      },
    },
  },

  {
    "junegunn/vim-easy-align",
    keys = {
      { "ga", "<Plug>(EasyAlign)", desc = "Easy Align", mode = { "n", "x" } },
    },
  },
  {
    "godlygeek/tabular",
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = true,
    keys = {
      {
        "<leader>xx",
        "<cmd>TroubleToggle<cr>",
        silent = true,
        noremap = true,
        desc = "Toggle Trouble",
      },
      {
        "<leader>xw",
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
        silent = true,
        noremap = true,
        desc = "Workspace Diagnostics",
      },
      {
        "<leader>xd",
        "<cmd>TroubleToggle document_diagnostics<cr>",
        silent = true,
        noremap = true,
        desc = "Document Diagnostics",
      },
      {
        "<leader>xl",
        "<cmd>TroubleToggle loclist<cr>",
        silent = true,
        noremap = true,
        desc = "Loclist",
      },
      {
        "<leader>xq",
        "<cmd>TroubleToggle quickfix<cr>",
        silent = true,
        noremap = true,
        desc = "Quickfix",
      },
      {
        "gR",
        "<cmd>TroubleToggle lsp_references<cr>",
        silent = true,
        noremap = true,
        desc = "LSP References",
      },
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
