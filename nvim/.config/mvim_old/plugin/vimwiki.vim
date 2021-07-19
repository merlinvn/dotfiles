
let g:vimwiki_list = [
       \ {
        \         'path': '~/vimwiki/wiki',
        \         'path_html': '~/vimwiki/docs',
        \         'auto_toc': 1},
        \ ]

nmap <F13> <Plug>VimwikiUISelect
nmap <Leader>`s :VimwikiAll2HTML<CR>
nmap <Leader>`d <Plug>VimwikiDiaryIndex
nmap <Leader>`t <Plug>VimwikiTabIndex
nmap <Leader>`w <Plug>VimwikiIndex

nmap <Leader>`<Leader>i <Plug>VimwikiDiaryGenerateLinks

nmap <Leader>`<Leader>t <Plug>VimwikiTabMakeDiaryNote
nmap <Leader>`<Leader>y <Plug>VimwikiMakeYesterdayDiaryNote
nmap <Leader>`<Leader>m <Plug>VimwikiMakeTomorrowDiaryNote
nmap <Leader>`<Leader>w <Plug>VimwikiMakeDiaryNote
