-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy finder
-- Telescope  
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'

-- Color scheme
  use 'gruvbox-community/gruvbox'

-- lsp
  use 'neovim/nvim-lspconfig'

-- Autocomplete
  use 'hrsh7th/nvim-compe'

-- formatter
  use 'sbdchd/neoformat'

-- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
-- must run :TSInstall <language> latter{

  --use 'p00f/nvim-ts-rainbow'
  --use 'lukas-reineke/indent-blankline.nvim'
  --use 'JoosepAlviste/nvim-ts-context-commentstring'
  --use 'romgrk/nvim-treesitter-context'


end)
