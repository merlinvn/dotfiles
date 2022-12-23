-- turn off hightlight search
-- vim.keymap.set("n", "<Leader><space>", ":lua vim.o.hlsearch = not vim.o.hlsearch <cr>",
--   { silent = true, desc = "Toggle highlight search" })

-- vim.keymap.set("n", "<leader>fe", ":Ex<CR>", { desc = "Open built-in file explorer" })

-- remap save
-- vim.keymap.set("n", "<Leader>a", ":up<CR>")
vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { silent = true })

-- remap quit
vim.keymap.set("n", "<Leader>q", ":bd<CR>", { silent = true, desc = "Close current buffer" })
vim.keymap.set("n", "<C-q>", ":q<CR>", { silent = true })
vim.keymap.set("i", "<C-q>", "<Esc>:q<CR>", { silent = true })

-- Reload vims configuration file
vim.keymap.set("n", "<Leader>rl", ":w<cr>:luafile %<CR>", { desc = "Save and reload current luafile", silent = true })

-- Yank from the current cursor to the end of line
vim.keymap.set("n", "Y", "y$", { desc = "Yank from the current cursor to the end of line" })

vim.keymap.set("n", "<leader>*", ":%s/<C-r><C-w>//g<Left><Left>", { desc = "Find and replace current word" })

-- undo break points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "[", "[<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")

-- windows navigation
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { silent = true, desc = "win left" })
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>", { silent = true, desc = "win right" })
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>", { silent = true, desc = "win up" })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { silent = true, desc = "win down" })

-- vim.keymap.set("n", "<C-left>", ":wincmd h<CR>", { silent = true })
-- vim.keymap.set("n", "<C-down>", ":wincmd j<CR>", { silent = true })
-- vim.keymap.set("n", "<C-up>", ":wincmd k<CR>", { silent = true })
-- vim.keymap.set("n", "<C-right>", ":wincmd l<CR>", { silent = true })

-- for other windows moving and resizing, refer to hydra
-- buffers navigation
vim.keymap.set("n", "<C-B>", ":bprev<cr>", { silent = true })
vim.keymap.set("n", "<C-b>", ":bnext<cr>", { silent = true })
-- vim.keymap.set("n", "<tab>", ":bprev<cr>")
-- vim.keymap.set("n", "<S-tab>", ":bnext<cr>")

-- tab navigation
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
vim.keymap.set("n", "<leader>0", ":tablast<cr>", { silent = true, remap = true } )

-- create new tab
vim.keymap.set("n", "<C-t>", "<C-w>s<C-w>T")
-- x for close
vim.keymap.set("n", "<C-x>", ":tabclose<CR>")

-- vim.keymap.set("n", "<C-l>", ":tabnext<cr>")
-- vim.keymap.set("n", "<C-h>", ":tabprevious<cr>")

--move tab lnnt right
-- vim.keymap.set("n", "<C-S-h>", ":tabm-<cr>")
-- vim.keymap.set("n", "<C-S-l>", ":tabm+<cr>")
-- vim.keymap.set("n", "<C-S-left>", ":tabm-<cr>")
-- vim.keymap.set("n", "<C-S-right>", ":tabm+<cr>")

-- move line up / down
vim.keymap.set("n", "<C-j>", ":m .+2<CR>==", { silent = true })
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { silent = true })
vim.keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { silent = true })
vim.keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { silent = true })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { silent = true })

-- vim.keymap.set("n", "<C-down>", ":m .+1<CR>==")
-- vim.keymap.set("n", "<C-up>", ":m .-2<CR>==")
-- vim.keymap.set("i", "<C-down>", "<Esc>:m .+1<CR>==gi")
-- vim.keymap.set("i", "<C-up>", "<Esc>:m .-2<CR>==gi")
-- vim.keymap.set("v", "<C-down>", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "<C-up>", ":m '<-2<CR>gv=gv")

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
vim.keymap.set("n", "<C-p>", '"*p')
vim.keymap.set("i", "<C-p>", '<esc>"*pa')
-- vim.keymap.set("n",  "<C-f>", '"*P' )

-- replace selected in visual mode, by yank current selection to register h, then
-- <C-r>h to paste in command mode, calling <left> * 3 to go back to proper position
vim.keymap.set("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>')

if vim.fn.has('win32') then
  vim.keymap.set({ "n", "i", "v", "o" }, "<C-z>", "<nop>")
  vim.keymap.set({ "n", "i", "v", "o" }, "<C-z>", "<nop>", { remap = true })
end
