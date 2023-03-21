return {
  -- "lewis6991/impatient.nvim",
  -- {{{ Must-have
  -- TJ created lodash of neovim
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },

  -- }}}

  -- {{{ Treesitter

  --  hilight, edit, navigation
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = require("plugins.config.treesitter").opts,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- { -- Additional text objects via treesitter
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   dependencies = "nvim-treesitter",
  --   event = "BufReadPost",
  -- },

  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter",
    event = "BufReadPost",
    config = true,
  },

  {
    "windwp/nvim-ts-autotag",
    event = "BufReadPost",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "nvim-treesitter/playground",
    event = "BufReadPre",
  },
  -- }}}

  -- {{{ Telescope
  {
    "echasnovski/mini.fuzzy",
    event = { "BufReadPost", "BufNewFile" },
    -- event = "BufEnter",
    config = function()
      require("mini.fuzzy").setup({})
    end,
  },
  {
    "nvim-telescope/telescope-hop.nvim",
    event = "VeryLazy",
    enabled = false,
  },
  {
    "nvim-telescope/telescope-smart-history.nvim",
    event = "VeryLazy",
    enabled = false,
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "echasnovski/mini.fuzzy",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = require("plugins.config.telescope").config,
    keys = require("plugins.config.telescope").keys,
  },
  -- }}}

  -- {{{ LSP

  -- Lsp Config
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Useful status updates for LSP
      "j-hui/fidget.nvim",

      -- Additional lua configuration, makes nvim stuff amazing
      "folke/neodev.nvim",
      {
        "simrat39/rust-tools.nvim",
        event = { "BufReadPre", "BufNewFile" },
      },
    },

    opts = require("plugins.config.lsp").opts,
    config = require("plugins.config.lsp").config,
    keys = require("plugins.config.lsp").keys,
  },
  {
    "simrat39/rust-tools.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = require("plugins.config.null-ls").opts,
  },
  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "Mason",
    keys = { { "<leader>vm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = require("plugins.config.mason").opts,
    config = require("plugins.config.mason").config,
  },
  {
    "j-hui/fidget.nvim",
    event = "BufReadPre",
    config = true,
    enabled = false,
  },
  {
    "folke/neodev.nvim",
    event = "BufReadPre",
    config = true,
  },

  {
    "onsails/lspkind-nvim",
    event = "BufReadPre",
  },
  {
    "nvim-lua/lsp_extensions.nvim",
    event = "BufReadPre",
  },
  {
    "simrat39/symbols-outline.nvim",
    event = "BufReadPre",
  },
  -- lspsaga is still buggy
  {
    "glepnir/lspsaga.nvim",
    enabled = false,
    event = "BufRead",
    opts = {
      rename = {
        quit = "<esc>",
      },
      scroll_preview = {
        scroll_down = "<C-d>",
        scroll_up = "<C-u>",
      },
      beacon = {
        enable = false,
        frequency = 7,
      },
    },
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  -- }}}

  -- {{{ Navigation
  -- file marker & navigation
  {
    "ThePrimeagen/harpoon",
    keys = require("plugins.config.harpoon").keys,
  },

  -- Navigation
  {
    "ggandor/flit.nvim",
    dependencies = {
      "ggandor/leap.nvim",
    },
    config = function()
      require("flit").setup()
    end,
    enabled = false,
  },
  {
    "ggandor/leap.nvim",
    event = "BufReadPre",
    dependencies = {
      "tpope/vim-repeat",
    },
    opts = require("plugins.config.leap").opts,
    keys = require("plugins.config.leap").keys,
  },

  {
    "echasnovski/mini.jump",
    event = "BufReadPre",
    version = false,
    opts = {},
    config = function(_, opts)
      require("mini.jump").setup(opts)
    end,
  },
  -- }}} end of navigation

  --{{{ UI
  {
    "echasnovski/mini.starter",
    lazy = false,
    config = function()
      require("mini.starter").setup()
    end,
  },
  -- manage session
  {
    "echasnovski/mini.sessions",
    config = function()
      require("mini.sessions").setup({})
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
    opts = require("plugins.config.noice").opts,
    -- keys = require("plugins.config.noice").keys,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = require("plugins.config.indent-blankline").config,
  },
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = { "BufReadPre", "BufNewFile" },
    opts = require("plugins.config.bufferline").opts,
    keys = require("plugins.config.bufferline").keys,
    config = require("plugins.config.bufferline").config,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    opts = require("plugins.config.lualine").opts,
    enabled = false,
  },

  {
    "echasnovski/mini.statusline",
    version = false,
    config = function()
      require("mini.statusline").setup()
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    branch = "main",
    opts = require("plugins.config.toggleterm").opts,
    keys = require("plugins.config.toggleterm").keys,
  },
  {
    "mrjones2014/smart-splits.nvim",
    opts = require("plugins.config.smart-splits").opts,
    keys = require("plugins.config.smart-splits").keys,
  },

  -- {{{2 Colors
  -- Colorscheme section
  -- Color highlight
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("colorizer").setup()
    end,
  },

  { "tjdevries/colorbuddy.nvim" },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme gruvbox]])
      require("plugins.config.color").colorMyPencils("gruvbox")
    end,
    enabled = false,
  },

  {
    "arturgoms/moonbow.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme gruvbox]])
      require("plugins.config.color").colorMyPencils("moonbow")
    end,
    enabled = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("plugins.config.catppuccin").config()
    end,
    enabled = false,
  },

  {
    "echasnovski/mini.base16",
    version = "*",
    config = require("plugins.config.mini.base16").config,
    enabled = false,
  },
  -- }}}
  --}}} end of UI

  -- {{{ Editor

  {
    "kylechui/nvim-surround",
    event = "InsertEnter",
    opts = require("plugins.config.nvim-surround").opts,
  },
  {
    "echasnovski/mini.ai",
    event = "BufReadPre",
    version = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = require("plugins.config.mini.ai").opts,
    config = require("plugins.config.mini.ai").config,
  },
  -- underline or highlight word at cursor
  {
    "echasnovski/mini.cursorword",
    event = "BufReadPre",
    config = function()
      require("mini.cursorword").setup({})
    end,
  },
  -- remove buffers but reserver window layout
  {
    "echasnovski/mini.bufremove",
    event = "BufReadPre",
    version = false,
    keys = require("plugins.config.mini.bufremove").keys,
  },
  {
    "echasnovski/mini.bracketed",
    event = "BufReadPre",
    config = function()
      require("mini.bracketed").setup({})
    end,
  },

  {
    "echasnovski/mini.splitjoin",
    event = "BufReadPre",
    version = false,
    config = function()
      require("mini.splitjoin").setup({})
    end,
  },
  -- }}}

  -- {{{ Coding

  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-calc",
      -- "hrsh7th/cmp-emoji",
      "saadparwaiz1/cmp_luasnip",
      -- "hrsh7th/cmp-copilot",
      -- "ray-x/cmp-treesitter",
      -- "f3fora/cmp-spell",
      -- "octaltree/cmp-look",
    },
    config = require("plugins.config.nvim-cmp").config,
  },
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    -- opts = require("plugins.config.luasnip").opts,
    config = require("plugins.config.luasnip").config,
    keys = require("plugins.config.luasnip").keys,
  },
  -- testting
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>ctt", "<cmd>TestNearest<cr>" },
      { "<leader>ctf", "<cmd>TestFile<cr>" },
      { "<leader>cts", "<cmd>TestSuite<cr>" },
      { "<leader>ctl", "<cmd>TestLast<cr>" },
      { "<leader>ctv", "<cmd>TestVisit<cr>" },
    },
  },
  -- commenter
  {
    "echasnovski/mini.comment",
    event = "BufReadPre",
    config = function()
      require("mini.comment").setup({})
    end,
  },

  -- Debug
  {
    "mfussenegger/nvim-dap",
    ft = { "rb", "rs", "cpp", "h" },
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    ft = { "rb", "rs", "cpp", "h" },
    keys = "<leader>dU",
    opts = require("plugins.config.nvim-dap").ui_opts,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    event = "BufReadPre",
    opts = require("plugins.config.nvim-dap").virtual_text_opts,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufReadPre",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },

  -- AI assistant
  -- { "tzachar/cmp-tabnine", build = "./install.sh", dependencies = "hrsh7th/nvim-cmp" },
  -- "github/copilot.vim",
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = require("plugins.config.copilot").opts,
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end
  -- },

  -- C++:
  {
    "cdelledonne/vim-cmake",
    config = function()
      vim.g.cmake_link_compile_commands = 1
    end,
    enabled = false,
  },

  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
    keys = {
      {
        "<Leader>cg",
        ":lua require('neogen').generate()<CR>",
        noremap = true,
        silent = true,
        desc = "Generate docs",
      },
    },
    config = true,
  },
  -- }}}

  -- {{{ Utils
  {
    "folke/which-key.nvim",
    dependencies = {
      "mrjones2014/legendary.nvim",
    },
    event = "VeryLazy",
    config = require("plugins.config.which-key").config,
  },
  {
    "mbbill/undotree",
    keys = require("plugins.config.undotree").keys,
  },

  -- Detect tabstop and shiftwidth automatically
  { "tpope/vim-sleuth", event = "BufReadPre" },

  {
    "asiryk/auto-hlsearch.nvim",
    event = "BufReadPre",
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
    opts = require("plugins.config.nvim-tree").opts,
    keys = require("plugins.config.nvim-tree").keys,
  },

  {
    "junegunn/vim-easy-align",
    event = "BufReadPre",
    keys = {
      { "ga", "<Plug>(EasyAlign)", desc = "Easy Align", mode = { "n", "x" } },
    },
  },
  {
    "godlygeek/tabular",
    event = "BufReadPre",
  },
  {
    "folke/trouble.nvim",
    event = "BufReadPre",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = true,
    keys = require("plugins.config.trouble").keys,
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

  {
    "epwalsh/obsidian.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "godlygeek/tabular",
      "preservim/vim-markdown",
    },
    opts = require("plugins.config.obsidian").opts,
    enabled = false,
  },
  {
    "preservim/vim-markdown",
    ft = "markdown",
    event = "BufRead *.md",
    dependencies = {
      "godlygeek/tabular",
    },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      -- vim.g.vim_markdown_folding_level = 3
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    keys = {
      {
        "<leader>gg",
        function()
          require("lazygit").lazygit()
        end,
        desc = "Lazygit",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require("plugins.config.gitsigns").opts,
  },
  -- "airblade/vim-gitgutter",
  -- "TimUntersberger/neogit",
  -- "tpope/vim-fugitive",
  -- "tpope/vim-rhubarb",
  -- }}}

  -- misc
  -- "axkirillov/easypick.nvim",
  -- { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  -- {'krady21/compiler-explorer.nvim'},

  -- Note taking

  -- Training & games
  -- "tjdevries/train.nvim",
  -- { "ja-ford/delaytrain.nvim", config = function()
  --   require("delaytrain").setup(
  --     {
  --       grace_period = 2,
  --     }
  --   )
  -- end },
}
