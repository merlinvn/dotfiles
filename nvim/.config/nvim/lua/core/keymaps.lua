-- TODO: kemap for Location list and Quickfix list
local map = require("helpers.keys").map
local noremap = require("helpers.keys").noremap

-- remap save
map({ "i", "v", "n", "s" }, "<C-S-s>", "<cmd>wa<CR><esc>")

-- Alternative way to save and exit in Normal mode.
-- NOTE: Adding `redraw` helps with `cmdheight=0` if buffer is not modified
-- map({ "n", "v", "s" }, "<C-s>", "<Cmd>silent! update | redraw<CR>", "Save")
map({ "n", "v", "s" }, "<C-s>", "<Cmd>silent! update<CR>", "Save")

map(
  { "i", "x" },
  "<C-s>",
  "<Esc><Cmd>silent! update<CR>",
  "Save and go to Normal mode"
)

-- remap quit
map("n", "<C-q>", ":q<CR>", "Close window")
-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", "Quit all")
-- map("n", "Q", ":q<CR>", "Close window")

map("n", "<leader>fn", "<cmd>enew<cr>", "Create new file")

map("n", "<Leader>vr", ":w<cr>:luafile %<CR>", "Reload current lua file")

-- Yank from the current cursor to the end of line
map("n", "Y", "y$", "Yank to eol")

-- Clear search with <esc>
noremap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", "Escape and clear hlsearch")

-- search word under cursor
noremap({ "n", "x" }, "gw", "*N", "Search word under cursor")

-- noremap("i", "jk", "<esc>", "jk to esc" , )

-- better indent: indent and stay in visual
map("v", ">", ">gv")
map("v", "<", "<gv")

map("v", "<Tab>", ">><Esc>gv")
map("v", "<S-Tab>", "<<<Esc>gv")

map("n", "<Tab>", ">>")
map("n", "<S-Tab>", "<<")

-- better p
map("v", "p", '"_dP')

-- paste from clipboard
map({ "n", "v" }, "<C-p>", '"+p')
map("i", "<C-p>", '<esc>"+pa')

-- map("x", "<leader>p", [["_dP]])

-- select what just pasted
map("n", "<leader>V", "`[v`]", "Select what just pasted")

-- next greatest remap ever : yank to clipboard
noremap({ "n", "x", "v" }, "<C-y>", [["+y]], "yank to clipboard")

-- delete to register _ (black hole)
map({ "n", "v" }, "<leader>dd", [["_d]], "delete to black hole")

-- This is going to get me cancelled
map("i", "<C-c>", "<Esc>")

-- move line up / down is subtituted by mini.move <M-j> and <M-k>
-- map("n", "<S-Down>", ":m .+1<CR>==", "move line down")
-- map("n", "<S-Up>", ":m .-2<CR>==", "move line up")
-- map("i", "<S-Down>", "<Esc>:m .+1<CR>==gi", "move line down")
-- map("i", "<S-Up>", "<Esc>:m .-2<CR>==gi", "move line up")
-- map("v", "<S-Down>", ":m '>+1<CR>gv=gv", "move line down")
-- map("v", "<S-Up>", ":m '<-2<CR>gv=gv", "move line up")

-- join and stay in the same line
-- noremap("n", "gj", "mzJ`z", "Join line")
-- noremap("n", "gs", "a<CR><ESC>k$", "Split line")

-- change word with <c-c>
map("n", "<C-c>", "<cmd>normal! ciw<cr>a")

-- Add empty lines before and after cursor line without goto insert mode
map(
  "n",
  "gO",
  "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>",
  "Put empty line above"
)
map(
  "n",
  "go",
  "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>",
  "Put empty line below"
)

-- NAVIGATION
-- windows navigation
-- for other windows moving and resizing, refer to smart-plit

noremap("t", "<esc>", "<C-\\><C-n>", "Exit terminal-mode")
noremap("t", "<C-h>", "<C-\\><C-n><C-w>h", "win left")
noremap("t", "<C-j>", "<C-\\><C-n><C-w>h", "win down")
noremap("t", "<C-k>", "<C-\\><C-n><C-w>h", "win up")
noremap("t", "<C-l>", "<C-\\><C-n><C-w>h", "win right")

-- split windows
noremap("n", "<leader>ww", "<C-W>w", "Other window")
noremap("n", "<leader>wd", "<C-W>c", "Delete window")
noremap("n", "<leader>wx", "<C-W>s", "Split window below")
noremap("n", "<leader>wv", "<C-W>v", "Split window right")
noremap("n", "<leader>-", "<C-W>s", "Split window below")
noremap("n", "<leader>|", "<C-W>v", "Split window right")

-- buffers navigation
noremap("n", "<leader>bb", "<cmd>e #<cr>", "<-> buffer")
noremap("n", "<leader>`", "<cmd>e #<cr>", "<-> buffer")

-- tab navigation
-- refer to bufferline for buffer navigation,
-- comment the following if you use buffer mode in bufferline
-- Go to tab by number
map("n", "<leader>1", "1gt", "Go to tab 1", { remap = true })
map("n", "<leader>2", "2gt", "Go to tab 2", { remap = true })
map("n", "<leader>3", "3gt", "Go to tab 3", { remap = true })
map("n", "<leader>4", "4gt", "Go to tab 4", { remap = true })
map("n", "<leader>5", "5gt", "Go to tab 5", { remap = true })
map("n", "<leader>6", "6gt", "Go to tab 6", { remap = true })
map("n", "<leader>7", "7gt", "Go to tab 7", { remap = true })
map("n", "<leader>8", "8gt", "Go to tab 8", { remap = true })
map("n", "<leader>9", "9gt", "Go to tab 9", { remap = true })
map("n", "<leader>0", ":tablast<cr>", "Go to last tab", { remap = true })

map(
  "n",
  "<leader><tab>",
  ':execute "tabn " .. g:lasttab<CR>',
  "<-> tab",
  { remap = true }
)

-- Go to next / previous, center with zz, and zv to open fold
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- scroll and stay in center
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<PageUp>", "<PageUp>zz")
map("n", "<PageDown>", "<PageDown>zz")

-- move to the end of the line in insert mode
map("i", "<C-a>", "<End>")

-- good ideas but since I use kmonad I don't need them
-- map("n", "H", "^")
-- map("n", "L", "$")
-- map("n", "J", "}")
-- map("n", "K", "{")

-- jump list mutation
map("n", "<expr> k", "(v:count > 5 ? 'm'' . v:count : '') . 'k'")
map("n", "<expr> j", "(v:count > 5 ? 'm'' . v:count : '') . 'j'")

-- Remap for dealing with word wrap
-- Move by visible lines. Notes:
-- - Don't map in Operator-pending mode because it severely changes behavior:
--   like `dj` on non-wrapped line will not delete it.
-- - Condition on `v:count == 0` to allow easier use of relative line numbers.
map("n", "k", "v:count == 0 ? 'gk' : 'k'", "", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", "", { expr = true })

-- map("n", "<leader>x", "<cmd>!chmod +x %<CR>", )
-- new file
-- o == open

-- EDIT HELPERS
-- undo break points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "[", "[<c-g>u")
map("i", "?", "?<c-g>u")

-- remap _ naturally pair with -
map("n", "_", "(v:count == 0 ? 'j' : 'j').'^'", "", { expr = true })