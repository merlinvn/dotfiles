
local function map(mode, lhs, rhs, opts)
  local options = {noremap  = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- avoid clashing with leader as space
map("n", "<Space>", "<NOP>", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<Leader>s', '<cmd>w<CR>', { map('', '= true, silent = true })
-- remap save
map('n', '<Leader>s', '<cmd>w<CR>')
map('n', '<C-s>', '<cmd>w<CR>')
map('i', '<C-s>', '<Esc>:w<CR>a')

-- remap quit
map('n', '<Leader>q', '<cmd>q<CR>')

-- Edit vimr configuration file
map('n', '<Leader>ve', ':e $MYVIMRC<CR>')
-- Reload vims configuration file
map('n', '<Leader>vr' , ':source $MYVIMRC<CR>')

map('n', '<Leader>lr' , ':luafile %<CR>')

-- Window navigations
map('n', '<leader>m', ':wincmd h<CR>')
map('n', '<leader>n', ':wincmd j<CR>')
map('n', '<leader>e', ':wincmd k<CR>')
map('n', '<leader>i', ':wincmd l<CR>')


-- move line up down
map('n', '<C-n>', ':m .+1<CR>==')
map('n', '<C-e>', ':m .-2<CR>==')
map('i', '<C-n>', '<Esc>:m .+1<CR>==gi')
map('i', '<C-e>', '<Esc>:m .-2<CR>==gi')
map('v', '<C-n>', ':m \'>+1<CR>gv=gv')
map('v', '<C-e>', ':m \'<-1<CR>gv=gv')


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
