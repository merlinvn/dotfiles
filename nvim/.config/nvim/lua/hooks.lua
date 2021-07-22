vim.api.nvim_exec([[
function! StripTrailingWhitespaces()
  if !&binary && &filetype != 'diff'
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endif
endfun

augroup fmt
  autocmd!
  autocmd BufWritePre * try | :call StripTrailingWhitespaces() | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent  Neoformat | endtry
augroup END

" autocmd BufWritePre,FileWritePre,FileAppendPre,FilterWritePre * :call StripTrailingWhitespaces()
" autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
]], true)
