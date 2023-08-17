-- colemak remap
-- vim.keymap.set({ "n", "x", "o" }, "j", "h", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "x", "o" }, "h", "i", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "x", "o" }, "k", "j", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "x", "o" }, "i", "k", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "x", "o" }, "l", "l", { noremap = true, silent = true })

-- OPERATIONS

-- remap save
-- vim.keymap.set("n", "<Leader>a", ":up<CR>")
-- vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set(
  { "i", "v", "n", "s" },
  "<C-S-s>",
  "<cmd>wa<CR><esc>",
  { silent = true }
)

-- Alternative way to save and exit in Normal mode.
-- NOTE: Adding `redraw` helps with `cmdheight=0` if buffer is not modified
-- vim.keymap.set({ "n", "v", "s" }, "<C-s>", "<Cmd>silent! update | redraw<CR>", { desc = "Save" })

vim.keymap.set(
  { "n", "v", "s" },
  "<C-s>",
  "<Cmd>silent! update<CR>",
  { desc = "Save" }
)

vim.keymap.set(
  { "i", "x" },
  "<C-s>",
  "<Esc><Cmd>silent! update<CR>",
  { desc = "Save and go to Normal mode" }
)

-- remap quit
vim.keymap.set("n", "<C-q>", ":q<CR>", { silent = true, desc = "Close window" })
-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
-- vim.keymap.set("n", "Q", ":q<CR>", { silent = true, desc = "Close window" })

vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "Create new file" })

vim.keymap.set(
  "n",
  "<Leader>vr",
  ":w<cr>:luafile %<CR>",
  { desc = "Reload current lua file", silent = true }
)

-- Yank from the current cursor to the end of line
vim.keymap.set("n", "Y", "y$", { desc = "Yank to eol" })

-- Clear search with <esc>
vim.keymap.set(
  { "i", "n" },
  "<esc>",
  "<cmd>noh<cr><esc>",
  { noremap = true, silent = true, desc = "Escape and clear hlsearch" }
)

-- search word under cursor
vim.keymap.set(
  { "n", "x" },
  "gw",
  "*N",
  { noremap = true, silent = true, desc = "Search word under cursor" }
)

-- vim.keymap.set("i", "jk", "<esc>", { noremap = true, silent = true, desc = "jk to esc" })

-- better indent: indent and stay in visual
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("v", "<Tab>", ">><Esc>gv")
vim.keymap.set("v", "<S-Tab>", "<<<Esc>gv")

vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("n", "<S-Tab>", "<<")

-- better p
vim.keymap.set("v", "p", '"_dP')

-- paste from clipboard
vim.keymap.set({ "n", "v" }, "<C-p>", '"+p')
vim.keymap.set("i", "<C-p>", '<esc>"+pa')

-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- select what just pasted
vim.keymap.set(
  "n",
  "<leader>V",
  "`[v`]",
  { silent = true, desc = "Select what just pasted" }
)

