if has('nvim')
  lua require("merlinvn")
  " Telescope mapping
  " Using lua functions
  nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
  nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>

  nnoremap <leader>pf :lua require('telescope.builtin').find_files()<cr>

  " required ripgrep via `sudo apt install ripgrep`
  nnoremap <leader>pg :lua require('telescope.builtin').live_grep()<cr>

  nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
  nnoremap <leader>pb :lua require('telescope.builtin').buffers()<cr>

  nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>

  nnoremap <leader>vdf :lua require("telescope.builtin").find_files({ prompt_title = "< My dotfiles >", cwd = "$HOME/dotfiles/"})<CR>

  nnoremap <leader>gc :lua require('merlinvn.telescope').git_branches()<CR>
else
  if v:version >= 802
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
  else
    let g:fzf_layout = {}
  endif
  let $FZF_DEFAULT_OPTS='--reverse'
  let g:fzf_branch_actions = {
        \ 'rebase': {
        \   'prompt': 'Rebase> ',
        \   'execute': 'echo system("{git} rebase {branch}")',
        \   'multiple': v:false,
        \   'keymap': 'ctrl-r',
        \   'required': ['branch'],
        \   'confirm': v:false,
        \ },
        \ 'track': {
        \   'prompt': 'Track> ',
        \   'execute': 'echo system("{git} checkout --track {branch}")',
        \   'multiple': v:false,
        \   'keymap': 'ctrl-t',
        \   'required': ['branch'],
        \   'confirm': v:false,
        \ },
        \}
  nnoremap <leader>pf :Files<cr>
  nnoremap <C-p> :GFiles<CR>
  " required ripgrep via `sudo apt install ripgrep`
  nnoremap <leader>pg :Rg<cr>

endif


