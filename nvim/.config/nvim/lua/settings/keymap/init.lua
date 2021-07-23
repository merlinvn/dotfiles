local map = require('utils').map
-- avoid clashing with leader as space
map("n", "<Space>", "<NOP>", {noremap = true, silent = true})
-- Navigation
require('settings.keymap.navigation')
-- Telescope
require('settings.keymap.telescope')
-- LSP
require('settings.keymap.lsp')

-- turn off hightlight search
map('n', '<Leader><Esc>', ':nohlsearch<CR>')

-- remap save
map('n', '<Leader>s', ':w<CR>')
map('n', '<C-s>', ':w<CR>')
map('i', '<C-s>', '<Esc>:w<CR>a')

-- remap quit
map('n', '<Leader>q', ':q<CR>')

-- Edit vimr configuration file
map('n', '<Leader>ve', ':e $MYVIMRC<CR>')
-- Reload vims configuration file
map('n', '<Leader>vr', ':source $MYVIMRC<CR>')

map('n', '<Leader>lr', ':luafile %<CR>')

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

-- Vim Compe
map('i', '<C-Space>', 'compe#complete()', {silent = true, expr = true})
map('i', '<CR>', "compe#confirm('<CR>')", {silent = true, expr = true})
map('i', '<C-x>', "compe#close('<C-x>')", {silent = true, expr = true})
-- not working
-- map('i', '<C-f>', "compe#scroll({ 'delta': +4 })", {silent = true, expr = true})
-- map('i', '<C-d>', "compe#scroll({ 'delta': -4 })", {silent = true, expr = true})

-- NerdCommenter

map('n', '<leader>cc', ":call NERDComment('n', 'comment')<CR>")
map('x', '<leader>cc', ":call NERDComment('x', 'comment')<CR>")

map('n', '<leader>cu', ":call NERDComment('n', 'Uncomment')<CR>")
map('x', '<leader>cu', ":call NERDComment('x', 'Uncomment')<CR>")

map('n', '<leader>c/', ":call NERDComment('n', 'Invert')<CR>")
map('n', '<leader>c/', ":call NERDComment('x', 'Invert')<CR>")