-- next greatest remap ever : yank to clipboard
vim.keymap.set(
  { "n", "x", "v" },
  "<C-y>",
  [["+y]],
  { silent = true, noremap = true, desc = "yank to clipboard" }
)

-- delete to register _ (black hole)
vim.keymap.set(
  { "n", "v" },
  "<leader>dd",
  [["_d]],
  { silent = true, desc = "delete to black hole" }
)

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- replace selected in visual mode, by yank current selection to register h, then
-- <C-r>h to paste in command mode, calling <left> * 3 to go back to proper position
-- vim.keymap.set(
--   "v",
--   "<Leader>s",
--   '"hy:%s/<C-r>h//gc<Left><Left><Left>',
--   { noremap = true, desc = "[s]ubtitude selected" }
-- )
--
-- -- replace current word in normal mode
-- vim.keymap.set(
--   "n",
--   "<Leader>s",
--   ":%s/<C-r><C-w>//gI<Left><Left><Left>",
--   { noremap = true, desc = "[s]ubtitude selected" }
-- )
--
-- move line up / down
vim.keymap.set(
  "n",
  "<S-Down>",
  ":m .+1<CR>==",
  { silent = true, desc = "move line down" }
)
vim.keymap.set(
  "n",
  "<S-Up>",
  ":m .-2<CR>==",
  { silent = true, desc = "move line up" }
)
vim.keymap.set(
  "i",
  "<S-Down>",
  "<Esc>:m .+1<CR>==gi",
  { silent = true, desc = "move line down" }
)
vim.keymap.set(
  "i",
  "<S-Up>",
  "<Esc>:m .-2<CR>==gi",
  { silent = true, desc = "move line up" }
)
vim.keymap.set(
  "v",
  "<S-Down>",
  ":m '>+1<CR>gv=gv",
  { silent = true, desc = "move line down" }
)
vim.keymap.set(
  "v",
  "<S-Up>",
  ":m '<-2<CR>gv=gv",
  { silent = true, desc = "move line up" }
)

-- join and stay in the same line
vim.keymap.set(
  "n",
  "gj",
  "mzJ`z",
  { noremap = true, silent = true, desc = "Join line" }
)

vim.keymap.set(
  "n",
  "gs",
  "a<CR><ESC>k$",
  { noremap = true, silent = true, desc = "Split line" }
)

-- change word with <c-c>
vim.keymap.set("n", "<C-c>", "<cmd>normal! ciw<cr>a")

-- Add empty lines before and after cursor line without goto insert mode
vim.keymap.set(
  "n",
  "gO",
  "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>",
  { desc = "Put empty line above" }
)
vim.keymap.set(
  "n",
  "go",
  "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>",
  { desc = "Put empty line below" }
)

-- NAVIGATION
-- windows navigation

-- vim.keymap.set(
--   "n",
--   "<C-h>",
--   "<C-w>h",
--   { noremap = true, silent = true, desc = "win left" }
-- )
-- vim.keymap.set(
--   "n",
--   "<C-j>",
--   "<C-w>j",
--   { noremap = true, silent = true, desc = "win down" }
-- )
-- vim.keymap.set(
--   "n",
--   "<C-k>",
--   "<C-w>k",
--   { noremap = true, silent = true, desc = "win up" }
-- )
-- vim.keymap.set(
--   "n",
--   "<C-l>",
--   "<C-w>l",
--   { noremap = true, silent = true, desc = "win right" }
-- )

vim.keymap.set(
  "t",
  "<esc>",
  "<C-\\><C-n>",
  { noremap = true, silent = true, desc = "Exit terminal-mode" }
)
vim.keymap.set(
  "t",
  "<C-h>",
  "<C-\\><C-n><C-w>h",
  { noremap = true, silent = true, desc = "win left" }
)
vim.keymap.set(
  "t",
  "<C-j>",
  "<C-\\><C-n><C-w>h",
  { noremap = true, silent = true, desc = "win down" }
)
vim.keymap.set(
  "t",
  "<C-k>",
  "<C-\\><C-n><C-w>h",
  { noremap = true, silent = true, desc = "win up" }
)
vim.keymap.set(
  "t",
  "<C-l>",
  "<C-\\><C-n><C-w>h",
  { noremap = true, silent = true, desc = "win right" }
)

-- for other windows moving and resizing, refer to smart-plit
-- split windows
vim.keymap.set(
  "n",
  "<leader>ww",
  "<C-W>w",
  { noremap = true, silent = true, desc = "Other window" }
)
vim.keymap.set(
  "n",
  "<leader>wd",
  "<C-W>c",
  { noremap = true, silent = true, desc = "Delete window" }
)
vim.keymap.set(
  "n",
  "<leader>wx",
  "<C-W>s",
  { noremap = true, silent = true, desc = "Split window below" }
)
vim.keymap.set(
  "n",
  "<leader>wv",
  "<C-W>v",
  { noremap = true, silent = true, desc = "Split window right" }
)
vim.keymap.set(
  "n",
  "<leader>-",
  "<C-W>s",
  { noremap = true, silent = true, desc = "Split window below" }
)
vim.keymap.set(
  "n",
  "<leader>|",
  "<C-W>v",
  { noremap = true, silent = true, desc = "Split window right" }
)

-- buffers navigation
vim.keymap.set(
  "n",
  "<leader>bb",
  "<cmd>e #<cr>",
  { noremap = true, silent = true, desc = "<-> buffer" }
)
vim.keymap.set(
  "n",
  "<leader>`",
  "<cmd>e #<cr>",
  { noremap = true, silent = true, desc = "<-> buffer" }
)

-- tab navigation
-- refer to bufferline for buffer navigation, un comment the following if you don't use bufferline
-- Go to tab by number
vim.keymap.set(
  "n",
  "<leader>1",
  "1gt",
  { silent = true, remap = true, desc = "Go to tab 1" }
)
vim.keymap.set(
  "n",
  "<leader>2",
  "2gt",
  { silent = true, remap = true, desc = "Go to tab 2" }
)
vim.keymap.set(
  "n",
  "<leader>3",
  "3gt",
  { silent = true, remap = true, desc = "Go to tab 3" }
)
vim.keymap.set(
  "n",
  "<leader>4",
  "4gt",
  { silent = true, remap = true, desc = "Go to tab 4" }
)
vim.keymap.set(
  "n",
  "<leader>5",
  "5gt",
  { silent = true, remap = true, desc = "Go to tab 5" }
)
vim.keymap.set(
  "n",
  "<leader>6",
  "6gt",
  { silent = true, remap = true, desc = "Go to tab 6" }
)
vim.keymap.set(
  "n",
  "<leader>7",
  "7gt",
  { silent = true, remap = true, desc = "Go to tab 7" }
)
vim.keymap.set(
  "n",
  "<leader>8",
  "8gt",
  { silent = true, remap = true, desc = "Go to tab 8" }
)
vim.keymap.set(
  "n",
  "<leader>9",
  "9gt",
  { silent = true, remap = true, desc = "Go to tab 9" }
)
vim.keymap.set(
  "n",
  "<leader>0",
  ":tablast<cr>",
  { silent = true, remap = true }
)

vim.keymap.set(
  "n",
  "<leader><tab>",
  ':execute "tabn " .. g:lasttab<CR>',
  { silent = true, remap = true, desc = "<-> tab" }
)

-- Go to next / previous, center with zz, and zv to open fold
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- scroll and stay in center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- move to the end of the line in insert mode
vim.keymap.set("i", "<C-a>", "<End>")

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

vim.keymap.set(
  "n",
  "k",
  "v:count == 0 ? 'gk' : 'k'",
  { expr = true, silent = true }
)

vim.keymap.set(
  "n",
  "j",
  "v:count == 0 ? 'gj' : 'j'",
  { expr = true, silent = true }
)

-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
  "n",
  "<leader>vl",
  "<cmd>Lazy<CR>",
  { silent = true, desc = "Lazy" }
)

vim.keymap.set(
  "n",
  "<leader>vm",
  "<cmd>Mason<CR>",
  { silent = true, desc = "Mason" }
)

-- TOGGLE OPTIONS
-- o == option
-- format not working yet
local toggle_prefix = "<leader>o"
if type(toggle_prefix) == "string" and toggle_prefix ~= "" then
  local map_toggle = function(lhs, rhs, desc)
    vim.keymap.set("n", toggle_prefix .. lhs, rhs, { desc = desc })
  end

  -- NOTE: showing current option value after toggling it is very useful but
  -- might not play nicely with `cmdheight=0` causing `hit-enter-prompt`.
  -- If it is crucial for you, consider doing one of these:
  -- - Copy this code without showing part: `xxx?` for most, similar for others.
  -- - Use `cmdheight=1`.
  -- - Use 'folke/noice.nvim'.
  -- - Help fixing https://github.com/neovim/neovim/issues/20673 .
  map_toggle(
    "b",
    '<Cmd>lua vim.o.bg = vim.o.bg == "dark" and "light" or "dark"; print(vim.o.bg)<CR>',
    "Toggle 'background'"
  )
  map_toggle(
    "c",
    "<Cmd>setlocal cursorline! cursorline?<CR>",
    "Toggle 'cursorline'"
  )
  map_toggle(
    "C",
    "<Cmd>setlocal cursorcolumn! cursorcolumn?<CR>",
    "Toggle 'cursorcolumn'"
  )
  map_toggle(
    "d",
    '<Cmd>lua print(require("merlinvn.util").toggle_diagnostic())<CR>',
    "Toggle diagnostic"
  )
  map_toggle(
    "h",
    '<Cmd>let v:hlsearch = 1 - v:hlsearch | echo (v:hlsearch ? "  " : "no") . "hlsearch"<CR>',
    "Toggle search highlight"
  )
  map_toggle(
    "i",
    "<Cmd>setlocal ignorecase! ignorecase?<CR>",
    "Toggle 'ignorecase'"
  )
  map_toggle("l", "<Cmd>setlocal list! list?<CR>", "Toggle 'list'")
  map_toggle("N", "<Cmd>setlocal number! number?<CR>", "Toggle 'number'")
  map_toggle(
    "r",
    "<Cmd>setlocal relativenumber! relativenumber?<CR>",
    "Toggle 'relativenumber'"
  )
  map_toggle("s", "<Cmd>setlocal spell! spell?<CR>", "Toggle 'spell'")
  map_toggle("w", "<Cmd>setlocal wrap! wrap?<CR>", "Toggle 'wrap'")
end

-- new file
-- o == open

-- vim.keymap.set(
--   "n",
--   "<leader>ol",
--   "<cmd>lopen<cr>",
--   { desc = "Open Location List" }
-- )
-- vim.keymap.set(
--   "n",
--   "<leader>oq",
--   "<cmd>copen<cr>",
--   { desc = "Open Quickfix List" }
-- )

-- EDIT HELPERS
-- undo break points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "[", "[<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")

-- remap _ naturally pair with -
vim.keymap.set(
  "n",
  "_",
  "(v:count == 0 ? 'j' : 'j').'^'",
  { noremap = true, silent = true, expr = true }
)
