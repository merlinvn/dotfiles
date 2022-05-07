local M = {}
M.search_dotfiles = function()
  require("telescope.builtin").find_files(
    {
    prompt_title = "< My dotfiles >",
    cwd = "$HOME/dotfiles/",
    find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" }
  }
  )
end

return M
