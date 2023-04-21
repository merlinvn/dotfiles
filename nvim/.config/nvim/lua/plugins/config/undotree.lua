local M = {}

M.keys = {
  {
    "<leader>eu",
    ":UndotreeToggle<CR>",
    noremap = true,
    silent = true,
    desc = "Toggle undotree",
  },
}

return M
