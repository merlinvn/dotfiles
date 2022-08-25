local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(
  function(use)
    use("wbthomason/packer.nvim")

    use 'lewis6991/impatient.nvim'

    -- TJ created lodash of neovim
    use("nvim-lua/plenary.nvim")

    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
    -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
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
    use("TimUntersberger/neogit")
    -- use "airblade/vim-gitgutter"
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }

    -- All the things
    use("neovim/nvim-lspconfig")
    use("onsails/lspkind-nvim")
    use("williamboman/nvim-lsp-installer")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")

    -- third party code format
    use("sbdchd/neoformat")

    -- Better LSP experience
    use {
      "j-hui/fidget.nvim",
      config = function()
        require "fidget".setup {}
      end
    }

    -- Null lsp
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

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
        -- "ray-x/cmp-treesitter",
        -- "f3fora/cmp-spell",
        -- "octaltree/cmp-look",
      }
    }

    use "rafamadriz/friendly-snippets"


    use(
      "nvim-treesitter/nvim-treesitter",
      {
        run = ":TSUpdate"
      }
    )

    -- utilitis
    use({
      "kylechui/nvim-surround",
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end
    })
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
      "phaazon/hop.nvim",
      branch = 'v2',
      as = "hop",
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require "hop".setup { keys = "arsgmeioqwfpbjluyzxcdvkhtn" }
      end
    }

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
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")
    use("rebelot/kanagawa.nvim")
    use("B4mbus/oxocarbon-lua.nvim")
    -- use { 'shaunsingh/oxocarbon.nvim', run = './install.sh' }

    --
    -- indent matching line
    use "lukas-reineke/indent-blankline.nvim"
    -- use "p00f/nvim-ts-rainbow"

    -- AI assistant
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    -- use("github/copilot.vim")

    -- Note taking


    -- Training & games
    -- use("tjdevries/train.nvim")


    -- Langague specific
    -- Rust:

    use("simrat39/rust-tools.nvim")
  end
)
