return require("packer").startup(
  function()
    use("wbthomason/packer.nvim")
    use("sbdchd/neoformat")

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

    -- Simple plugins can be specified as strings
    use("TimUntersberger/neogit")
    use "airblade/vim-gitgutter"

    -- All the things
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer")
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")

    -- Better LSP experience
    use {
      "j-hui/fidget.nvim",
      config = function()
        require "fidget".setup {}
      end
    }

    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-emoji",
        "octaltree/cmp-look",
        "f3fora/cmp-spell",
        "ray-x/cmp-treesitter",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip"
      }
    }

    use "rafamadriz/friendly-snippets"

    --use("tzachar/cmp-tabnine", {run = "./install.sh"})

    use(
      "nvim-treesitter/nvim-treesitter",
      {
        run = ":TSUpdate"
      }
    )

    -- utilitis
    use "tpope/vim-surround" -- Surround text objects easily
    use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }

    -- Navigation
    use {
      "phaazon/hop.nvim",
      as = "hop",
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require "hop".setup { keys = "arsgmeioqwfpbjluyzxcdvkhtn" }
      end
    }

    -- vim.g.any_jump_disable_default_keybindings = 1
    use { "pechorin/any-jump.vim" }

    -- Color highlight
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require "colorizer".setup()
      end
    }

    -- use "machakann/vim-highlightedyank"

    -- commenter
    use { 'numToStr/Comment.nvim' }
    --use("nvim-treesitter/playground")
    -- use("romgrk/nvim-treesitter-context")

    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    -- status line
    use {
      "hoob3rt/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = function()
        require("lualine").setup { options = { theme = "onedark" } }
      end
    }
    -- Colorscheme section
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")

    use("github/copilot.vim")
  end
)
