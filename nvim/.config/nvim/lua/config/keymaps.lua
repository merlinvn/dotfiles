-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = vim.keymap.set
-- local opts = { noremap = true, silent = true }

-- delete some default keymaps in LazyVim
-- vim.keymap.del("n", "<leader><tab>]")
-- vim.keymap.del("n", "<leader><tab>[")
-- vim.keymap.del("n", "<leader><tab>l")
-- vim.keymap.del("n", "<leader><tab>f")
-- vim.keymap.del("n", "<leader><tab><tab>")
-- vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader>L")
--
-- bring back C-L to clear screen in terminal
vim.keymap.del({ "t" }, "<c-l>")

-- cleare terminal keymaps
vim.keymap.del({ "n" }, "<leader>ft")
vim.keymap.del({ "n" }, "<leader>fT")

map("n", "<C-q>", ":q<CR>", { desc = "Close window", silent = true })

-- Quit
map("n", "<leader>qw", ":qw<CR>", { desc = "Save & quit", silent = true })
map("n", "<leader>q!", ":q!<CR>", { desc = "Quit all buffer without save", silent = true })
map("n", "<leader>q1", ":q!<CR>", { desc = "Quit all buffer without save", silent = true })
map("n", "<leader>qq", ":qa<CR>", { desc = "Quit buffer without save", silent = true })

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
-- map("n", "]<tab>", ":tabnext<cr>", { desc = "Go to next tab", noremap = true, silent = true })
-- map("n", "[<tab>", ":tabprev<cr>", { desc = "Go to previous tab", noremap = true, silent = true })

-- better p
map("v", "p", '"_dP')

-- Clipboard
map({ "i", "c" }, "<C-p>", "<C-R>+", { desc = "Paste from clipboard" })
map({ "n", "v" }, "<C-p>", [["+gP]], { desc = "Paste from clipboard" })
map({ "n", "v" }, "<C-y>", [["+y]], { desc = "Copy to clipboard" })
map({ "v" }, "<C-c>", '"+x', { desc = "Cut to clipboard" })
-- paste text but DONT copy the overridden text
map("x", "p", [["_dP]])
--

-- shortcut for Lazy
map("n", "<leader>vl", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>ve", "<cmd>LazyExtras<cr>", { desc = "LazyExtras" })
map("n", "<leader>vL", "<cmd>Lazy log<cr>", { desc = "LazyLog" })

-- terminal
vim.keymap.set("n", "<C-/>", function()
  Util.terminal(nil, { border = "double" })
end, { desc = "Term with border" })

vim.keymap.set("n", "<C-_>", function()
  Util.terminal(nil, { border = "double" })
end, { desc = "Term with border" })

-- map({ "n", "t" }, "<c-/>", "<cmd>ToggleTerm<cr>") -- open new Tab
