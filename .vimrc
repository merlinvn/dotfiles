function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" ========= Plugin Section ===============
" Initialize plugin system

if has('nvim')
  " Bootstrap Plug
  let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
  if !filereadable(autoload_plug_path)
    silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
        \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  unlet autoload_plug_path

  call plug#begin(stdpath('data') . '/plugged')
else
  " Install vim-plug if not found
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin('~/.vim/plugged')
endif

Plug 'gruvbox-community/gruvbox'

" easy moving around
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

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'

" for neovim install `pip3 install neovim-remote` to allow floaterm to open
" windows in side neovim
Plug 'voldikss/vim-floaterm'

Plug 'mhinz/vim-startify'

if has('nvim')
  " telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " autocompletion with language server by nvim built-in
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'tjdevries/nlua.nvim'
  Plug 'tjdevries/lsp_extensions.nvim'

  " need to call :TSInstall {language} later
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

else
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'stsewd/fzf-checkout.vim'
endif


" other language enhancements
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'bfrg/vim-cpp-modern'

" Plug 'rust-lang/rust.vim'
" Plug 'tweekmonster/gofmt.vim'

Plug 'cespare/vim-toml'

" Cheat Sheet
Plug 'dbeniamine/cheat.sh-vim'

" Vim Wiki
Plug 'vimwiki/vimwiki'

call plug#end()

""" Plugin settings

" Gruvbox settings
if has('nvim')
  colorscheme gruvbox
else
  if (v:version < 801)
    autocmd vimenter * colorscheme gruvbox
  else
    autocmd vimenter * ++nested colorscheme gruvbox
  endif
  "colorscheme gruvbox
endif

highlight Normal guibg=NONE
set background=dark

" set path for gofmt
let g:gofmt_exe='/usr/local/go/bin/gofmt'

" ======== End Plugin Section =============
"
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
if !has('nvim')
  execute "set <A-k>=\ek"
  execute "set <A-j>=\ej"
endif

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
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

" Per default, netrw leaves unmodified buffers open. This autocommand
" " deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete

" ======= End Hook Section ================

