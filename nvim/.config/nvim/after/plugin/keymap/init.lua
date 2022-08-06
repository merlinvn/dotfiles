--print("Hello from keymap")

local nmap = require("merlinvn.keymap").nmap
local nnoremap = require("merlinvn.keymap").nnoremap
local inoremap = require("merlinvn.keymap").inoremap
local vnoremap = require("merlinvn.keymap").vnoremap
local onoremap = require("merlinvn.keymap").onoremap

-- turn off hightlight search
nnoremap("<Leader><Esc>", ":nohlsearch<CR>")
nnoremap("<leader>fe", ":Ex<CR>")

-- remap save
-- nnoremap("<Leader>a", ":up<CR>")
nnoremap("<C-s>", ":up<CR>")
inoremap("<C-s>", "<Esc>:w<CR>a")

-- remap quit
nnoremap("<Leader>q", ":bd<CR>")
nnoremap("<C-q>", ":q<CR>")
inoremap("<C-q>", "<Esc>:q<CR>")

-- Edit vimr configuration file
-- nnoremap("<Leader>ve", ":e $MYVIMRC<CR>")
-- Reload vims configuration file
nnoremap("<Leader>vr", ":source $MYVIMRC<CR>")
nnoremap("<Leader>lr", ":w<cr>:luafile %<CR>")

-- Yank from the current cursor to the end of line
nnoremap("Y", "y$")

-- undo break points
inoremap(",", ",<c-g>u")
inoremap(".", ".<c-g>u")
inoremap("!", "!<c-g>u")
inoremap("[", "[<c-g>u")
inoremap("?", "?<c-g>u")

nnoremap("<leader><left>", ":wincmd h<CR>")
nnoremap("<leader><down>", ":wincmd j<CR>")
nnoremap("<leader><up>", ":wincmd k<CR>")
nnoremap("<leader><right>", ":wincmd l<CR>")

nnoremap("<C-down>", ":m .+1<CR>==")
nnoremap("<C-up>", ":m .-2<CR>==")
inoremap("<C-down>", "<Esc>:m .+1<CR>==gi")
inoremap("<C-up>", "<Esc>:m .-2<CR>==gi")
vnoremap("<C-down>", ":m '>+1<CR>gv=gv")
vnoremap("<C-up>", ":m '<-2<CR>gv=gv")

-- Go to next / previous, center with zz, and zv to open fold
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- join and stay in the same line
nnoremap("J", "mzJ`z")
-- jump list mutation
nnoremap("<expr> k", "(v:count > 5 ? 'm'' . v:count : '') . 'k'")
nnoremap("<expr> j", "(v:count > 5 ? 'm'' . v:count : '') . 'j'")

-- better p
-- nnoremap(",p", '"0p')
-- nnoremap(",P", '"0p')

-- paste from clipboard
nnoremap("<C-p>", '"*p')
-- nnoremap( "<C-f>", '"*P' )

-- copy whole text in file
nnoremap("yz", ":%y+<CR>")

-- replace selected in visual mode, by yank current selection to register h, then
-- <C-r>h to paste in command mode, calling <left> * 3 to go back to proper position
vnoremap("<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>')

-- buffers navigation
nnoremap("<Leader>bd", ":bd<CR>")

-- tab navigation
-- Go to tab by number
nmap("<leader>1", "1gt")
nmap("<leader>2", "2gt")
nmap("<leader>3", "3gt")
nmap("<leader>4", "4gt")
nmap("<leader>5", "5gt")
nmap("<leader>6", "6gt")
nmap("<leader>7", "7gt")
nmap("<leader>8", "8gt")
nmap("<leader>9", "9gt")
nmap("<leader>0", ":tablast<cr>")

nnoremap("t", "<nop>")
nnoremap("tn", ":tabn<CR>")
nnoremap("tp", ":tabp<CR>")
-- c for create
nnoremap("tc", ":tabnew<CR>")
-- x for close
nnoremap("tx", ":tabclose<CR>")
nnoremap("tml", ":tabm-<cr>")
nnoremap("tmr", ":tabm+<cr>")

-- move to a specific tab number is not corect yet
-- nmap("tm0", ":tabm 1<cr>")
-- nmap("tm1", ":tabm 1<cr>")
-- nmap("tm2", ":tabm 2<cr>")
-- nmap("tm3", ":tabm 3<cr>")
-- nmap("tm4", ":tabm 4<cr>")
-- nmap("tm5", ":tabm 5<cr>")
-- nmap("tm6", ":tabm 6<cr>")
-- nmap("tm7", ":tabm 7<cr>")
-- nmap("tm8", ":tabm 8<cr>")
-- nmap("tm9", ":tabm 9<cr>")

if vim.g.isColemakDH then
  -- move line up down
  --   -- MNEI arrows.
  --   nnoremap("m", "h")
  --   nnoremap("n", "j")
  --   nnoremap("e", "k")
  --   nnoremap("i", "l")
  --   nnoremap("gn", "gj")
  --   nnoremap("gi", "gk")
  --   -- In(s)ert. The default s/S is synonymous with cl/cc and is not very useful.
  --   nnoremap("s", "i")
  --   nnoremap("S", "I")
  --
  --   -- BOL/EOL/ Join line
  --   nnoremap("l", "^")
  --   nnoremap("L", "$")
  --   -- join and stay in the same line
  --   nnoremap("<C-l>", "mzJ`z")
  --
  --   -- remap bottom line
  --   -- nnoremap("N", "L")
  --
  --   -- _r_ = inneR text objects
  --   onoremap("r", "i")
  --
  --   -- end of word
  --   nnoremap("j", "e")
  --   nnoremap("J", "E")
  --
  --   -- Go to next / previous, center with zz, and zv to open fold
  --   nnoremap("k", "nzzzv")
  --   nnoremap("K", "Nzzzv")
  -- nnoremap( "<C-e>", ":m .-2<CR>==" )
  -- inoremap( "<C-n>", "<Esc>:m .+1<CR>==gi" )
  -- inoremap( "<C-e>", "<Esc>:m .-2<CR>==gi" )
  -- nnoremap( "<C-n>", ":m .+1<CR>==" )
  -- vnoremap( "<C-n>", ":m '>+1<CR>gv=gv" )
  -- vnoremap( "<C-e>", ":m '<-2<CR>gv=gv" )
  --
  nnoremap("<leader>n", ":wincmd h<CR>")
  nnoremap("<leader>e", ":wincmd j<CR>")
  nnoremap("<leader>u", ":wincmd k<CR>")
  nnoremap("<leader>i", ":wincmd l<CR>")
else
  nnoremap("<C-j>", ":m .+1<CR>==")
  nnoremap("<C-k>", ":m .-2<CR>==")
  inoremap("<C-j>", "<Esc>:m .+1<CR>==gi")
  inoremap("<C-k>", "<Esc>:m .-2<CR>==gi")
  vnoremap("<C-j>", ":m '>+1<CR>gv=gv")
  vnoremap("<C-k>", ":m '<-2<CR>gv=gv")

  nnoremap("<leader>h", ":wincmd h<CR>")
  nnoremap("<leader>j", ":wincmd j<CR>")
  nnoremap("<leader>k", ":wincmd k<CR>")
  nnoremap("<leader>l", ":wincmd l<CR>")
end

if vim.fn.has('win32') then
  nnoremap("<C-z", "<nop>")
  inoremap("<C-z", "<nop>")
  vnoremap("<C-z", "<nop>")
  onoremap("<C-z", "<nop>")
  nmap("<C-z", "<nop>")
end
