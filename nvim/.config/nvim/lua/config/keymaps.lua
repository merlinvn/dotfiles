-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<C-q>", ":q<CR>", { desc = "Close window", noremap = true, silent = true })

-- Tab for indent
map("v", "<Tab>", ">><Esc>gv")
map("v", "<S-Tab>", "<<<Esc>gv")

map("n", "<Tab>", ">>")
map("n", "<S-Tab>", "<<")

-- formatting
map({ "n", "v" }, "<leader>ff", function()
  Util.format({ force = true })
end, { desc = "File Format" })

-- tab navigations
map("n", "<leader>1", "1gt", { desc = "Go to tab 1", noremap = true, silent = true })
map("n", "<leader>2", "2gt", { desc = "Go to tab 2", noremap = true, silent = true })
map("n", "<leader>3", "3gt", { desc = "Go to tab 3", noremap = true, silent = true })
map("n", "<leader>4", "4gt", { desc = "Go to tab 4", noremap = true, silent = true })
map("n", "<leader>5", "5gt", { desc = "Go to tab 5", noremap = true, silent = true })
map("n", "<leader>6", "6gt", { desc = "Go to tab 6", noremap = true, silent = true })
map("n", "<leader>7", "7gt", { desc = "Go to tab 7", noremap = true, silent = true })
map("n", "<leader>8", "8gt", { desc = "Go to tab 8", noremap = true, silent = true })
map("n", "<leader>9", "9gt", { desc = "Go to tab 9", noremap = true, silent = true })
map("n", "<leader>0", ":tablast<cr>", { desc = "Go to last tab", noremap = true, silent = true })

-- consider if it is necessary or not
map("n", "]<tab>", ":tabnext<cr>", { desc = "Go to next tab", noremap = true, silent = true })
map("n", "[<tab>", ":tabprev<cr>", { desc = "Go to previous tab", noremap = true, silent = true })

vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>[")
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>d")

-- map("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- map("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
-- map("n", "<leader>tl", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- map("n", "<leader>tf", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- map("n", "<leader>tt", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- map("n", "<leader>td", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- terminal
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root(), border = "double" })
end
vim.keymap.del({ "n", "t" }, "<c-/>")
map("n", "<c-t>", lazyterm, { desc = "Terminal (root dir)" })
map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
