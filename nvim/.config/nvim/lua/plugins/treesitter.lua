return {
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
    "windwp/nvim-ts-autotag",
    config = function() require("nvim-ts-autotag").setup() end
  },

  "nvim-treesitter/playground",
}
