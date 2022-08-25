local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
-- local trouble = require("trouble.providers.telescope")
telescope.setup {
  defaults = {
    -- file_sorter = require "telescope.sorters".get_fuzzy_file(),
    prompt_prefix = " > ",
    color_devicons = true,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- mappings = {i = {["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist}},
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist,
        -- ["<c-t>"] = trouble.open_with_trouble
      },
      n = {
        -- ["<c-t>"] = trouble.open_with_trouble
      },
    },
    set_env = { ["COLORTERM"] = "truecolor" }
    -- file_ignore_patterns = { "ext/.*" } -- comment this line for non C++ project
  },
  pickers = {
    -- find_files = {
    --   mappings = {
    --     n = {
    --       ["cd"] = function(prompt_bufnr)
    --         local selection = require("telescope.actions.state").get_selected_entry()
    --         local dir = vim.fn.fnamemodify(selection.path, ":p:h")
    --         require("telescope.actions").close(prompt_bufnr)
    --         -- Depending on what you want put `cd`, `lcd`, `tcd`
    --         vim.cmd(string.format("silent lcd %s", dir))
    --       end
    --     }
    --   }
    -- }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}
