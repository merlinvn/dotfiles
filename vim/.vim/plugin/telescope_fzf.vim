if v:version >= 803
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

nnoremap <leader>tf :Files<cr>
nnoremap <C-p> :GFiles<CR>
" required ripgrep via `sudo apt install ripgrep`
nnoremap <leader>tg :Rg<cr>

nnoremap <leader>tl :BLines<CR>
nnoremap <leader>tL :Lines<CR>

nnoremap <leader>tt :BTags<CR>
nnoremap <leader>tT :Tags<CR>



