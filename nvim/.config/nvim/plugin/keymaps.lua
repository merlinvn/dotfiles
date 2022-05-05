local map = require("merlinvn.keymaps").map
local nmap = require("merlinvn.keymaps").nmap
local imap = require("merlinvn.keymaps").imap
local vmap = require("merlinvn.keymaps").vmap
local omap = require("merlinvn.keymaps").omap

-- avoid clashing with leader as space
-- nmap{"<Space>", "<NOP>", {noremap = true, silent = true})

-- turn off hightlight search
nmap { "<Leader><Esc>", ":nohlsearch<CR>" }

-- remap save
-- nmap {"<Leader>a", ":up<CR>"}
nmap { "<Leader>wq", ":wq<CR>" }
nmap { "<C-s>", ":up<CR>" }
imap { "<C-s>", "<Esc>:w<CR>a" }

-- remap quit
nmap { "<Leader>q", ":q<CR>" }

-- Edit vimr configuration file
nmap { "<Leader>ve", ":e $MYVIMRC<CR>" }
-- Reload vims configuration file
nmap { "<Leader>vr", ":source $MYVIMRC<CR>" }

nmap { "<Leader>lr", ":luafile %<CR>" }

-- Yank from the current cursor to the end of line
nmap { "Y", "y$" }

-- undo break points
imap { ",", ",<c-g>u" }
imap { ".", ".<c-g>u" }
imap { "!", "!<c-g>u" }
imap { "[", "[<c-g>u" }
imap { "?", "?<c-g>u" }

nmap { "<leader><left>", ":wincmd h<CR>" }
nmap { "<leader><down>", ":wincmd j<CR>" }
nmap { "<leader><up>", ":wincmd k<CR>" }
nmap { "<leader><right>", ":wincmd l<CR>" }

if vim.g.isColemakDH then
  -- move line up down
  --   -- MNEI arrows.
  --   nmap {"m", "h"}
  --   nmap {"n", "j"}
  --   nmap {"e", "k"}
  --   nmap {"i", "l"}
  --   nmap {"gn", "gj"}
  --   nmap {"gi", "gk"}
  --   -- In(s)ert. The default s/S is synonymous with cl/cc and is not very useful.
  --   nmap {"s", "i"}
  --   nmap {"S", "I"}
  --
  --   -- BOL/EOL/ Join line
  --   nmap {"l", "^"}
  --   nmap {"L", "$"}
  --   -- join and stay in the same line
  --   nmap {"<C-l>", "mzJ`z"}
  --
  --   -- remap bottom line
  --   -- nmap {"N", "L"}
  --
  --   -- _r_ = inneR text objects
  --   omap {"r", "i"}
  --
  --   -- end of word
  --   nmap {"j", "e"}
  --   nmap {"J", "E"}
  --
  --   -- Go to next / previous, center with zz, and zv to open fold
  --   nmap {"k", "nzzzv"}
  --   nmap {"K", "Nzzzv"}
  nmap { "<C-n>", ":m .+1<CR>==" }
  nmap { "<C-e>", ":m .-2<CR>==" }
  imap { "<C-n>", "<Esc>:m .+1<CR>==gi" }
  imap { "<C-e>", "<Esc>:m .-2<CR>==gi" }
  vmap { "<C-n>", ":m '>+1<CR>gv=gv" }
  vmap { "<C-e>", ":m '<-2<CR>gv=gv" }

  nmap { "<leader>m", ":wincmd h<CR>" }
  nmap { "<leader>n", ":wincmd j<CR>" }
  nmap { "<leader>e", ":wincmd k<CR>" }
  nmap { "<leader>i", ":wincmd l<CR>" }
else
  nmap { "<C-j>", ":m .+1<CR>==" }
  nmap { "<C-k>", ":m .-2<CR>==" }
  imap { "<C-j>", "<Esc>:m .+1<CR>==gi" }
  imap { "<C-k>", "<Esc>:m .-2<CR>==gi" }
  vmap { "<C-j>", ":m '>+1<CR>gv=gv" }
  vmap { "<C-k>", ":m '<-2<CR>gv=gv" }

  nmap { "<leader>h", ":wincmd h<CR>" }
  nmap { "<leader>j", ":wincmd j<CR>" }
  nmap { "<leader>k", ":wincmd k<CR>" }
  nmap { "<leader>l", ":wincmd l<CR>" }
end
-- Go to next / previous, center with zz, and zv to open fold
nmap { "n", "nzzzv" }
nmap { "N", "Nzzzv" }
-- join and stay in the same line
nmap { "J", "mzJ`z" }
-- jump list mutation
nmap { "<expr> k", "(v:count > 5 ? 'm'' . v:count : '') . 'k'" }
nmap { "<expr> j", "(v:count > 5 ? 'm'' . v:count : '') . 'j'" }

-- better p
nmap { ",p", '"0p' }
nmap { ",P", '"0p' }

-- paste from clipboard
nmap { "<C-p>", '"*p' }
nmap { "<C-f>", '"*P' }

-- copy whole text in file
nmap { "yz", ":%y+<CR>" }

-- buffers navigation
nmap { "<Leader>bd", ":bd<CR>" }

-- tab navigation
-- Go to tab by number
map { "<leader>1", "1gt" }
map { "<leader>2", "2gt" }
map { "<leader>3", "3gt" }
map { "<leader>4", "4gt" }
map { "<leader>5", "5gt" }
map { "<leader>6", "6gt" }
map { "<leader>7", "7gt" }
map { "<leader>8", "8gt" }
map { "<leader>9", "9gt" }
map { "<leader>0", ":tablast<cr>" }
