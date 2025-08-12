return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      {
        "<leader>vn",
        function()
          require("fzf-lua").git_files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>vd",
        function()
          -- check if the folder exists, it could be .dotfiles or dotfiles
          local dotfiles = vim.fn.isdirectory(vim.fn.expand("$HOME/.dotfiles")) == 1 and "$HOME/.dotfiles"
            or "$HOME/.dotfiles"
          require("fzf-lua").git_files({ cwd = dotfiles })
        end,
        desc = "Find Dotfiles",
      },
    },
  },
}
