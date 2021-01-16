" ========= Plugin Section ===============

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'rust-lang/rust.vim'
"Plug 'tweekmonster/gofmt.vim'

" Cheat Sheet
Plug 'dbeniamine/cheat.sh-vim'

" Initialize plugin system
call plug#end()

" Gruvbox settings
colorscheme gruvbox
highlight Normal guibg=NONE
set background=dark

let g:CheatSheetDoNotMap=1

" ======== End Plugin Section =============

" ======== Remap Section =================

" n: normal mode
" i: insert mode
" v: visual mode
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
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


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

