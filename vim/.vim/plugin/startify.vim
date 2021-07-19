let use_system_cowsay = 0
if use_system_cowsay && executable('cowsay') && executable('fortune')
  let g:startify_custom_header =
        \ startify#center(split(system('fortune | cowsay'), '\n'))
else
  let g:startify_custom_header =
            \ 'startify#center(startify#fortune#cowsay())'
endif

