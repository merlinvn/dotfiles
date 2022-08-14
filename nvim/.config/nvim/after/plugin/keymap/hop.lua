local nnoremap = require("merlinvn.keymap").nnoremap
local vnoremap = require("merlinvn.keymap").vnoremap
local onoremap = require("merlinvn.keymap").onoremap

nnoremap("s", "<cmd>lua require'hop'.hint_char2({ multi_windows = true })<cr>")
vnoremap("s", "<cmd>lua require'hop'.hint_char2({ multi_windows = true })<cr>")
onoremap("z", "<cmd>lua require'hop'.hint_char2({ })<cr>")

onoremap("l", "<cmd>lua require'hop'.hint_lines({ })<cr>")

-- vim.api.nvim_set_keymap('', 'f',
--   "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
--   , {})
-- vim.api.nvim_set_keymap('', 'F',
--   "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
--   , {})
-- vim.api.nvim_set_keymap('', 't',
--   "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>"
--   , {})
-- vim.api.nvim_set_keymap('', 'T',
--   "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>"
--   , {})
--
-- nnoremap("t", "<nop>")
--
-- nnoremap("tw", "<cmd>lua require'hop'.hint_words({ multi_windows = true })<cr>")
-- vnoremap("tw", "<cmd>lua require'hop'.hint_words({ multi_windows = true })<cr>")
-- onoremap("tw", "<cmd>lua require'hop'.hint_words({ multi_windows = true })<cr>")
--
-- nnoremap("tc", "<cmd>lua require'hop'.hint_char1({ multi_windows = true })<cr>")
-- vnoremap("tc", "<cmd>lua require'hop'.hint_char1({ multi_windows = true })<cr>")
-- onoremap("tc", "<cmd>lua require'hop'.hint_char1({ multi_windows = true })<cr>")
--
-- nnoremap("ts", "<cmd>lua require'hop'.hint_char2({ multi_windows = true })<cr>")
-- vnoremap("ts", "<cmd>lua require'hop'.hint_char2({ multi_windows = true })<cr>")
-- onoremap("ts", "<cmd>lua require'hop'.hint_char2({ multi_windows = true })<cr>")
--
-- nnoremap("tl", "<cmd>lua require'hop'.hint_lines({ multi_windows = true })<cr>")
-- vnoremap("tl", "<cmd>lua require'hop'.hint_lines({ multi_windows = true })<cr>")
-- onoremap("tl", "<cmd>lua require'hop'.hint_lines({ multi_windows = true })<cr>")
--
-- nnoremap("t/", "<cmd>lua require'hop'.hint_patterns({ multi_windows = true })<cr>")
-- vnoremap("t/", "<cmd>lua require'hop'.hint_patterns({ multi_windows = true })<cr>")
-- onoremap("t/", "<cmd>lua require'hop'.hint_patterns({ multi_windows = true })<cr>")
