local M = {}

M.keys = {
  {
    "<leader>u",
    ":UndotreeToggle<CR>",
    noremap = true,
    silent = true,
    desc = "Toggle undotree",
  },
}

return M
