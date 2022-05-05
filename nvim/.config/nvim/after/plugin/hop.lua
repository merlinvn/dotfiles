local nmap = require("merlinvn.keymaps").nmap
local vmap = require("merlinvn.keymaps").vmap
local omap = require("merlinvn.keymaps").omap

nmap { "s", "<cmd>lua require'hop'.hint_char2()<cr>" }
vmap { "s", "<cmd>lua require'hop'.hint_char2()<cr>" }
omap { "s", "<cmd>lua require'hop'.hint_char2()<cr>" }

nmap { "<leader><leader>w", "<cmd>lua require'hop'.hint_words()<cr>" }
vmap { "<leader><leader>w", "<cmd>lua require'hop'.hint_words()<cr>" }
omap { "<leader><leader>w", "<cmd>lua require'hop'.hint_words()<cr>" }

nmap { "<leader><leader>c", "<cmd>lua require'hop'.hint_char1()<cr>" }
vmap { "<leader><leader>c", "<cmd>lua require'hop'.hint_char1()<cr>" }
omap { "<leader><leader>c", "<cmd>lua require'hop'.hint_char1()<cr>" }

nmap { "<leader><leader>s", "<cmd>lua require'hop'.hint_char2()<cr>" }
vmap { "<leader><leader>s", "<cmd>lua require'hop'.hint_char2()<cr>" }
omap { "<leader><leader>s", "<cmd>lua require'hop'.hint_char2()<cr>" }

nmap { "<leader><leader>l", "<cmd>lua require'hop'.hint_lines()<cr>" }
vmap { "<leader><leader>l", "<cmd>lua require'hop'.hint_lines()<cr>" }
omap { "<leader><leader>l", "<cmd>lua require'hop'.hint_lines()<cr>" }

nmap { "<leader><leader>/", "<cmd>lua require'hop'.hint_patterns()<cr>" }
vmap { "<leader><leader>/", "<cmd>lua require'hop'.hint_patterns()<cr>" }
omap { "<leader><leader>/", "<cmd>lua require'hop'.hint_patterns()<cr>" }
