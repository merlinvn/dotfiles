return {
  {
    "echasnovski/mini.fuzzy",
    config = function(_,opts)
      require("mini.fuzzy").setup(opts)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "echasnovski/mini.fuzzy" }
  },
  -- switch to mini.fuzzy
  -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable 'make' == 1 },
  "nvim-telescope/telescope-hop.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-smart-history.nvim",

}
