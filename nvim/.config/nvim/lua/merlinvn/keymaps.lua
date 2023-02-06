local Util = require("merlinvn.util")

-- OPERATIONS

-- remap save
-- vim.keymap.set("n", "<Leader>a", ":up<CR>")
-- vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set({ "i", "v", "n", "s" }, "<C-S-s>", "<cmd>wa<CR><esc>", { silent = true })

-- Alternative way to save and exit in Normal mode.
-- NOTE: Adding `redraw` helps with `cmdheight=0` if buffer is not modified
-- vim.keymap.set({ "n", "v", "s" }, "<C-s>", "<Cmd>silent! update | redraw<CR>", { desc = "Save" })
vim.keymap.set({ "n", "v", "s" }, "<C-s>", "<Cmd>silent! update<CR>", { desc = "Save" })
vim.keymap.set({ "i", "x" }, "<C-s>", "<Esc><Cmd>silent! update<CR>", { desc = "Save and go to Normal mode" })
-- vim.keymap.set("n", "<Leader>x", vim.cmd.Ex)

-- remap quit
-- close current buffer && quit window
vim.keymap.set("n", "Q", ":bd<CR>", { noremap = true, silent = true, desc = "Close current buffer" })
vim.keymap.set("n", "<C-q>", ":q<CR>", { silent = true, desc = "Quit window" })

-- Reload vims configuration file
vim.keymap.set("n", "<Leader>rl", ":w<cr>:luafile %<CR>", { desc = "Save and reload", silent = true })

