" Map leader to which_key
nnoremap <silent> <leader> :<c-u> WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u> WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
set timeoutlen=750


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['0'] = 'last tab'
let g:which_key_map['1'] = 'tab 1'
let g:which_key_map['2'] = 'tab 2'
let g:which_key_map['3'] = 'tab 3'
let g:which_key_map['4'] = 'tab 4'
let g:which_key_map['5'] = 'tab 5'
let g:which_key_map['6'] = 'tab 6'
let g:which_key_map['7'] = 'tab 7'
let g:which_key_map['8'] = 'tab 8'
let g:which_key_map['9'] = 'tab 9'

let g:which_key_map['='] = 'code format'
let g:which_key_map['s'] = 'save'

let g:which_key_map['h'] = 'win-left'
let g:which_key_map['j'] = 'win-down'
let g:which_key_map['k'] = 'win-up'
let g:which_key_map['l'] = 'win-right'

let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment-toggle' ]

let g:which_key_map['q'] = 'quit'

let g:which_key_map['p'] = {
  \  'name' : '+telescope',
  \ 'f': 'files',
  \ 'g': 'live grep',
  \ 'w': 'search word at currsor',
  \ 's': 'search input word',
  \ 'd': 'dot files',
  \ 'h': 'help tags',
  \ 'c': 'git branch',
  \ 'b': 'buffers'
  \}

let g:which_key_map['v'] = {
  \  'name' : '+vim',
  \ 'e': 'edit .vimrc',
  \ 'r': 'source .vimrc',
  \ 'd': 'dot files',
  \ 'h': 'help tags',
  \}

let g:which_key_map['`'] = {
  \ 'name' : '+wiki' ,
  \ 'd' : 'diary',
  \ 's' : 'export all to HTML',
  \ 't' : 'open index in new tab',
  \ 'w' : 'open wiki index',
  \ ' ' :  {
    \ 'name' : '+diary',
    \ 'i' : 'diary generate links',
    \ 't' : 'make diary in new tab',
    \ 'y' : 'make yesterday diary',
    \ 'm' : 'make tomorrow diary',
    \ 'w' : 'make today diary',
    \ },
  \}

let g:which_key_map[' '] = {
  \ 'name' : '+easymotion' ,
  \}

let g:which_key_map['b'] = {
  \ 'name' : '+buffer' ,
  \ 'd' : ['bd', 'delete'],
  \ 'n' : ['bnext'     , 'next-buffer'],
  \ 'p' : ['bprevious' , 'previous-buffer'],
  \ 's' : 'search-buffer'
  \}

let g:which_key_map['K'] = {
  \ 'name' : '+cheat-sheet' ,
  \}

let g:which_key_map['c'] = {
  \ 'name' : '+code',
  \ 'c' : 'comment',
  \ 'u' : 'uncomment',
  \ '/' : 'toggle-comment',
  \ 'f' : 'formatting',
  \ '.' : 'code-action',
  \ 'r' : 'reference',
  \ 'e' : 'rename',
  \ 'i' : 'incomming-calls',
  \ 'o' : 'outgoing-calls',
  \ 'h' : 'signature-help',
  \ 's' : 'document-symbol',
  \ 'S' : 'workspace-symbol',
  \ 'n' : 'next-diagnostic',
  \ 'p' : 'prev-diagnostic',
  \ 'l' : 'line-diagnostic',
  \ 'k' : 'buf-hover',
  \ 'g' : {
    \ 'name': '+goto',
    \ 'd' : 'definition'      ,
    \ 'D' : 'declaration'      ,
    \ 't' : 'type-definition' ,
    \ 'i' : 'implementation'  ,
    \ },
  \}
let g:which_key_map['w'] = {
  \ 'name' : '+windows' ,
  \ 'w' : ['<C-W>w'     , 'other-window']          ,
  \ 'd' : ['<C-W>c'     , 'delete-window']         ,
  \ '-' : ['<C-W>s'     , 'split-window-below']    ,
  \ '|' : ['<C-W>v'     , 'split-window-right']    ,
  \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
  \ 'h' : ['<C-W>h'     , 'window-left']           ,
  \ 'j' : ['<C-W>j'     , 'window-below']          ,
  \ 'l' : ['<C-W>l'     , 'window-right']          ,
  \ 'k' : ['<C-W>k'     , 'window-up']             ,
  \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
  \ 'J' : [':resize +5'  , 'expand-window-below']   ,
  \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
  \ 'K' : [':resize -5'  , 'expand-window-up']      ,
  \ '=' : ['<C-W>='     , 'balance-window']        ,
  \ 's' : ['<C-W>s'     , 'split-window-below']    ,
  \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
  \ }

" \ '?' : ['Windows'    , 'fzf-window']            ,

" " Register which key map
call which_key#register('<Space>', "g:which_key_map")
