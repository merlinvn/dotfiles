local nnoremap = require("merlinvn.keymap").nnoremap
local vnoremap = require("merlinvn.keymap").vnoremap
local onoremap = require("merlinvn.keymap").onoremap

nnoremap("s", "<cmd>lua require'hop'.hint_char2()<cr>")
vnoremap("s", "<cmd>lua require'hop'.hint_char2()<cr>")
onoremap("s", "<cmd>lua require'hop'.hint_char2()<cr>")

nnoremap("<leader>sw", "<cmd>lua require'hop'.hint_words()<cr>")
vnoremap("<leader>sw", "<cmd>lua require'hop'.hint_words()<cr>")
onoremap("<leader>sw", "<cmd>lua require'hop'.hint_words()<cr>")

nnoremap("<leader>sc", "<cmd>lua require'hop'.hint_char1()<cr>")
vnoremap("<leader>sc", "<cmd>lua require'hop'.hint_char1()<cr>")
onoremap("<leader>sc", "<cmd>lua require'hop'.hint_char1()<cr>")

nnoremap("<leader>ss", "<cmd>lua require'hop'.hint_char2()<cr>")
vnoremap("<leader>ss", "<cmd>lua require'hop'.hint_char2()<cr>")
onoremap("<leader>ss", "<cmd>lua require'hop'.hint_char2()<cr>")

nnoremap("<leader>sl", "<cmd>lua require'hop'.hint_lines()<cr>")
vnoremap("<leader>sl", "<cmd>lua require'hop'.hint_lines()<cr>")
onoremap("<leader>sl", "<cmd>lua require'hop'.hint_lines()<cr>")

nnoremap("<leader>s/", "<cmd>lua require'hop'.hint_patterns()<cr>")
vnoremap("<leader>s/", "<cmd>lua require'hop'.hint_patterns()<cr>")
onoremap("<leader>s/", "<cmd>lua require'hop'.hint_patterns()<cr>")
