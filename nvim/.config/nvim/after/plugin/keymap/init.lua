local Util = require("merlinvn.util")

-- remap save
-- vim.keymap.set("n", "<Leader>a", ":up<CR>")
vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })
vim.keymap.set("n", "<C-S>", ":wa<CR>", { silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { silent = true })

-- vim.keymap.set("n", "<Leader>x", vim.cmd.Ex)

-- remap quit
-- vim.keymap.set("n", "<Leader>q", ":bd<CR>", { silent = true, desc = "Close current buffer" })
vim.keymap.set("n", "<C-q>", ":q<CR>", { silent = true, desc = "Quit window" })

-- Reload vims configuration file
vim.keymap.set("n", "<Leader>rl", ":w<cr>:luafile %<CR>", { desc = "Save and reload", silent = true })

-- Yank from the current cursor to the end of line
vim.keymap.set("n", "Y", "y$", { desc = "Yank to eol" })


-- undo break points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "[", "[<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")

-- windows navigation
vim.keymap.set("n", "gh", ":wincmd h<CR>", { noremap = true, silent = true, desc = "win left" })
vim.keymap.set("n", "gj", ":wincmd j<CR>", { noremap = true, silent = true, desc = "win down" })
vim.keymap.set("n", "gk", ":wincmd k<CR>", { noremap = true, silent = true, desc = "win up" })
vim.keymap.set("n", "gl", ":wincmd l<CR>", { noremap = true, silent = true, desc = "win right" })

vim.keymap.set("n", "g<Left>", ":wincmd h<CR>", { silent = true, desc = "win left" })
vim.keymap.set("n", "g<Down>", ":wincmd j<CR>", { silent = true, desc = "win down" })
vim.keymap.set("n", "g<Up>", ":wincmd k<CR>", { silent = true, desc = "win up" })
vim.keymap.set("n", "g<Right>", ":wincmd l<CR>", { silent = true, desc = "win right" })

-- for other windows moving and resizing, refer to hydra
-- split windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { noremap = true, silent = true, desc = "Other window" })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { noremap = true, silent = true, desc = "Delete window" })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { noremap = true, silent = true, desc = "Split window below" })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { noremap = true, silent = true, desc = "Split window right" })
vim.keymap.set("n", "<leader>-", "<C-W>s", { noremap = true, silent = true, desc = "Split window below" })
vim.keymap.set("n", "<leader>|", "<C-W>v", { noremap = true, silent = true, desc = "Split window right" })


-- buffers navigation
vim.keymap.set("n", "<leader>bn", ":bnext<cr>", { noremap = true, silent = true, desc = "next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprev<cr>", { noremap = true, silent = true, desc = "prev buffer" })


if require("merlinvn.util").has("nvim-bufferline.lua") then
  vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true, desc = "Prev buffer" })
  vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "Next buffer" })
  vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true, desc = "Prev buffer" })
  vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "Next buffer" })
  -- vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "next buffer" })
  -- vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true, desc = "prev buffer" })
else
  vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end

-- vim.keymap.set("n", "gb", ":bnext<cr>", { noremap = true, silent = true, desc = "next buffer" })
-- vim.keymap.set("n", "gB", ":bprev<cr>", { noremap = true, silent = true, desc = "next buffer" })

-- tab navigation
-- Go to tab by number
-- vim.keymap.set("n", "<leader>1", "1gt", { silent = true, remap = true })
-- vim.keymap.set("n", "<leader>2", "2gt", { silent = true, remap = true })
-- vim.keymap.set("n", "<leader>3", "3gt", { silent = true, remap = true })
-- vim.keymap.set("n", "<leader>4", "4gt", { silent = true, remap = true })
-- vim.keymap.set("n", "<leader>5", "5gt", { silent = true, remap = true })
-- vim.keymap.set("n", "<leader>6", "6gt", { silent = true, remap = true })
-- vim.keymap.set("n", "<leader>7", "7gt", { silent = true, remap = true })
-- vim.keymap.set("n", "<leader>8", "8gt", { silent = true, remap = true })
-- vim.keymap.set("n", "<leader>9", "9gt", { silent = true, remap = true })
-- vim.keymap.set("n", "<leader>0", ":tablast<cr>", { silent = true, remap = true })

-- create new tab
-- vim.keymap.set("n", "<leader><tab><tab>", "<C-w>s<C-w>T")
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- move line up / down
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { silent = true, desc = "move line down" })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "move line down" })
vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", { silent = true, desc = "move line down" })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { silent = true, desc = "move line up" })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "move line up" })
vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", { silent = true, desc = "move line up" })

-- Go to next / previous, center with zz, and zv to open fold
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- scroll and stay in center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- join and stay in the same line
vim.keymap.set("n", "J", "mzJ`z")
-- jump list mutation
vim.keymap.set("n", "<expr> k", "(v:count > 5 ? 'm'' . v:count : '') . 'k'")
vim.keymap.set("n", "<expr> j", "(v:count > 5 ? 'm'' . v:count : '') . 'j'")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- indent and stay in visual
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- better p
-- vim.keymap.set("n", ",p", '"0p')
-- vim.keymap.set("n", ",P", '"0p')
vim.keymap.set("v", "p", '"_dP')

-- paste from clipboard
vim.keymap.set("n", "<C-p>", '"+p')
vim.keymap.set("i", "<C-p>", '<esc>"+pa')

vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { silent = true, noremap = true, desc = "yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<C-y>", [["+y]], { silent = true, noremap = true, desc = "yank to clipboard" })

-- delete to register _ (black hole)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { silent = true, desc = "delete to black hole" })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- vim.keymap.set("n",  "<C-f>", '"*P' )

-- replace selected in visual mode, by yank current selection to register h, then
-- <C-r>h to paste in command mode, calling <left> * 3 to go back to proper position
vim.keymap.set("v", "<Leader>s", '"hy:%s/<C-r>h//gc<Left><Left><Left>',
  { noremap = true, desc = "[s]ubtitude selected" })
vim.keymap.set("n", "<Leader>s", ":%s/<C-r><C-w>//gI<Left><Left><Left>",
  { noremap = true, desc = "[s]ubtitude selected" })

-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- if vim.fn.has('win32') then
--   vim.keymap.set({ "n", "i", "v", "o" }, "<C-z>", "<nop>")
--   vim.keymap.set({ "n", "i", "v", "o" }, "<C-z>", "<nop>", { remap = true })
-- end

if Util.has("lazy.nvim") then
  vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { silent = true })
end

if Util.has("mason.nvim") then
  vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { silent = true })
end

-- floating terminal
-- o == open
vim.keymap.set("n", "<leader>ot", function() Util.float_term(nil, { cwd = Util.get_root() }) end,
  { desc = "Terminal (root dir)" })
vim.keymap.set("n", "<leader>oT", function() Util.float_term() end, { desc = "Terminal (cwd)" })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- toggle options
-- o == option
-- format not working yet
vim.keymap.set("n", "<leader>of", require("merlinvn.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
vim.keymap.set("n", "<leader>os", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
vim.keymap.set("n", "<leader>ow", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
vim.keymap.set("n", "<leader>ol", function() Util.toggle("relativenumber", true) Util.toggle("number") end,
  { desc = "Toggle Line Numbers" })
vim.keymap.set("n", "<leader>od", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
vim.keymap.set("n", "<leader>oc", function() Util.toggle("conceallevel", false, { 0, conceallevel }) end,
  { desc = "Toggle Conceal" })
