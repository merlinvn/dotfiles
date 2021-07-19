" cheat.sh settings
let g:CheatSheetDoNotMap=1

" nnoremap <script> <silent> <leader>C :call cheat#toggleComments()<CR>

" Buffer
nnoremap <script> <silent> <leader>KB
            \ :call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 0, '!')<CR>
vnoremap <script> <silent> <leader>KB
            \ :call cheat#cheat("", -1, -1, 2, 0, '!')<CR>

" Pager
" nnoremap <script> <silent> <leader>KK
            " \ :call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 2, '!')<CR>
" vnoremap <script> <silent> <leader>KK
            " \ :call cheat#cheat("", -1, -1, 2, 2, '!')<CR>

" vnoremap <script> <silent> <leader>KL  :call cheat#session#last()<CR>
" nnoremap <script> <silent> <leader>KL  :call cheat#session#last()<CR>


" " Replace
" nnoremap <script> <silent> <leader>KR
            " \ :call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 1, '!')<CR>
" vnoremap <script> <silent> <leader>KR
            " \ :call cheat#cheat("", -1, -1, 2, 1, '!')<CR>

" " Paste
" nnoremap <script> <silent> <leader>KP
            " \ :call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 4, '!')<CR>
" vnoremap <script> <silent> <leader>KP
            " \ :call cheat#cheat("", -1, -1, 4, 1, '!')<CR>

" nnoremap <script> <silent> <leader>Kp
            " \ :call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 3, '!')<CR>
" vnoremap <script> <silent> <leader>Kp
            " \ :call cheat#cheat("", -1, -1, 3, 1, '!')<CR>

" " Buffer
" nnoremap <script> <silent> <leader>KE
            " \ :call cheat#cheat("", -1, -1 , -1, 5, '!')<CR>
" vnoremap <script> <silent> <leader>KE
            " \ :call cheat#cheat("", -1, -1, -1, 5, '!')<CR>
 " " Toggle comments
" nnoremap <script> <silent> <leader>KC :call cheat#navigate(0, 'C')<CR>
" vnoremap <script> <silent> <leader>KC :call cheat#navigate(0, 'C')<CR>

" " Next
" nnoremap <script> <silent> <leader>KQN :call cheat#navigate(1,'Q')<CR>
" vnoremap <script> <silent> <leader>KQN :call cheat#navigate(1,'Q')<CR>
" nnoremap <script> <silent> <leader>KAN :call cheat#navigate(1, 'A')<CR>
" vnoremap <script> <silent> <leader>KAN :call cheat#navigate(1, 'A')<CR>
" nnoremap <script> <silent> <leader>KHN :call cheat#navigate(1, 'H')<CR>
" vnoremap <script> <silent> <leader>KHN :call cheat#navigate(1, 'H')<CR>

" " Prev
" nnoremap <script> <silent> <leader>KQP :call cheat#navigate(-1,'Q')<CR>
" vnoremap <script> <silent> <leader>KQP :call cheat#navigate(-1,'Q')<CR>
" nnoremap <script> <silent> <leader>KAP :call cheat#navigate(-1,'A')<CR>
" vnoremap <script> <silent> <leader>KAP :call cheat#navigate(-1,'A')<CR>
" nnoremap <script> <silent> <leader>KHP :call cheat#navigate(-1, 'H')<CR>
" vnoremap <script> <silent> <leader>KHP :call cheat#navigate(-1, 'H')<CR>

" " See Also
" nnoremap <script> <silent> <leader>KSN :call cheat#navigate(1,'S')<CR>
" vnoremap <script> <silent> <leader>KSN :call cheat#navigate(1,'S')<CR>
" nnoremap <script> <silent> <leader>KSP :call cheat#navigate(-1,'S')<CR>
" vnoremap <script> <silent> <leader>KSP :call cheat#navigate(-1,'S')<CR>

" " Frameworks switch
" nnoremap <script> <silent> <leader>Kf
            " \ :call cheat#frameworks#cycle(1)<CR>
" vnoremap <script> <silent> <leader>Kf
            " \ :call cheat#frameworks#cycle(1)<CR>
" nnoremap <script> <silent> <leader>KF
            " \ :call cheat#frameworks#cycle(-1)<CR>
" vnoremap <script> <silent> <leader>KF
            " \ :call cheat#frameworks#cycle(-1)<CR>
" nnoremap <script> <silent> <leader>Kt
            " \ :call cheat#frameworks#cycle(0)<CR>
" vnoremap <script> <silent> <leader>Kt
            " \ :call cheat#frameworks#cycle(0)<CR>
" nnoremap <script> <silent> <leader>KT
            " \ :call cheat#frameworks#autodetect(1)<CR>
" vnoremap <script> <silent> <leader>KT
            " \ :call cheat#frameworks#autodetect(1)<CR>






