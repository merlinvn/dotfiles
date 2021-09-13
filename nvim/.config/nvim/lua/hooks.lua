vim.api.nvim_exec(
  [[
function! StripTrailingWhitespaces()
  if !&binary && &filetype != 'diff'
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endif
endfun

augroup fmt
  autocmd!
  " autocmd BufWritePre *.lua try | :call StripTrailingWhitespaces() | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent  Neoformat | endtry
  " autocmd FileType lua autocmd BufWritePre <buffer> try | :call StripTrailingWhitespaces() | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent  Neoformat | endtry

  autocmd BufWritePost *.rs,*.lua FormatWrite
  autocmd BufWritePost *.js,*.ts lua vim.lsp.buf.formatting()
augroup END

" autocmd BufWritePre,FileWritePre,FileAppendPre,FilterWritePre * :call StripTrailingWhitespaces()
" autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()

augroup cmdline
    autocmd!
    autocmd CmdlineLeave : lua vim.defer_fn(function() vim.cmd('echo ""') end, 4000)
augroup END


]],
  true
)
