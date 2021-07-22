local map = require('utils').map

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

