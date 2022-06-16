_ = vim.cmd [[packadd packer.nvim]]
_ = vim.cmd [[packadd vimball]]

local has = function(x)
  return vim.fn.has(x) == 1
end

local executable = function(x)
  return vim.fn.executable(x) == 1
end

local is_wsl = (function()
  local output = vim.fn.systemlist "uname -r"
  return not (not string.find(output[1] or "", "WSL"))
end)()

vim.cmd(
[[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
)

return require("packer").startup(
  function(use)
  local local_use = function(first, second, opts)
    opts = opts or {}

    local plug_path, home
    if second == nil then
      plug_path = first
      home = "neo"
    else
      plug_path = second
      home = first
    end

    if vim.fn.isdirectory(vim.fn.expand("~/plugins/" .. plug_path)) == 1 then
      opts[1] = "~/plugins/" .. plug_path
    else
      opts[1] = string.format("%s/%s", home, plug_path)
    end

    use(opts)
  end

  local py_use = function(opts)
    if not has "python3" then
      return
    end

    use(opts)
  end

  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use "lewis6991/impatient.nvim"

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } }
  }

  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope-hop.nvim" }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use { "nvim-telescope/telescope-smart-history.nvim" }

  -- Color scheme
  -- use 'gruvbox-community/gruvbox'
  use "sainnhe/gruvbox-material"
  -- status line
  use {
    "hoob3rt/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup { options = { theme = "gruvbox" } }
    end
  }
  -- lsp
  use {
    "williamboman/nvim-lsp-installer",
    {
      "neovim/nvim-lspconfig",
    }
  }
  -- use "neovim/nvim-lspconfig"

  -- Better LSP experience
  -- use "wbthomason/lsp-status.nvim"
  use {
    "j-hui/fidget.nvim",
    config = function()
      require "fidget".setup {}
    end
  }

  -- use {
  --   "ericpubu/lsp_codelens_extensions.nvim",
  --   config = function()
  --     require("codelens_extensions").setup {}
  --   end
  -- }
  -- use {'tjdevries/astronauta.nvim'}
  -- use {
  --   "glepnir/lspsaga.nvim",
  --   config = function()
  --     require("plugins.config.lspsaga").setup()
  --   end
  -- }

  use "onsails/lspkind.nvim"

  use "nvim-lua/lsp_extensions.nvim"

  -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'

  use 'p00f/clangd_extensions.nvim'

  -- merge with tools for languages that has no LSP support
  -- or extend the functionallity of LSP
  -- use({
  --   "jose-elias-alvarez/null-ls.nvim",
  --   requires = { "nvim-lua/plenary.nvim" },
  -- })

  -- END OF LSP CONFIG --

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
      "octaltree/cmp-look",
      "f3fora/cmp-spell",
      "ray-x/cmp-treesitter",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip"
    }
  }

  use "rafamadriz/friendly-snippets"

  use {
    "github/copilot.vim"
  }

  -- commenter
  -- use 'preservim/nerdcommenter
  -- use 'tpope/vim-commentary'
  use "terrortylor/nvim-comment"

  -- GIT
  use "airblade/vim-gitgutter"
  --
  --
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
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
      require "hop".setup { keys = "arsgmeioqwfpbjluyzxcdvkhtn" }
      -- require "hop".setup()
    end
  }

  -- Color highlight
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup()
    end
  }

  use "machakann/vim-highlightedyank"

  -- debuger
  -- use 'mfussenegger/nvim-dap'
  --
  -- General
  use "mhinz/vim-startify"
  use "folke/which-key.nvim"

  -- other programming languages
  use "neovimhaskell/haskell-vim"
  use {
    "ndmitchell/ghcid",
    rtp = "plugins/nvim"
  }
end
)
