-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = 'packer.lua',
})

packer.startup(function(use)
  -- package manager
  use("wbthomason/packer.nvim")

  use "lewis6991/impatient.nvim"

  -- TJ created lodash of neovim
  use("nvim-lua/plenary.nvim")

  use("nvim-lua/popup.nvim")

  use("nvim-telescope/telescope.nvim")
  -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable 'make' == 1 }
  use { "nvim-telescope/telescope-hop.nvim" }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use { "nvim-telescope/telescope-smart-history.nvim" }

  -- use {
  --   "folke/trouble.nvim",
  --   requires = "kyazdani42/nvim-web-devicons",
  --   config = function()
  --     require("trouble").setup {}
  --   end
  -- }

  -- Simple plugins can be specified as strings
  use "TimUntersberger/neogit"
  -- use "airblade/vim-gitgutter"
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb"
  use {
    "lewis6991/gitsigns.nvim",
  }

  -- Lsp Config
  use {
    "neovim/nvim-lspconfig",
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      "j-hui/fidget.nvim",

      -- Additional lua configuration, makes nvim stuff amazing
      "folke/neodev.nvim",
    },

  }
  use("onsails/lspkind-nvim")
  use("nvim-lua/lsp_extensions.nvim")
  use("simrat39/symbols-outline.nvim")
  -- use("glepnir/lspsaga.nvim")

  -- third party code format
  use("sbdchd/neoformat")

  -- Better LSP experience
  -- use {
  --   "j-hui/fidget.nvim",
  --   config = function()
  --     require "fidget".setup {
  --       window = {
  --         blend = 0,
  --       },
  --     }
  --   end
  -- }

  -- Null lsp
  use "jose-elias-alvarez/null-ls.nvim" -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use "MunifTanjim/prettier.nvim" -- Prettier plugin for Neovim's built-in LSP client

  -- auto completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
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
  }

  use "rafamadriz/friendly-snippets"

  -- code hilight, edit, navigation
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use { 'nvim-treesitter/nvim-treesitter-context', after = 'nvim-treesitter' }

  -- utilitis
  use({
    "kylechui/nvim-surround",
  })

  use "mbbill/undotree"

  use "tpope/vim-sleuth" -- Detect tabstop and shiftwidth automatically

  -- use "tpope/vim-surround" -- Surround text objects easily
  -- use {
  --   "windwp/nvim-autopairs",
  --   config = function() require("nvim-autopairs").setup {
  --       disable_filetype = { "TelescopePromp", "vim" }
  --     }
  --   end
  -- }

  use {
    "windwp/nvim-ts-autotag",
    config = function() require("nvim-ts-autotag").setup() end
  }

  -- file marker & navigation
  use "ThePrimeagen/harpoon"

  -- Navigation
  use {
    "ggandor/leap.nvim",
    requires = {
      "tpope/vim-repeat"
    }
  }
  -- use {
  --   "justinmk/vim-sneak",
  --   requires = {
  --     "tpope/vim-repeat"
  --   }
  -- }
  -- use {
  --   "phaazon/hop.nvim",
  --   branch = 'v2',
  --   as = "hop",
  --   config = function()
  --     -- you can configure Hop the way you like here; see :h hop-config
  --     require "hop".setup { keys = "arsgmeioqwfpbjluyzxcdvkhtn" }
  --   end
  -- }

  -- use 'ggandor/lightspeed.nvim'
  -- vim.g.any_jump_disable_default_keybindings = 1
  -- use { "pechorin/any-jump.vim" }

  -- Color highlight
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup()
    end
  }

  -- use "machakann/vim-highlightedyank"

  -- commenter
  -- use "terrortylor/nvim-comment"
  use("numToStr/Comment.nvim")
  -- treesitter
  --use("nvim-treesitter/playground")
  -- use("romgrk/nvim-treesitter-context")

  -- Debug
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")

  -- UI improvement
  -- dashboard
  -- use "mhinz/vim-startify"
  use("goolord/alpha-nvim")
  -- use({
  --   "folke/noice.nvim",
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- })

  -- -- status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }
  -- GUI Keymaps
  --
  use("anuvyklack/hydra.nvim")
  use {
    "folke/which-key.nvim",
  }
  --

  -- Colorscheme section
  use("tjdevries/colorbuddy.nvim")
  use "morhetz/gruvbox"
  -- use("gruvbox-community/gruvbox")
  -- use("folke/tokyonight.nvim")
  -- use("rebelot/kanagawa.nvim")
  -- use("B4mbus/oxocarbon-lua.nvim")
  -- use { "catppuccin/nvim", as = "catppuccin" }
  -- use 'navarasu/onedark.nvim'
  -- use({
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = function()
  --     vim.cmd('colorscheme rose-pine')
  --   end
  -- })
  -- use { "shaunsingh/oxocarbon.nvim", run = "./install.sh" }

  --
  -- indent matching line
  use "lukas-reineke/indent-blankline.nvim"
  -- use "p00f/nvim-ts-rainbow"

  -- misc
  -- use "echasnovski/mini.nvim"
  -- use "axkirillov/easypick.nvim"
  -- use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  -- use {'krady21/compiler-explorer.nvim'}

  -- AI assistant
  -- use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }
  -- use("github/copilot.vim")
  use {
    "zbirenbaum/copilot.lua",
    -- event = "InsertEnter",
    -- config = function()
    --   vim.schedule(function()
    --     require("copilot").setup()
    --   end, 100)
    -- end,
  }

  -- use {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end
  -- }
  --
  -- Note taking


  -- Training & games
  -- use("tjdevries/train.nvim")
  -- use { "ja-ford/delaytrain.nvim", config = function()
  --   require("delaytrain").setup(
  --     {
  --       grace_period = 2,
  --     }
  --   )
  -- end }

  -- Langague specific
  -- Rust:

  use("simrat39/rust-tools.nvim")
  -- C++:
  use "cdelledonne/vim-cmake"
end
)
