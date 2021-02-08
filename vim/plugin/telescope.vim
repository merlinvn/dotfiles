" Telescope mapping
lua << EOF
require('telescope').setup{
  defaults = {
    file_sorter =  require'telescope.sorters'.get_fuzzy_sorter
  }
}
EOF

" Using lua functions
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>

nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<cr>

" required ripgrep via `sudo apt install ripgrep`
nnoremap <leader>pg <cmd>lua require('telescope.builtin').live_grep()<cr>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ph <cmd>lua require('telescope.builtin').help_tags()<cr>


