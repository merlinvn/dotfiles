" ========= Plugin Section ===============
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

Plug 'easymotion/vim-easymotion'

" highlight yanked text for 1 second
Plug 'machakann/vim-highlightedyank'

" quick add, delete, change surround
Plug 'tpope/vim-surround'

" NerdCommenter
" https://github.com/preservim/nerdcommenter
" <Leader>cc comment
" <Leader>cu uncomment
" <Leader>ci toggle
Plug 'preservim/nerdcommenter'

" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'rust-lang/rust.vim'
" Plug 'tweekmonster/gofmt.vim'

" Plug 'cespare/vim-toml'

" Cheat Sheet
" Plug 'dbeniamine/cheat.sh-vim'



" Initialize plugin system
call plug#end()

" Gruvbox settings
colorscheme gruvbox
highlight Normal guibg=NONE
set background=dark

" cheat.sh settings
let g:CheatSheetDoNotMap=1

" NERDCommenter settings
let g:NERDSpaceDelims = 1

" set path for gofmt
let g:gofmt_exe='/usr/local/go/bin/gofmt'


" ======== End Plugin Section =============

" ======== Remap Section =================

" n: normal mode
" nore: no-recursive
" map
" ==> nnormap

" change Leader from '\' to '\s'
let mapleader=" "


" ps Project wide Search


nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vims configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

" Split windows navigations
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>


" move lines up down
execute "set <M-k>=\ek"
execute "set <M-j>=\ej"

nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" buffers navigation
nnoremap <Leader>bd :bd<CR>

" tab navigation
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>


" ======= End Remap Section ===============
"
" ======= Hook Section ====================
fun! TrimWhitespaces()
  let l:save = winsaveview()
  keeppattern %s/\s\+$//e
  call winrestview(l:save)
endfun


augroup MERLINVN
  autocmd!
  autocmd BufWritePre * :call TrimWhitespaces()
augroup END

" ======= End Hook Section ================

