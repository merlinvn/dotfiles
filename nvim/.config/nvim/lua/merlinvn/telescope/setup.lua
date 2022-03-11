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
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

require("telescope").load_extension("fzf")
-- require("telescope").load_extension("fzy_native")
