local map = require('utils').map
-- remap navigation key for ColemakDH
-- if vim.g.isColemakDH then
--     map("", "m", "h", {noremap = true, silent = true})
--     map("", "n", "j", {noremap = true, silent = true})
--     map("", "e", "k", {noremap = true, silent = true})
--     map("", "i", "l", {noremap = true, silent = true})
--
--     map("", "j", "m", {noremap = true, silent = true})
--     map("", "l", "n", {noremap = true, silent = true})
--     map("", "k", "e", {noremap = true, silent = true})
--     map("", "h", "i", {noremap = true, silent = true})
-- end
-- Window navigations
if vim.g.isColemakDH then
    map('n', '<leader>m', ':wincmd h<CR>')
    map('n', '<leader>n', ':wincmd j<CR>')
    map('n', '<leader>e', ':wincmd k<CR>')
    map('n', '<leader>i', ':wincmd l<CR>')
else
    map('n', '<leader>h', ':wincmd h<CR>')
    map('n', '<leader>j', ':wincmd j<CR>')
    map('n', '<leader>k', ':wincmd k<CR>')
    map('n', '<leader>l', ':wincmd l<CR>')
end

-- buffers navigation
map('n', '<Leader>bd', ':bd<CR>')

-- tab navigation
-- Go to tab by number
map('', '<leader>1', '1gt')
map('', '<leader>2', '2gt')
map('', '<leader>3', '3gt')
map('', '<leader>4', '4gt')
map('', '<leader>5', '5gt')
map('', '<leader>6', '6gt')
map('', '<leader>7', '7gt')
map('', '<leader>8', '8gt')
map('', '<leader>9', '9gt')
map('', '<leader>0', ':tablast<cr>')
