local M = {}

M.keys = {
  {
    "<leader>m",
    "<cmd>lua require('harpoon.mark').add_file()<cr>",
    mode = { "n", "v" },
    noremap = true,
    silent = true,
    desc = "Add file to harpoon",
  },
  {
    "<leader>'",
    "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
    mode = { "n", "v" },
    noremap = true,
    silent = true,
    desc = "Toggle harpoon quick menu",
  },
  {
    "<C-1>",
    "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
    mode = { "n", "v" },
    noremap = true,
    silent = true,
    desc = "Navigate to harpoon file 1",
  },
  {
    "<C-2>",
    "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
    mode = { "n", "v" },
    noremap = true,
    silent = true,
    desc = "Navigate to harpoon file 2",
  },
  {
    "<C-3>",
    "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
    mode = { "n", "v" },
    noremap = true,
    silent = true,
    desc = "Navigate to harpoon file 3",
  },
  {
    "<C-4>",
    "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
    mode = { "n", "v" },
    noremap = true,
    silent = true,
    desc = "Navigate to harpoon file 4",
  },
}

return M
