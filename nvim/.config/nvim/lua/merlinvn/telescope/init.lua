local M = {}

local dotfiles_path = "$HOME/dotfiles/"

if vim.fn.has('win32') == 1 then
  dotfiles_path = "~/.config"
end

M.search_dotfiles = function()
  require("telescope.builtin").find_files(
    {
    prompt_title = "< My dotfiles >",
    cwd = dotfiles_path,
    find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" }
  }
  )
end

M.project_files = function()
  local opts = {
    find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" }
  } -- define here if you want to define something
  local ok = pcall(require "telescope.builtin".git_files, opts)
  if not ok then require "telescope.builtin".find_files(opts) end
end

return M
