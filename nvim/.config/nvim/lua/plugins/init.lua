-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system(
    {
      "git",
      "clone",
      "https://github.com/wbthomason/packer.nvim",
      install_path
    }
  )
  execute "packadd packer.nvim"
end

-- vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require("packer").startup(
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
      config = function()
        require("plugins.config.telescope").setup {}
      end
    }
    -- use "nvim-telescope/telescope-fzy-native.nvim"use
    -- {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

    -- Color scheme
    -- use 'gruvbox-community/gruvbox'
    use "sainnhe/gruvbox-material"
    -- status line
    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true},
      config = function()
        require("lualine").setup {options = {theme = "gruvbox"}}
      end
    }
    -- lsp
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require("plugins.config.lsp").setup {}
      end
    }

    use {
      "windwp/nvim-autopairs",
      run = "make",
      config = function()
        require("nvim-autopairs").setup {}
      end
    }
    -- Autocomplete
    -- Install nvim-cmp, and buffer source as a dependency
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-emoji",
        "SirVer/ultisnips",
        "quangnguyen30192/cmp-nvim-ultisnips",
        "octaltree/cmp-look",
        "f3fora/cmp-spell",
        "ray-x/cmp-treesitter"
      },
      config = function()
        require("plugins.config.nvim-cmp").setup()
      end
    }

    use {
      "github/copilot.vim"
    }

    -- Better LSP experience
    -- use {'tjdevries/astronauta.nvim'}
    -- use {
    --   "glepnir/lspsaga.nvim",
    --   config = function()
    --     require("plugins.config.lspsaga").setup()
    --   end
    -- }

    use {
      "onsails/lspkind-nvim",
      config = function()
        require("lspkind").init()
      end
    }

    -- Snippets
    -- use {
    --     'hrsh7th/vim-vsnip',
    --     requires = {
    --         'rafamadriz/friendly-snippets', 'cstrap/python-snippets',
    --         'ylcnfrht/vscode-python-snippet-pack', 'xabikos/vscode-javascript',
    --         'golang/vscode-go', 'rust-lang/vscode-rust'
    --     }
    -- }
    use {
      "SirVer/ultisnips",
      requires = {"honza/vim-snippets"},
      config = function()
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
      end
    }

    -- commenter
    -- use 'preservim/nerdcommenter
    -- use 'tpope/vim-commentary'
    use {
      "terrortylor/nvim-comment",
      config = function()
        require("plugins.config.nvim-comment").setup {}
      end
    }

    -- GIT
    use "airblade/vim-gitgutter"
    --
    --
    -- formatter
    -- use 'sbdchd/neoformat'
    use {
      "mhartington/formatter.nvim",
      config = function()
        require("plugins.config.formatter").setup {}
      end
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("plugins.config.treesitter").setup()
      end
    }
    -- must run :TSInstall <language> latter{

    -- use 'p00f/nvim-ts-rainbow'
    -- use 'lukas-reineke/indent-blankline.nvim'
    -- use 'JoosepAlviste/nvim-ts-context-commentstring'
    -- use 'romgrk/nvim-treesitter-context'

    -- Navigation
    use {
      "phaazon/hop.nvim",
      as = "hop",
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require "hop".setup {keys = "arsgmeioqwfpbjluyzxcdvkhtn"}
        -- require "hop".setup()
      end
    }

    -- Color highlight
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("plugins.config.colorizer").setup()
      end
    }
    use "machakann/vim-highlightedyank"

    -- debuger
    -- use 'mfussenegger/nvim-dap'
    --
    -- General
    use "mhinz/vim-startify"
    use {
      "folke/which-key.nvim",
      config = function()
        require("plugins.config.which-key").setup()
      end
    }

    -- other programming languages
    use "neovimhaskell/haskell-vim"
    use {
      "ndmitchell/ghcid",
      rtp = "plugins/nvim"
    }
  end
)
