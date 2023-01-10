local mapOptions = { noremap = true, silent = true }

-- Terminal commands
-- ueoa is first through fourth finger left hand home row.
-- This just means I can crush, with opposite hand, the 4 terminal positions
vim.keymap.set("n", "<leader>a", ":lua require('harpoon.mark').add_file() <cr>",
  vim.tbl_extend("force", mapOptions, { desc = "Harpoon mark file" }))
vim.keymap.set("n", "<leader>'", function() require("harpoon.ui").toggle_quick_menu() end,
  { silent = true, desc = "Harpoon jump list" })

vim.keymap.set("n", "<C-1>", function() require("harpoon.ui").nav_file(1) end, mapOptions)
vim.keymap.set("n", "<C-2>", function() require("harpoon.ui").nav_file(2) end, mapOptions)
vim.keymap.set("n", "<C-3>", function() require("harpoon.ui").nav_file(3) end, mapOptions)
vim.keymap.set("n", "<C-4>", function() require("harpoon.ui").nav_file(4) end, mapOptions)
