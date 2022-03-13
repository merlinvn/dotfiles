local map = require("merlinvn.keymaps").map
local nmap = require("merlinvn.keymaps").nmap
local imap = require("merlinvn.keymaps").imap
local vmap = require("merlinvn.keymaps").vmap
local omap = require("merlinvn.keymaps").omap

-- avoid clashing with leader as space
-- nmap{"<Space>", "<NOP>", {noremap = true, silent = true})

-- Telescope
require("merlinvn.telescope.mappings")
-- LSP
require("merlinvn.lsp.mappings")

require("merlinvn.hop.mappings")

-- turn off hightlight search
nmap{"<Leader><Esc>", ":nohlsearch<CR>"}

-- remap save
nmap{"<Leader>s", ":up<CR>"}
nmap{"<C-s>", ":w<CR>"}
imap{"<C-s>", "<Esc>:w<CR>a"}

-- remap quit
nmap{"<Leader>q", ":q<CR>"}

-- Edit vimr configuration file
nmap{"<Leader>ve", ":e $MYVIMRC<CR>"}
-- Reload vims configuration file
nmap{"<Leader>vr", ":source $MYVIMRC<CR>"}

nmap{"<Leader>lr", ":luafile %<CR>"}

-- Yank from the current cursor to the end of line
nmap{"Y", "y$"}

-- Go to next / previous, center with zz, and zv to open fold
nmap{"n", "nzzzv"}
nmap{"N", "Nzzzv"}

-- join and stay in the same line
nmap{"J", "mzJ`z"}

-- undo break points
imap{",", ",<c-g>u"}
imap{".", ".<c-g>u"}
imap{"!", "!<c-g>u"}
imap{"?", "?<c-g>u"}

-- move line up down
if vim.g.isColemakDH then
  nmap{"<C-n>", ":m .+1<CR>=="}
  nmap{"<C-e>", ":m .-2<CR>=="}
  imap{"<C-n>", "<Esc>:m .+1<CR>==gi"}
  imap{"<C-e>", "<Esc>:m .-2<CR>==gi"}
  vmap{"<C-n>", ":m '>+1<CR>gv=gv"}
  vmap{"<C-e>", ":m '<-2<CR>gv=gv"}
-- MNEI arrows.
  nmap{"m", "h"}
  nmap{"n", "j"}
  nmap{"e", "k"}
  nmap{"i", "l"}
  nmap{"gn", "gj"}
  nmap{"gi", "gk"}
-- In(s)ert. The default s/S is synonymous with cl/cc and is not very useful.
  nmap{"s", "i"}
  nmap{"S", "I"}

-- next search
  nmap{"k", "n"}
  nmap{"K", "K"}

-- BOL/EOL/ Join line
  nmap{"l","^"}
  nmap{"L","$"}
  nmap{"<C-l>","J"}

-- _r_ = inneR text objects
  omap{"r","i"}

-- end of word
  nmap{"j","e"}
  nmap{"J","E"}
else
  nmap{"<C-j>", ":m .+1<CR>=="}
  nmap{"<C-k>", ":m .-2<CR>=="}
  imap{"<C-j>", "<Esc>:m .+1<CR>==gi"}
  imap{"<C-k>", "<Esc>:m .-2<CR>==gi"}
  vmap{"<C-j>", ":m '>+1<CR>gv=gv"}
  vmap{"<C-k>", ":m '<-2<CR>gv=gv"}
end

-- better p
nmap{",p", '"0p'}
nmap{",P", '"0p'}

-- paste from clipboard
nmap{"<C-p>", '"*p'}
nmap{"<C-f>", '"*P'}

-- copy whole text in file
nmap{"yz", ":%y+<CR>"}

-- Window navigations
if vim.g.isColemakDH then
    nmap{'<leader>m', ':wincmd h<CR>'}
    nmap{'<leader>n', ':wincmd j<CR>'}
    nmap{'<leader>e', ':wincmd k<CR>'}
    nmap{'<leader>i', ':wincmd l<CR>'}
else
    nmap{'<leader>h', ':wincmd h<CR>'}
    nmap{'<leader>j', ':wincmd j<CR>'}
    nmap{'<leader>k', ':wincmd k<CR>'}
    nmap{'<leader>l', ':wincmd l<CR>'}
end

-- buffers navigation
nmap{'<Leader>bd', ':bd<CR>'}

-- tab navigation
-- Go to tab by number
map{'<leader>1', '1gt'}
map{'<leader>2', '2gt'}
map{'<leader>3', '3gt'}
map{'<leader>4', '4gt'}
map{'<leader>5', '5gt'}
map{'<leader>6', '6gt'}
map{'<leader>7', '7gt'}
map{'<leader>8', '8gt'}
map{'<leader>9', '9gt'}
map{'<leader>0', ':tablast<cr>'}
