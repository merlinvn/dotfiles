return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      local opts = {
        char = "┊",
        filetype_exclude = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "nvim-tree",
          "Trouble",
          "lazy",
        },
        show_end_of_line = false,
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
        show_trailing_blankline_indent = false,
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
      }
      vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
      require("indent_blankline").setup(opts)
    end,
  },
}
