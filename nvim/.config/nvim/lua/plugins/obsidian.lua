return {
  {
    "epwalsh/obsidian.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "godlygeek/tabular",
      "preservim/vim-markdown",
    },
    opts = {
      dir = "~/My_zet/Neo's thought",
      notes_subdir = "notes",
      daily_notes = {
        folder = "notes/dailies",
      },
      completion = {
        nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
      },
    },
    enabled = false,
  },
}
