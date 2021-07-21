-- local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- avoid clashing with leader as space
map("n", "<Space>", "<NOP>", {noremap = true, silent = true})

-- turn off hightlight search
map('n', '<Leader><Esc>', ':nohlsearch<CR>')

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

-- Telescope
-- File pickers
map('n', '<leader>tf', ":lua require('telescope.builtin').find_files()<CR>",
    {noremap = true, silent = true})
map('n', '<leader>ta', ":lua require('telescope.builtin').file_browser()<CR>",
    {noremap = true, silent = true})

map('n', '<leader>tg', ":lua require('telescope.builtin').live_grep()<CR>",
    {noremap = true, silent = true})
map('n', '<leader>ts',
    ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>",
    {noremap = true, silent = true})
map('n', '<leader>tw',
    ":lua require('telescope.builtin').grep_string{ search = vim.fn.expand('<cword>')}<CR>",
    {noremap = true, silent = true})
map('n', '<leader>td',
    ":lua require('telescope.builtin').git_files({ prompt_title = '< My dotfiles >', cwd = '$HOME/dotfiles/'})<CR>",
    {noremap = true, silent = true})
map('n', '<leader>vd',
    ":lua require('telescope.builtin').git_files({ prompt_title = '< My dotfiles >', cwd = '$HOME/dotfiles/'})<CR>",
    {noremap = true, silent = true})

-- Vim pickers
map('n', '<leader>tb', ":lua require('telescope.builtin').buffers()<CR>",
    {noremap = true, silent = true})
map('n', '<leader>tk', ":lua require('telescope.builtin').keymaps()<CR>",
    {noremap = true, silent = true})
map('n', '<leader>tt',
    ":lua require('telescope.builtin').current_buffer_tags()<CR>",
    {noremap = true, silent = true})
map('n', '<leader>tl',
    ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
    {noremap = true, silent = true})
map('n', '<leader>th', ":lua require('telescope.builtin').help_tags()<CR>",
    {noremap = true, silent = true})
map('n', '<leader>tm', ":lua require('telescope.builtin').marks()<CR>",
    {noremap = true, silent = true})

map('n', '<leader>tc', ":lua require('plugins.telescope').git_branches()<CR>",
    {noremap = true, silent = true})

map('n', '<leader>tr', ":lua require('telescope.builtin').treesitter()<CR>",
    {noremap = true, silent = true})

-- LSP

-- Vim Compe
map('i', '<C-Space>', 'compe#complete()', {silent = true, expr = true})
map('i', '<CR>', "compe#confirm('<CR>')", {silent = true, expr = true})
map('i', '<C-x>', "compe#close('<C-x>')", {silent = true, expr = true})
-- not working
-- map('i', '<C-f>', "compe#scroll({ 'delta': +4 })", {silent = true, expr = true})
-- map('i', '<C-d>', "compe#scroll({ 'delta': -4 })", {silent = true, expr = true})

--
