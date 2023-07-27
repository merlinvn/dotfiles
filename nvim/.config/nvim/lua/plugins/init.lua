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
    -- commit = "597a3cc889c1d16dc38ae4c61f9b542d5258815f",
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
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require("plugins.config.alpha-nvim").opts,
    config = require("plugins.config.alpha-nvim").config,
  },
  -- better vim.ui
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  -- {
  --   "echasnovski/mini.starter",
  --   event = "VimEnter",
  --   lazy = false,
  --   config = function()
  --     require("mini.starter").setup()
  --   end,
  -- },
  -- manage session
  -- {
  --   "echasnovski/mini.sessions",
  --   config = function()
  --     require("mini.sessions").setup({})
  --   end,
  -- },
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
      {
        "rcarriga/nvim-notify",
        keys = {
          {
            "<leader>on",
            function()
              require("notify").dismiss({ silent = true, pending = true })
            end,
            desc = "Delete all Notifications",
          },
        },
        opts = {
          timeout = 3000,
          max_height = function()
            return math.floor(vim.o.lines * 0.75)
          end,
          max_width = function()
            return math.floor(vim.o.columns * 0.75)
          end,
        },
      },
    },
    opts = require("plugins.config.noice").opts,
    keys = require("plugins.config.noice").keys,
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

  -- lsp symbol navigation for lualine
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = require("plugins.config.nvim-navic").init,
    opts = require("plugins.config.nvim-navic").opts,
    -- config = require("plugins.config.nvim-navic").config,
    enabled = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    opts = require("plugins.config.lualine").opts,
  },
  -- {
  --   "echasnovski/mini.statusline",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --     "lewis6991/gitsigns.nvim",
  --   },
  --   version = false,
  --   config = require("plugins.config.mini.statusline").config,
  -- },
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
    enabled = true,
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
    enabled = false,
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
  -- search/replace in multiple files
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
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
      { "<leader>ctt", "<cmd>TestNearest<cr>", desc = "Test nearest" },
      { "<leader>ctf", "<cmd>TestFile<cr>", desc = "Test file" },
      { "<leader>cts", "<cmd>TestSuite<cr>", desc = "Test suite" },
      { "<leader>ctl", "<cmd>TestLast<cr>", desc = "Test last" },
      { "<leader>ctv", "<cmd>TestVisit<cr>", desc = "Test visit" },
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
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "nvim-dap" },
        cmd = { "DapInstall", "DapUninstall" },
        opts = { handlers = {} },
      },
      {
        "rcarriga/nvim-dap-ui",
        ft = { "rb", "rs", "cpp", "h" },
        keys = {
          {
            "<leader>du",
            function()
              require("dapui").toggle({})
            end,
            desc = "Dap UI",
          },
          {
            "<leader>de",
            function()
              require("dapui").eval()
            end,
            desc = "Eval",
            mode = { "n", "v" },
          },
        },
        opts = require("plugins.config.nvim-dap").ui_opts,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        event = "BufReadPre",
        opts = require("plugins.config.nvim-dap").virtual_text_opts,
      },
    },
      -- stylua: ignore
    keys = {
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
  },

  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      {
        "<leader>xT",
        "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",
        desc = "Todo/Fix/Fixme (Trouble)",
      },
      { "<leader>sx", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      {
        "<leader>sX",
        "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
        desc = "Todo/Fix/Fixme",
      },
    },
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
  -- session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      options = {
        "buffers",
        "curdir",
        "tabpages",
        "winsize",
        "help",
        "globals",
        "skiprtp",
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

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
