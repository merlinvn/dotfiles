local map = require('utils').map

-- avoid clashing with leader as space
map("n", "<Space>", "<NOP>", {noremap = true, silent = true})
-- Navigation
require('settings.keymap.navigation')
-- Telescope
require('settings.keymap.telescope')
-- LSP
require('settings.keymap.lsp')

require('settings.keymap.hop')

-- turn off hightlight search
map('n', '<Leader><Esc>', ':nohlsearch<CR>')

-- remap save
map('n', '<Leader>s', ':up<CR>')
map('n', '<C-s>', ':w<CR>')
map('i', '<C-s>', '<Esc>:w<CR>a')

-- remap quit
map('n', '<Leader>q', ':q<CR>')

-- Edit vimr configuration file
map('n', '<Leader>ve', ':e $MYVIMRC<CR>')
-- Reload vims configuration file
map('n', '<Leader>vr', ':source $MYVIMRC<CR>')

map('n', '<Leader>lr', ':luafile %<CR>')

-- Yank from the current cursor to the end of line
map('n', 'Y', 'y$')

-- Go to next / previous, center with zz, and zv to open fold
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- join and stay in the same line
map('n', 'J', 'mzJ`z')

-- undo break points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '/<c-g>u')

-- move line up down
if vim.g.isColemakDH then
    map('n', '<C-n>', ':m .+1<CR>==')
    map('n', '<C-e>', ':m .-2<CR>==')
    map('i', '<C-n>', '<Esc>:m .+1<CR>==gi')
    map('i', '<C-e>', '<Esc>:m .-2<CR>==gi')
    map('v', '<C-n>', ':m \'>+1<CR>gv=gv')
    map('v', '<C-e>', ':m \'<-2<CR>gv=gv')
else
    map('n', '<C-j>', ':m .+1<CR>==')
    map('n', '<C-k>', ':m .-2<CR>==')
    map('i', '<C-j>', '<Esc>:m .+1<CR>==gi')
    map('i', '<C-k>', '<Esc>:m .-2<CR>==gi')
    map('v', '<C-j>', ':m \'>+1<CR>gv=gv')
    map('v', '<C-k>', ':m \'<-2<CR>gv=gv')
end

-- better p
map('n', ',p', '"0p')
map('n', ',P', '"0p')

-- paste from clipboard
map('n', '<C-p>', '"*p')
map('n', '<C-f>', '"*P')

-- copy whole text in file
map('n', 'yz', ':%y+<CR>')

-- Vim Compe
map('i', '<C-Space>', 'compe#complete()', {silent = true, expr = true})
map('i', '<CR>', "compe#confirm('<CR>')", {silent = true, expr = true})
map('i', '<C-x>', "compe#close('<C-x>')", {silent = true, expr = true})
-- not working
-- map('i', '<C-f>', "compe#scroll({ 'delta': +4 })", {silent = true, expr = true})
-- map('i', '<C-d>', "compe#scroll({ 'delta': -4 })", {silent = true, expr = true})

