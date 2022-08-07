local nnoremap = require("merlinvn.keymap").nnoremap
local vnoremap = require("merlinvn.keymap").vnoremap
local onoremap = require("merlinvn.keymap").onoremap

nnoremap("f", "<cmd>lua require'hop'.hint_char1({ multi_windows = true })<cr>")
vnoremap("f", "<cmd>lua require'hop'.hint_char1({ multi_windows = true })<cr>")
onoremap("f", "<cmd>lua require'hop'.hint_char1({ multi_windows = true })<cr>")

nnoremap("t", "<nop>")

nnoremap("tw", "<cmd>lua require'hop'.hint_words({ multi_windows = true })<cr>")
vnoremap("tw", "<cmd>lua require'hop'.hint_words({ multi_windows = true })<cr>")
onoremap("tw", "<cmd>lua require'hop'.hint_words({ multi_windows = true })<cr>")

nnoremap("tc", "<cmd>lua require'hop'.hint_char1({ multi_windows = true })<cr>")
vnoremap("tc", "<cmd>lua require'hop'.hint_char1({ multi_windows = true })<cr>")
onoremap("tc", "<cmd>lua require'hop'.hint_char1({ multi_windows = true })<cr>")

nnoremap("ts", "<cmd>lua require'hop'.hint_char2({ multi_windows = true })<cr>")
vnoremap("ts", "<cmd>lua require'hop'.hint_char2({ multi_windows = true })<cr>")
onoremap("ts", "<cmd>lua require'hop'.hint_char2({ multi_windows = true })<cr>")

nnoremap("tl", "<cmd>lua require'hop'.hint_lines({ multi_windows = true })<cr>")
vnoremap("tl", "<cmd>lua require'hop'.hint_lines({ multi_windows = true })<cr>")
onoremap("tl", "<cmd>lua require'hop'.hint_lines({ multi_windows = true })<cr>")

nnoremap("t/", "<cmd>lua require'hop'.hint_patterns({ multi_windows = true })<cr>")
vnoremap("t/", "<cmd>lua require'hop'.hint_patterns({ multi_windows = true })<cr>")
onoremap("t/", "<cmd>lua require'hop'.hint_patterns({ multi_windows = true })<cr>")
