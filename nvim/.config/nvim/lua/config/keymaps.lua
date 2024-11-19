-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

function is_last_buffer()
  -- Filter and count only listed buffers
  local bufnrs = vim.tbl_filter(function(b)
    return vim.fn.buflisted(b) == 1
  end, vim.api.nvim_list_bufs())
  return #bufnrs <= 1
end

-- local Terminal = require("Snack.terminal")
local map = vim.keymap.set
-- local opts = { noremap = true, silent = true }

map("n", "<C-q>", function()
  -- if there is no more buffewr, close the window with :q
  if is_last_buffer() then
    vim.cmd("q")
  else
    Snacks.bufdelete()
  end
end, { desc = "Smart close buffer", silent = true })

-- Quit
map("n", "<leader>qw", ":qw<CR>", { desc = "Save & quit", silent = true })
map("n", "<leader>q!", ":q!<CR>", { desc = "Quit all buffer without save", silent = true })
map("n", "<leader>q1", ":q!<CR>", { desc = "Quit all buffer without save", silent = true })
map("n", "<leader>qq", ":qa<CR>", { desc = "Quit buffer without save", silent = true })

-- better p
map("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Clipboard
map({ "i", "c" }, "<C-p>", "<C-R>+", { desc = "Paste from clipboard" })
map({ "n", "v" }, "<C-p>", [["+gP]], { desc = "Paste from clipboard" })
map({ "n", "v" }, "<C-y>", [["+y]], { desc = "Copy to clipboard" })
map({ "v" }, "<C-c>", '"+x', { desc = "Cut to clipboard" })
-- paste text but DONT copy the overridden text
-- map("x", "p", [["_dP]])

-- shortcut for Lazy
map("n", "<leader>vl", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>ve", "<cmd>LazyExtras<cr>", { desc = "LazyExtras" })
map("n", "<leader>vL", "<cmd>Lazy log<cr>", { desc = "LazyLog" })

-- terminal
-- vim.keymap.set("n", "<C-/>", function()
--   Snacks.terminal(nil, { cwd = LazyVim.root() })
-- end, { desc = "Term with border" })
--
-- vim.keymap.set("n", "<C-_>", function()
--   Snacks.terminal(nil, { cwd = LazyVim.root() })
-- end, { desc = "Term with border" })

-- map({ "n", "t" }, "<c-/>", "<cmd>ToggleTerm<cr>") -- open new Tab
