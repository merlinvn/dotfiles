--print("Hello from keymap")

local nmap = require("merlinvn.keymap").nmap
local nnoremap = require("merlinvn.keymap").nnoremap
local inoremap = require("merlinvn.keymap").inoremap
local vnoremap = require("merlinvn.keymap").vnoremap
local onoremap = require("merlinvn.keymap").onoremap

-- turn off hightlight search
nnoremap("<Leader><Esc>", ":nohlsearch<CR>", { desc = "Turn off search highlight" })
nnoremap("<leader>fe", ":Ex<CR>", { desc = "Open built-in file explorer" })

-- remap save
-- nnoremap("<Leader>a", ":up<CR>")
nnoremap("<C-s>", ":up<CR>")
inoremap("<C-s>", "<Esc>:w<CR>a")
nnoremap("<leader>s", ":up<CR>")

-- remap quit
nnoremap("<Leader>q", ":bd<CR>")
nnoremap("<C-q>", ":q<CR>")
inoremap("<C-q>", "<Esc>:q<CR>")

-- Edit vimr configuration file
-- nnoremap("<Leader>ve", ":e $MYVIMRC<CR>")
-- Reload vims configuration file
-- nnoremap("<Leader>vr", ":source $MYVIMRC<CR>")
nnoremap("<Leader>lr", ":w<cr>:luafile %<CR>", { desc = "Save and reload current luafile" })

-- Yank from the current cursor to the end of line
nnoremap("Y", "y$", { desc = "Yank from the current cursor to the end of line" })


-- undo break points
inoremap(",", ",<c-g>u")
inoremap(".", ".<c-g>u")
inoremap("!", "!<c-g>u")
inoremap("[", "[<c-g>u")
inoremap("?", "?<c-g>u")

-- windows navigation
nnoremap("<leader>h", ":wincmd h<CR>")
nnoremap("<leader>j", ":wincmd j<CR>")
nnoremap("<leader>k", ":wincmd k<CR>")
nnoremap("<leader>l", ":wincmd l<CR>")

-- windows navigation for colemak
nnoremap("<leader>n", ":wincmd h<CR>")
nnoremap("<leader>e", ":wincmd j<CR>")
nnoremap("<leader>u", ":wincmd k<CR>")
nnoremap("<leader>i", ":wincmd l<CR>")

nnoremap("<leader><left>", ":wincmd h<CR>")
nnoremap("<leader><down>", ":wincmd j<CR>")
nnoremap("<leader><up>", ":wincmd k<CR>")
nnoremap("<leader><right>", ":wincmd l<CR>")

-- for other windows moving and resizing, refer to hydra
-- buffers navigation
nnoremap("<S-h>", ":bprevious<cr>")
nnoremap("<S-l>", ":bnext<cr>")
nnoremap("<S-left>", ":bprevious<cr>")
nnoremap("<S-right>", ":bnext<cr>")

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

-- create new tab
nnoremap("<C-t>", "<C-w>s<C-w>T")
-- x for close
nnoremap("<C-x>", ":tabclose<CR>")

nnoremap("<tab>", ":tabnext<cr>")
nnoremap("<S-tab>", ":tabprevious<cr>")

--move tab left right
nnoremap("<C-S-h>", ":tabm-<cr>")
nnoremap("<C-S-l>", ":tabm+<cr>")
nnoremap("<C-S-left>", ":tabm-<cr>")
nnoremap("<C-S-right>", ":tabm+<cr>")

-- move line up / down
nnoremap("<C-j>", ":m .+1<CR>==")
nnoremap("<C-k>", ":m .-2<CR>==")
inoremap("<C-j>", "<Esc>:m .+1<CR>==gi")
inoremap("<C-k>", "<Esc>:m .-2<CR>==gi")
vnoremap("<C-j>", ":m '>+1<CR>gv=gv")
vnoremap("<C-k>", ":m '<-2<CR>gv=gv")

nnoremap("<C-down>", ":m .+1<CR>==")
nnoremap("<C-up>", ":m .-2<CR>==")
inoremap("<C-down>", "<Esc>:m .+1<CR>==gi")
inoremap("<C-up>", "<Esc>:m .-2<CR>==gi")
vnoremap("<C-down>", ":m '>+1<CR>gv=gv")
vnoremap("<C-up>", ":m '<-2<CR>gv=gv")

-- Go to next / previous, center with zz, and zv to open fold
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- scroll and stay in center
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- join and stay in the same line
nnoremap("J", "mzJ`z")
-- jump list mutation
nnoremap("<expr> k", "(v:count > 5 ? 'm'' . v:count : '') . 'k'")
nnoremap("<expr> j", "(v:count > 5 ? 'm'' . v:count : '') . 'j'")

-- indent and stay in visual
vnoremap(">", ">gv")
vnoremap("<", "<gv")


-- better p
-- nnoremap(",p", '"0p')
-- nnoremap(",P", '"0p')
vnoremap("p", '"_dP')

-- paste from clipboard
nnoremap("<C-p>", '"*p')
inoremap("<C-p>", '<esc>"*pi')
-- nnoremap( "<C-f>", '"*P' )

-- copy whole text in file
nnoremap("yz", ":%y+<CR>")

-- replace selected in visual mode, by yank current selection to register h, then
-- <C-r>h to paste in command mode, calling <left> * 3 to go back to proper position
vnoremap("<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>')


if vim.fn.has('win32') then
  nnoremap("<C-z", "<nop>")
  inoremap("<C-z", "<nop>")
  vnoremap("<C-z", "<nop>")
  onoremap("<C-z", "<nop>")
  nmap("<C-z", "<nop>")
end
