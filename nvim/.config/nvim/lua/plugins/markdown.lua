return {
  {
    "preservim/vim-markdown",
    dependencies = {
      "godlygeek/tabular",
    },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      -- vim.g.vim_markdown_folding_level = 3
    end,
  },
}
