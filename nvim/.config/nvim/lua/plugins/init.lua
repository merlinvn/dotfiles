return {
  "wbthomason/packer.nvim",

  "lewis6991/impatient.nvim",

  -- TJ created lodash of neovim
  "nvim-lua/plenary.nvim",

  "echasnovski/mini.nvim",

  "nvim-telescope/telescope.nvim",
  -- switch to mini.fuzzy
  -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable 'make' == 1 },
  "nvim-telescope/telescope-hop.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-smart-history.nvim",


  -- Simple plugins can be specified as strings
  "TimUntersberger/neogit",
  -- "airblade/vim-gitgutter",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "lewis6991/gitsigns.nvim",

  -- Lsp Config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      "j-hui/fidget.nvim",

      -- Additional lua configuration, makes nvim stuff amazing
      "folke/neodev.nvim",
    },
  },
  "onsails/lspkind-nvim",
  "nvim-lua/lsp_extensions.nvim",
  "simrat39/symbols-outline.nvim",
  -- "glepnir/lspsaga.nvim",

  -- third party code format
  "sbdchd/neoformat",

  -- Better LSP experience
  -- {
  --   "j-hui/fidget.nvim",
  --   config = function()
  --     require "fidget".setup {
  --       window = {
  --         blend = 0,
  --       },
  --     }
  --   end
  -- },

  -- Null lsp
  "jose-elias-alvarez/null-ls.nvim", -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  "MunifTanjim/prettier.nvim", -- Prettier plugin for Neovim's built-in LSP client

  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      -- "hrsh7th/cmp-copilot",
      -- "ray-x/cmp-treesitter",
      -- "f3fora/cmp-spell",
      -- "octaltree/cmp-look",
    }
  },

  "rafamadriz/friendly-snippets",

  -- code hilight, edit, navigation
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter',
  },

  { 'nvim-treesitter/nvim-treesitter-context', dependencies = 'nvim-treesitter' },

  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },

  -- utilitis
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
    "windwp/nvim-ts-autotag",
    config = function() require("nvim-ts-autotag").setup() end
  },

  -- file marker & navigation
  "ThePrimeagen/harpoon",

  -- Navigation
  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat"
    }
  },
  -- {
  --   "justinmk/vim-sneak",
  --   dependencies = {
  --     "tpope/vim-repeat"
  --   }
  -- },
  --  {
  --   "phaazon/hop.nvim",
  --   branch = 'v2',
  --   as = "hop",
  --   config = function()
  --     -- you can configure Hop the way you like here; see :h hop-config
  --     require "hop".setup { keys = "arsgmeioqwfpbjluyzxcdvkhtn" }
  --   end
  -- },

  -- "ggandor/lightspeed.nvim"
  -- vim.g.any_jump_disable_default_keybindings = 1
  --  "pechorin/any-jump.vim",

  -- Color highlight
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup()
    end
  },

  -- "machakann/vim-highlightedyank",

  -- commenter
  -- "terrortylor/nvim-comment",
  -- "numToStr/Comment.nvim",

  -- treesitter
  --"nvim-treesitter/playground",
  -- "romgrk/nvim-treesitter-context",

  -- Debug
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",

  -- UI improvement
  -- dashboard
  -- use mini-stater for dashboard
  -- "mhinz/vim-startify",
  -- "goolord/alpha-nvim",
  -- use({
  --   "folke/noice.nvim",
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- })

  -- -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true }
  },

  -- tabline
  { 'akinsho/bufferline.nvim', version = "v3.*", dependencies = 'nvim-tree/nvim-web-devicons' },

  -- GUI Keymaps
  "anuvyklack/hydra.nvim",
  "folke/which-key.nvim",

  -- Colorscheme section
  "tjdevries/colorbuddy.nvim",
  "morhetz/gruvbox",
  -- "gruvbox-community/gruvbox",
  -- "folke/tokyonight.nvim",
  -- "rebelot/kanagawa.nvim",
  -- "B4mbus/oxocarbon-lua.nvim",
  -- { "catppuccin/nvim", as = "catppuccin" },
  -- use 'navarasu/onedark.nvim'
  -- use({
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = function()
  --     vim.cmd('colorscheme rose-pine')
  --   end
  -- })
  -- { "shaunsingh/oxocarbon.nvim", build = "./install.sh" },

  --
  -- indent matching line
  "lukas-reineke/indent-blankline.nvim",
  -- "p00f/nvim-ts-rainbow",

  -- misc
  -- "echasnovski/mini.nvim",
  -- "axkirillov/easypick.nvim",
  -- { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  -- {'krady21/compiler-explorer.nvim'},

  -- AI assistant
  -- { "tzachar/cmp-tabnine", build = "./install.sh", dependencies = "hrsh7th/nvim-cmp" },
  -- "github/copilot.vim",
  {
    "zbirenbaum/copilot.lua",
    -- event = "InsertEnter",
    -- config = function()
    --   vim.schedule(function()
    --     require("copilot").setup()
    --   end, 100)
    -- end,
  },

  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end
  -- },
  --
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

  -- Langague specific
  -- Rust:

  "simrat39/rust-tools.nvim",
  -- C++:
  "cdelledonne/vim-cmake",


}