-- Yank from the current cursor to the end of line
vim.keymap.set("n", "Y", "y$", { desc = "Yank to eol" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>",
  { noremap = true, silent = true, desc = "Escape and clear hlsearch" })

-- vim.keymap.set("i", "jk", "<esc>", { noremap = true, silent = true, desc = "jk to esc" })

-- better indent: indent and stay in visual
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("v", "<Tab>", ">><Esc>gv")
vim.keymap.set("v", "<S-Tab>", "<<<Esc>gv")

vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("n", "<S-Tab>", "<<")

-- better p
-- vim.keymap.set("n", ",p", '"0p')
-- vim.keymap.set("n", ",P", '"0p')
vim.keymap.set("v", "p", '"_dP')

-- paste from clipboard
vim.keymap.set("n", "<C-p>", '"+p')
-- vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("i", "<C-p>", '<esc>"+pa')

vim.keymap.set("x", "<leader>p", [["_dP]])

-- select what just pasted
vim.keymap.set("n", "<leader>V", "`[v`]", { silent = true, desc = "Select what just pasted" })

-- next greatest remap ever : yank to clipboard
-- vim.keymap.set({ "n", "x", "v" }, "<leader>y", [["+y]], { silent = true, noremap = true, desc = "yank to clipboard" })
vim.keymap.set({ "n", "x", "v" }, "<C-y>", [["+y]], { silent = true, noremap = true, desc = "yank to clipboard" })

-- delete to register _ (black hole)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { silent = true, desc = "delete to black hole" })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- replace selected in visual mode, by yank current selection to register h, then
-- <C-r>h to paste in command mode, calling <left> * 3 to go back to proper position
vim.keymap.set("v", "<Leader>s", '"hy:%s/<C-r>h//gc<Left><Left><Left>',
  { noremap = true, desc = "[s]ubtitude selected" })
-- replace current word in normal mode
vim.keymap.set("n", "<Leader>s", ":%s/<C-r><C-w>//gI<Left><Left><Left>",
  { noremap = true, desc = "[s]ubtitude selected" })

-- move line up / down
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { silent = true, desc = "move line down" })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "move line down" })
vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", { silent = true, desc = "move line down" })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { silent = true, desc = "move line up" })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "move line up" })
vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", { silent = true, desc = "move line up" })

-- join and stay in the same line
vim.keymap.set("n", "J", "mzJ`z", { noremap = true, silent = true, desc = "Join line" })
vim.keymap.set("n", "gs", "a<CR><ESC>k$", { noremap = true, silent = true, desc = "Split line" })

-- change word with <c-c>
vim.keymap.set("n", "<C-c>", "<cmd>normal! ciw<cr>a")

-- Add empty lines before and after cursor line without goto insert mode
vim.keymap.set('n', 'gO', "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>",
  { desc = 'Put empty line above' })
vim.keymap.set('n', 'go', "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>",
  { desc = 'Put empty line below' })


-- NAVIGATION
-- windows navigation
vim.keymap.set("n", "gw", ":wincmd w<CR>", { noremap = true, silent = true, desc = "Next win" })
-- vim.keymap.set("n", "<C-Left>", ":wincmd h<CR>", { noremap = true, silent = true, desc = "win left" })
-- vim.keymap.set("n", "<C-Down>", ":wincmd j<CR>", { noremap = true, silent = true, desc = "win down" })
-- vim.keymap.set("n", "<C-Up>", ":wincmd k<CR>", { noremap = true, silent = true, desc = "win up" })
-- vim.keymap.set("n", "<C-Right>", ":wincmd l<CR>", { noremap = true, silent = true, desc = "win right" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "win left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "win down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "win up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "win right" })

vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal-mode" })
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true, desc = "win left" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true, desc = "win down" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true, desc = "win up" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true, desc = "win right" })

-- Resize with arrows
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { noremap = true, silent = true, desc = "- width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { noremap = true, silent = true, desc = "+ width" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<CR>", { noremap = true, silent = true, desc = "- height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<CR>", { noremap = true, silent = true, desc = "+ height" })

-- vim.keymap.set("n", "g<Left>", ":wincmd h<CR>", { silent = true, desc = "win left" })
-- vim.keymap.set("n", "g<Down>", ":wincmd j<CR>", { silent = true, desc = "win down" })
-- vim.keymap.set("n", "g<Up>", ":wincmd k<CR>", { silent = true, desc = "win up" })
-- vim.keymap.set("n", "g<Right>", ":wincmd l<CR>", { silent = true, desc = "win right" })

-- for other windows moving and resizing, refer to hydra
-- split windows
vim.keymap.set("n", "<leader>ww", "<C-W>w", { noremap = true, silent = true, desc = "Other window" })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { noremap = true, silent = true, desc = "Delete window" })
vim.keymap.set("n", "<leader>wx", "<C-W>s", { noremap = true, silent = true, desc = "Split window below" })
vim.keymap.set("n", "<leader>wv", "<C-W>v", { noremap = true, silent = true, desc = "Split window right" })
vim.keymap.set("n", "<leader>-", "<C-W>s", { noremap = true, silent = true, desc = "Split window below" })
vim.keymap.set("n", "<leader>|", "<C-W>v", { noremap = true, silent = true, desc = "Split window right" })

-- buffers navigation
vim.keymap.set("n", "<leader><tab>", "<C-^>", { noremap = true, silent = true, desc = "<-> buffer" })
-- refer to bufferline for buffer navigation, un comment the following if you don't use bufferline
-- vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- vim.keymap.set("n", "<leader>bn", ":bnext<cr>", { noremap = true, silent = true, desc = "Next buffer" })
-- vim.keymap.set("n", "<leader>bp", ":bprev<cr>", { noremap = true, silent = true, desc = "Prev buffer" })
-- vim.keymap.set("n", "gb", ":bnext<cr>", { noremap = true, silent = true, desc = "next buffer" })
-- vim.keymap.set("n", "gB", ":bprev<cr>", { noremap = true, silent = true, desc = "next buffer" })

if Util.has("buffeline") then
  for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, function()
      require("bufferline").go_to_buffer(i, true)
    end, { noremap = true, silent = true, desc = "Go to tab " .. i })
  end

  vim.keymap.set("n", "<leader>0", function()
    require("bufferline").go_to_buffer(-1, true)
  end, { noremap = true, silent = true, desc = "Go to last tab" })
else
  -- tab navigation
  -- refer to bufferline for buffer navigation, un comment the following if you don't use bufferline
  -- Go to tab by number
  vim.keymap.set("n", "<leader>1", "1gt", { silent = true, remap = true })
  vim.keymap.set("n", "<leader>2", "2gt", { silent = true, remap = true })
  vim.keymap.set("n", "<leader>3", "3gt", { silent = true, remap = true })
  vim.keymap.set("n", "<leader>4", "4gt", { silent = true, remap = true })
  vim.keymap.set("n", "<leader>5", "5gt", { silent = true, remap = true })
  vim.keymap.set("n", "<leader>6", "6gt", { silent = true, remap = true })
  vim.keymap.set("n", "<leader>7", "7gt", { silent = true, remap = true })
  vim.keymap.set("n", "<leader>8", "8gt", { silent = true, remap = true })
  vim.keymap.set("n", "<leader>9", "9gt", { silent = true, remap = true })
  vim.keymap.set("n", "<leader>0", ":tablast<cr>", { silent = true, remap = true })
end

-- create new tab
-- vim.keymap.set("n", "<leader><tab><tab>", "<C-w>s<C-w>T")
-- vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- vim.keymap.set("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })


-- Go to next / previous, center with zz, and zv to open fold
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- scroll and stay in center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- good ideas but since I use kmonad I don't need them
-- vim.keymap.set("n", "H", "^")
-- vim.keymap.set("n", "L", "$")
-- vim.keymap.set("n", "J", "}")
-- vim.keymap.set("n", "K", "{")

-- jump list mutation
vim.keymap.set("n", "<expr> k", "(v:count > 5 ? 'm'' . v:count : '') . 'k'")
vim.keymap.set("n", "<expr> j", "(v:count > 5 ? 'm'' . v:count : '') . 'j'")

-- Remap for dealing with word wrap
-- Move by visible lines. Notes:
-- - Don't map in Operator-pending mode because it severely changes behavior:
--   like `dj` on non-wrapped line will not delete it.
-- - Condition on `v:count == 0` to allow easier use of relative line numbers.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vl", "<cmd>Lazy<CR>", { silent = true })

vim.keymap.set("n", "<leader>vm", "<cmd>Mason<CR>", { silent = true })

-- TOGGLE OPTIONS
-- o == option
-- format not working yet

local toggle_prefix = "<leader>o"
if type(toggle_prefix) == 'string' and toggle_prefix ~= '' then
  local map_toggle = function(lhs, rhs, desc)
    vim.keymap.set('n', toggle_prefix .. lhs, rhs, { desc = desc })
  end

  -- NOTE: showing current option value after toggling it is very useful but
  -- might not play nicely with `cmdheight=0` causing `hit-enter-prompt`.
  -- If it is crucial for you, consider doing one of these:
  -- - Copy this code without showing part: `xxx?` for most, similar for others.
  -- - Use `cmdheight=1`.
  -- - Use 'folke/noice.nvim'.
  -- - Help fixing https://github.com/neovim/neovim/issues/20673 .
  map_toggle('b', '<Cmd>lua vim.o.bg = vim.o.bg == "dark" and "light" or "dark"; print(vim.o.bg)<CR>',
    "Toggle 'background'")
  map_toggle('c', '<Cmd>setlocal cursorline! cursorline?<CR>', "Toggle 'cursorline'")
  map_toggle('C', '<Cmd>setlocal cursorcolumn! cursorcolumn?<CR>', "Toggle 'cursorcolumn'")
  map_toggle('d', '<Cmd>lua print(require("merlinvn.util").toggle_diagnostic())<CR>', 'Toggle diagnostic')
  map_toggle('h', '<Cmd>let v:hlsearch = 1 - v:hlsearch | echo (v:hlsearch ? "  " : "no") . "hlsearch"<CR>',
    'Toggle search highlight')
  map_toggle('i', '<Cmd>setlocal ignorecase! ignorecase?<CR>', "Toggle 'ignorecase'")
  map_toggle('l', '<Cmd>setlocal list! list?<CR>', "Toggle 'list'")
  map_toggle('n', '<Cmd>setlocal number! number?<CR>', "Toggle 'number'")
  map_toggle('r', '<Cmd>setlocal relativenumber! relativenumber?<CR>', "Toggle 'relativenumber'")
  map_toggle('s', '<Cmd>setlocal spell! spell?<CR>', "Toggle 'spell'")
  map_toggle('w', '<Cmd>setlocal wrap! wrap?<CR>', "Toggle 'wrap'")
end

-- new file
-- o == open
vim.keymap.set("n", "<leader>oe", "<cmd>enew<cr>", { desc = "New File" })
vim.keymap.set("n", "<leader>ol", "<cmd>lopen<cr>", { desc = "Open Location List" })
vim.keymap.set("n", "<leader>oq", "<cmd>copen<cr>", { desc = "Open Quickfix List" })

-- EDIT HELPERS
-- undo break points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "[", "[<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")

-- auto close brackets
vim.keymap.set("i", "{<cr>", "{<cr>}<c-o>O", { noremap = true })
vim.keymap.set("i", "{}", "{}<Left>", { noremap = true })
vim.keymap.set("i", "()", "()<Left>", { noremap = true })
vim.keymap.set("i", "<>", "<><Left>", { noremap = true })
