return {

  {
    "yorickpeterse/nvim-window",
    config = function()
      require("nvim-window").setup({
        normal_hl = "GruvboxOrangeBold",
        hint_hl = "Bold",
        border = "double",
        -- The characters available for hinting windows.
        chars = {
          "a",
          "b",
          "c",
          "d",
          "e",
          "f",
          "g",
          "h",
          "i",
          "j",
          "k",
          "l",
          "m",
          "n",
          "o",
          "p",
          "q",
          "r",
          "s",
          "t",
          "u",
          "v",
          "w",
          "x",
          "y",
          "z",
        },
      })
    end,
    keys = {
      {
        "<leader>w",
        "<cmd>lua require('nvim-window').pick()<CR>",
        desc = "Window picker",
      },
    },
  },
}
