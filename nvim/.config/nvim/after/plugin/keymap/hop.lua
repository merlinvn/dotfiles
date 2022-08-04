local nnoremap = require("merlinvn.keymap").nnoremap
local vnoremap = require("merlinvn.keymap").vnoremap
local onoremap = require("merlinvn.keymap").onoremap

nnoremap(",", "<cmd>lua require'hop'.hint_char1({ multi_windows = true })<cr>")
vnoremap(",", "<cmd>lua require'hop'.hint_char1({ multi_windows = true })<cr>")
onoremap(",", "<cmd>lua requie'hop'.hint_char1({ multi_windows = true })<cr>")

nnoremap("sw", "<cmd>lua require'hop'.hint_words({ multi_windows = true })<cr>")
vnoremap("sw", "<cmd>lua require'hop'.hint_words({ multi_windows = true })<cr>")
onoremap("sw", "<cmd>lua require'hop'.hint_words({ multi_windows = true })<cr>")

nnoremap("sc", "<cmd>lua require'hop'.hint_char1({ multi_windows = true })<cr>")
vnoremap("sc", "<cmd>lua require'hop'.hint_char1({ multi_windows = true })<cr>")
onoremap("sc", "<cmd>lua require'hop'.hint_char1({ multi_windows = true })<cr>")

nnoremap("ss", "<cmd>lua require'hop'.hint_char2({ multi_windows = true })<cr>")
vnoremap("ss", "<cmd>lua require'hop'.hint_char2({ multi_windows = true })<cr>")
onoremap("ss", "<cmd>lua require'hop'.hint_char2({ multi_windows = true })<cr>")

nnoremap("sl", "<cmd>lua require'hop'.hint_lines({ multi_windows = true })<cr>")
vnoremap("sl", "<cmd>lua require'hop'.hint_lines({ multi_windows = true })<cr>")
onoremap("sl", "<cmd>lua require'hop'.hint_lines({ multi_windows = true })<cr>")

nnoremap("s/", "<cmd>lua require'hop'.hint_patterns({ multi_windows = true })<cr>")
vnoremap("s/", "<cmd>lua require'hop'.hint_patterns({ multi_windows = true })<cr>")
onoremap("s/", "<cmd>lua require'hop'.hint_patterns({ multi_windows = true })<cr>")
