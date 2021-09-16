local map = require("utils").map

map("n", "s", "<cmd>lua require'hop'.hint_char2()<cr>", {})
map("v", "s", "<cmd>lua require'hop'.hint_char2()<cr>", {})
map("o", "s", "<cmd>lua require'hop'.hint_char2()<cr>", {})

map("n", "<leader><leader>w", "<cmd>lua require'hop'.hint_words()<cr>", {})
map("o", "<leader><leader>w", "<cmd>lua require'hop'.hint_words()<cr>", {})

map("n", "<leader><leader>c", "<cmd>lua require'hop'.hint_char1()<cr>", {})
map("o", "<leader><leader>c", "<cmd>lua require'hop'.hint_char1()<cr>", {})

map("n", "<leader><leader>l", "<cmd>lua require'hop'.hint_lines()<cr>", {})
map("o", "<leader><leader>l", "<cmd>lua require'hop'.hint_lines()<cr>", {})

map("n", "<leader><leader>/", "<cmd>lua require'hop'.hint_patterns()<cr>", {})
map("o", "<leader><leader>/", "<cmd>lua require'hop'.hint_patterns()<cr>", {})
