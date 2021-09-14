local M = {}

function M.setup()
  local actions = require("telescope.actions")
  require("telescope").setup {
    defaults = {
      file_sorter = require "telescope.sorters".get_fuzzy_sorter,
      prompt_prefix = " > ",
      color_devicons = true,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- mappings = {i = {["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist}},
      mappings = {i = {["<C-q>"] = actions.send_to_qflist}},
      set_env = {["COLORTERM"] = "truecolor"},
      file_ignore_patterns = {"ext/.*"} -- comment this line for non C++ project
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true
      }
    }
  }

  require("telescope").load_extension("fzy_native")
end

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
