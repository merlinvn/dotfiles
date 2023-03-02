local M = {}
M.opts = {
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
}

M.keys = {
  {
    "<leader>of",
    ":NvimTreeFindFile<CR>",
    noremap = true,
    silent = true,
    desc = "Tree find file",
  },
  {
    "<leader>ot",
    ":NvimTreeToggle<CR>",
    noremap = true,
    silent = true,
    desc = "Tree toggle",
  },
  {
    "<leader>op",
    ":NvimTreeFocus<CR>",
    noremap = true,
    silent = true,
    desc = "Tree focus",
  },
}
return M
