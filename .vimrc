" ========= Plugin Section ===============

" install vimplug if not exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'





" Initialize plugin system
call plug#end()

" Gruvbox settings
colorscheme gruvbox
highlight Normal guibg=NONE
set background=dark

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

