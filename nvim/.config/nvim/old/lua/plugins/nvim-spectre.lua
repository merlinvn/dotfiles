return {
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>sR", function() require("spectre").open_visual({ select_word = true }) end,
                                                                                                desc =
        "Replace in all files" },
      { "<leader>sr", function() require("spectre").open_file_search({ select_word = true }) end,
                                                                                                desc =
        "Replace in current file" },
    },
  },
}
