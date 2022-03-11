local M = {}
M.search_dotfiles = function()
  require("telescope.builtin").find_files(
    {
      prompt_title = "< My dotfiles >",
      cwd = "$HOME/dotfiles/",
      find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"}
    }
  )
end

M.git_branches = function()
  require("telescope.builtin").git_branches(
    {
      attach_mappings = function(prompt_bufnr, map)
        map("i", "<c-d>", actions.git_delete_branch)
        map("n", "<c-d>", actions.git_delete_branch)
        return true
      end
    }
  )
end

return M
