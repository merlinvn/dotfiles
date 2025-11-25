-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- function is_last_buffer()
--   -- Filter and count only listed buffers
--   local bufnrs = vim.tbl_filter(function(b)
--     return vim.fn.buflisted(b) == 1
--   end, vim.api.nvim_list_bufs())
--   return #bufnrs <= 1
-- end

-- local Terminal = require("Snack.terminal")
local map = vim.keymap.set
-- local opts = { noremap = true, silent = true }

-- shortcut for Lazy
map("n", "<leader>vl", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>vx", "<cmd>LazyExtras<cr>", { desc = "LazyExtras" })
map("n", "<leader>vL", "<cmd>Lazy log<cr>", { desc = "LazyLog" })
map("n", "<leader>vm", "<cmd>Mason<cr>", { desc = "Mason" })

-- map("n", "<C-q>", function()
--   -- if there is no more buffewr, close the window with :q
--   if is_last_buffer() then
--     vim.cmd("q")
--   else
--     Snacks.bufdelete()
--   end
-- end, { desc = "Smart close buffer", silent = true })

-- Clipboard
map({ "i", "c" }, "<C-p>", "<C-R>+", { desc = "Paste from clipboard" })
map({ "n", "v" }, "<C-p>", [["+gP]], { desc = "Paste from clipboard" })
map({ "n", "v" }, "<C-y>", [["+y]], { desc = "Copy to clipboard" })
map({ "v" }, "<C-c>", '"+x', { desc = "Cut to clipboard" })

-- better p
map("v", "p", '"_dP', { desc = "Paste without yanking" })
map("n", "c", '"_c')
map("v", "c", '"_c')
