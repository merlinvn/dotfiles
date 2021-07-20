
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
map('v', '<C-e>', ':m \'<-2<CR>gv=gv')

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
vim.api.nvim_set_keymap('n', '<leader>tg', ":lua require('telescope.builtin').live_grep()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tb', ":lua require('telescope.builtin').buffers()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tm', ":lua require('telescope.builtin').marks()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tt', ":lua require('telescope.builtin').treesitter()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tl', ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tf', ":lua require('plugins.telescope').project_files()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tp', ":lua require('telescope').extensions.project.project{}<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tc', ":lua require('plugins.telescope').my_git_commits()<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>td', ":lua require('telescope.builtin').git_files({ prompt_title = '< My dotfiles >', cwd = '$HOME/dotfiles/'})<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>vd', ":lua require('telescope.builtin').git_files({ prompt_title = '< My dotfiles >', :wd = '$HOME/dotfiles/'})<CR>", {noremap = true, silent = true})

--vim.api.nvim_set_keymap('n', '<leader>tg', ":lua require('plugins.telescope').my_git_status()<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>tb', ":lua require('plugins.telescope').my_git_bcommits()<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>tn', ":lua require('plugins.telescope').my_note()<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>tnn', ":e ~/Note/", {noremap = true, silent = false})
--vim.api.nvim_set_keymap('n', '<leader>gc', ':Octo issue create<CR>', {noremap = true, silent = false})
--vim.api.nvim_set_keymap('n', '<leader>i', ':Octo issue list<CR>', {noremap = true, silent = false})


  --nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
  --nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>

  --nnoremap <leader>pf :lua require('telescope.builtin').find_files()<cr>

  --nnoremap <leader>pl :lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>

  --nnoremap <leader>pt :lua require("telescope.builtin").current_buffer_tags()<CR>

  --" required ripgrep via `sudo apt install ripgrep`
  --nnoremap <leader>pg :lua require('telescope.builtin').live_grep()<cr>

  --nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

  --nnoremap <leader>pb :lua require('telescope.builtin').buffers()<cr>
  --nnoremap <leader>bs :lua require('telescope.builtin').buffers()<CR>

  --nnoremap <leader>ph :lua require('telescope.builtin').help_tags()<CR>
  --nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>


  --nnoremap <leader>pc :lua require('merlinvn.telescope').git_branches()<CR>


--
