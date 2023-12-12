-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<C-q>", ":close<CR>", { desc = "Close window", noremap = true, silent = true })

-- Quit
map("n", "<leader>qw", ":qw<CR>", { desc = "Save & quit" })
map("n", "<leader>wq", ":qw<CR>", { desc = "Save & quit" })
map("n", "<leader>q!", ":q!<CR>", { desc = "Quit all buffer without save" })
map("n", "<leader>q1", ":q!<CR>", { desc = "Quit all buffer without save" })
map("n", "<leader>qq", ":qa<CR>", { desc = "Quit buffer without save" })
map("n", "<M-q>", ":q<CR>", { desc = "Quit buffer without save" })

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

-- switch back and forth between buffers
map("n", "<leader>a", ":b#<CR>", { desc = "Switch buffer", silent = true, noremap = true }) --  switch last buffer

-- consider if it is necessary or not
map("n", "]<tab>", ":tabnext<cr>", { desc = "Go to next tab", noremap = true, silent = true })
map("n", "[<tab>", ":tabprev<cr>", { desc = "Go to previous tab", noremap = true, silent = true })

vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>[")
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>d")

map("n", "<leader>tn", ":tabnew<CR>") -- open new Tab
map("n", "<leader>tx", ":tabclose<CR>") -- close current tab

-- map("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- map("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
-- map("n", "<leader>tl", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- map("n", "<leader>tf", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- map("n", "<leader>tt", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- map("n", "<leader>td", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- terminal
-- vim.keymap.del({ "n", "t" }, "<c-/>")
vim.keymap.del({ "n" }, "<leader>ft")
vim.keymap.del({ "n" }, "<leader>fT")

-- better p
map("v", "p", '"_dP')

-- Clipboard
map({ "i", "c" }, "<C-p>", "<C-R>+", { desc = "Paste from clipboard" })
map({ "n", "v" }, "<C-p>", [["+gP]], { desc = "Paste from clipboard" })
map({ "n", "v" }, "<C-y>", [["+y]], { desc = "Copy to clipboard" })
map({ "v" }, "<C-c>", '"+x', { desc = "Cut to clipboard" })
-- paste text but DONT copy the overridden text
map("x", "p", [["_dP]])
map({ "n", "v" }, "<leader>dd", [["_d]], { desc = "delete to black hole", noremap = true })

-- next greatest remap ever : yank to clipboard
