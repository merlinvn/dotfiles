return {
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
    keys = {
      {
        "<Leader>cg", ":lua require('neogen').generate()<CR>",
        noremap = true, silent = true, desc = "Generate docs"
      }
    },
    config = true
  },
}
