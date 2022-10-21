local nmap = require("merlinvn.keymap").nmap
local nnoremap = require("merlinvn.keymap").nnoremap
local inoremap = require("merlinvn.keymap").inoremap
local vnoremap = require("merlinvn.keymap").vnoremap
local onoremap = require("merlinvn.keymap").onoremap

-- turn off hightlight search
nnoremap("<Leader><space>", ":lua vim.o.hlsearch = not vim.o.hlsearch <cr>",
  { silent = true, desc = "Toggle highlight search" })

-- nnoremap("<leader>fe", ":Ex<CR>", { desc = "Open built-in file explorer" })

-- remap save
-- nnoremap("<Leader>a", ":up<CR>")
nnoremap("<C-s>", ":w<CR>", { silent = true })
inoremap("<C-s>", "<Esc>:w<CR>a", { silent = true })

-- remap quit
nnoremap("<Leader>q", ":bd<CR>", { silent = true })
nnoremap("<C-q>", ":q<CR>", { silent = true })
inoremap("<C-q>", "<Esc>:q<CR>", { silent = true })

-- Reload vims configuration file
nnoremap("<Leader>rl", ":w<cr>:luafile %<CR>", { desc = "Save and reload current luafile", silent = true })

-- Yank from the current cursor to the end of line
nnoremap("Y", "y$", { desc = "Yank from the current cursor to the end of line" })

nnoremap("<leader>*", ":%s/<C-r><C-w>//g<Left><Left>", { desc = "Find and replace current word" })

-- undo break points
inoremap(",", ",<c-g>u")
inoremap(".", ".<c-g>u")
inoremap("!", "!<c-g>u")
inoremap("[", "[<c-g>u")
inoremap("?", "?<c-g>u")

-- windows navigation
nnoremap("<leader>h", ":wincmd h<CR>", { silent = true })
nnoremap("<leader>j", ":wincmd j<CR>", { silent = true })
nnoremap("<leader>k", ":wincmd k<CR>", { silent = true })
nnoremap("<leader>l", ":wincmd l<CR>", { silent = true })

-- nnoremap("<C-left>", ":wincmd h<CR>", { silent = true })
-- nnoremap("<C-down>", ":wincmd j<CR>", { silent = true })
-- nnoremap("<C-up>", ":wincmd k<CR>", { silent = true })
-- nnoremap("<C-right>", ":wincmd l<CR>", { silent = true })

-- for other windows moving and resizing, refer to hydra
-- buffers navigation
nnoremap("<C-B>", ":bprev<cr>")
nnoremap("<C-b>", ":bnext<cr>")
-- nnoremap("<tab>", ":bprev<cr>")
-- nnoremap("<S-tab>", ":bnext<cr>")

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

-- nnoremap("<C-l>", ":tabnext<cr>")
-- nnoremap("<C-h>", ":tabprevious<cr>")

--move tab lnnt right
-- nnoremap("<C-S-h>", ":tabm-<cr>")
-- nnoremap("<C-S-l>", ":tabm+<cr>")
-- nnoremap("<C-S-left>", ":tabm-<cr>")
-- nnoremap("<C-S-right>", ":tabm+<cr>")

-- move line up / down
nnoremap("<C-j>", ":m .+1<CR>==")
nnoremap("<C-k>", ":m .-2<CR>==")
inoremap("<C-j>", "<Esc>:m .+1<CR>==gi")
inoremap("<C-k>", "<Esc>:m .-2<CR>==gi")
vnoremap("<C-j>", ":m '>+1<CR>gv=gv")
vnoremap("<C-k>", ":m '<-2<CR>gv=gv")

-- nnoremap("<C-down>", ":m .+1<CR>==")
-- nnoremap("<C-up>", ":m .-2<CR>==")
-- inoremap("<C-down>", "<Esc>:m .+1<CR>==gi")
-- inoremap("<C-up>", "<Esc>:m .-2<CR>==gi")
-- vnoremap("<C-down>", ":m '>+1<CR>gv=gv")
-- vnoremap("<C-up>", ":m '<-2<CR>gv=gv")

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
inoremap("<C-p>", '<esc>"*pa')
-- nnoremap( "<C-f>", '"*P' )

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
