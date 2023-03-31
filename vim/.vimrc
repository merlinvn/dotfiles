" {{{ Basic Settings Section

"change gui cursor by mode
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
"                    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
"                    \,sm:block-blinkwait175-blinkoff150-blinkon175

if &term =~ '^xterm'
  " SI = INSERT mode
  " SR = REPLACE mode
  " EI = NORMAL mode (ELSE)
  let &t_SI .= "\<Esc>[6 q"
  let &t_SR .= "\<Esc>[4 q"
  let &t_EI .= "\<Esc>[2 q"
 " 1 or 0 -> blinking block
 " 2 -> solid block
 " 3 -> blinking underscore
 " Recent versions of xterm (282 or above) also support
 " 4-> solid underscore
 " 5 -> blinking vertical bar
 " 6 -> solid vertical bar
  augroup windows_term
    autocmd!
    autocmd VimEnter * silent !echo -ne "\e[1 q"
    autocmd VimLeave * silent !echo -ne "\e[5 q"
  augroup END
endif

set ttimeout
set ttimeoutlen=100
set timeoutlen=750

" fold method: marker
set fdm=marker

set relativenumber
set nohlsearch

set hidden

set noerrorbells
set vb t_vb=

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
autocmd FileType go setlocal expandtab!

set nu
set nowrap
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
"set noshowmode
set signcolumn=yes

" Give more space for displaying messages.
" set cmdheight=2
"
" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=50

" set exrc
" set hidden
" set nobackup
" set nowritebackup
" set secure

" " Don't pass messages to |ins-completion-menu|.
set shortmess+=c
"
set colorcolumn=80

set laststatus=2

set clipboard+=unnamedplus

" for vim wiki
set nocompatible
filetype plugin on
syntax on

set shell=/bin/zsh

set shell=/bin/bash
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    set clipboard=unnamed
  endif
endif

set splitright
set splitbelow
" }}} ======== End of Setting Section =============

" {{{ Plugins Section ===============
" Initialize plugin system

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'

" easy moving around
Plug 'easymotion/vim-easymotion'

" highlight yanked text for 1 second
Plug 'machakann/vim-highlightedyank'

" quick add, delete, change surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" NerdCommenter
" https://github.com/preservim/nerdcommenter
Plug 'preservim/nerdcommenter'

"Plug 'itchyny/lightline.vim'
"Plug 'mhinz/vim-startify'

" Cheat Sheet
"Plug 'dbeniamine/cheat.sh-vim'

" Vim css color
"Plug 'ap/vim-css-color'
"Plug 'chrisbra/Colorizer'

Plug 'liuchengxu/vim-which-key'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

""" Plugin settings
 "colorscheme gruvbox
autocmd vimenter * nested colorscheme gruvbox

highlight Normal guibg=NONE
set background=dark

" set path for gofmt
let g:gofmt_exe='/usr/local/go/bin/gofmt'

" }}} End Plugin Section =============

" {{{ Keymaps Section =================

" n: normal mode
" i: insert mode
" v: visual mode
" nore: no-recursive
" map
" ==> nnormap

" change Leader from '\' to '\s'
nnoremap <SPACE> <Nop>
let mapleader=" "

" remap save key
nnoremap <silent> <C-s> :up<CR>
inoremap <silent> <C-s> <Esc>:up<CR>

" remap close key
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <C-q> :q<CR>

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vims configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

" move lines up down
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

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

" Yank from the current cursor to the end of line
noremap Y y$

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap [ [<c-g>u
inoremap ? ?<c-g>u

" Go to next / previous, center with zz, and zv to open fold
noremap n nzzzv
noremap N Nzzzv

" join and stay in the same line
noremap J mzJ`z

" jump list mutation
noremap <expr> k (v:count > 5 ? 'm' . v:count : '') . 'k'
noremap <expr> j (v:count > 5 ? 'm' . v:count : '') . 'j'

" better p
noremap ,p "0p
noremap ,P "0p

" paste from clipboard
noremap <C-p> "+p
vnoremap <C-p> "+p
inoremap <C-p> "+p
noremap <Leader>p "+p
vnoremap <Leader>p "+p
inoremap <leader>p "+p


" copy whole text in file
"noremap yz :%y+<CR>

" greatest remap ever
"xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
nnoremap <C-y> "+y
vnoremap <leader>y "+y
vnoremap <C-y> "+y
nmap <leader>Y "+Y

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" }}} End Remap Section ===============

" {{{ Autocommand Section ====================
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


" Clear cmd line message
function! s:empty_message(timer)
  if mode() ==# 'n'
    echon ''
  endif
endfunction

" augroup cmd_msg_cls
"   autocmd!
"   autocmd CmdlineLeave :  call timer_start(3000, funcref('s:empty_message'))
" augroup END
"
" }}} End Hook Section ================

" {{{1 Plugin settings Section
" {{{2 nerdcommenter
let g:NERDCreateDefaultMappings = 0
nnoremap gcc :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap gc :call nerdcommenter#Comment(0,"toggle")<CR>

" }}}

" {{{2 fzf
nnoremap <Leader><Leader> :Buffers<CR>
nnoremap <Leader>e :Files<CR>
nnoremap <Leader>tg :Rg<CR>
nnoremap <Leader>tp :GFiles<CR>
nnoremap <Leader>t/ :BLines<CR>
nnoremap <Leader>tk :Maps<CR>
nnoremap <Leader>tc :Commands<CR>

" }}}

" {{{2 easymotion
let g:EasyMotion_smartcase = 1
map f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f2)
nmap s <Plug>(easymotion-overwin-f2)

"}}}

" {{{2 Vim highlightedyank
let g:highlightedyank_highlight_duration = 500
"}}}

" {{{2 vim-which-key
" Map leader to which_key
nnoremap <silent> <leader> :<c-u> WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u> WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
set timeoutlen=750

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

"let g:which_key_use_floating_win = 0

" Hide status line
"autocmd! FileType which_key
"autocmd  FileType which_key set laststatus=0 noshowmode noruler
  "\| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


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

let g:which_key_map['d'] = 'delete to _'
let g:which_key_map['e'] = 'Files'
let g:which_key_map['q'] = 'Close'

let g:which_key_map['y'] = 'yank to +'
let g:which_key_map['Y'] = 'yank to +'
let g:which_key_map['p'] = 'paste from +'
let g:which_key_map['P'] = 'paste from +'


let g:which_key_map['b'] = {
      \'name': '+buffers',
      \'d':  'Close'
      \}

let g:which_key_map['h'] = 'win-left'
let g:which_key_map['j'] = 'win-down'
let g:which_key_map['k'] = 'win-up'
let g:which_key_map['l'] = 'win-right'

let g:which_key_map['t'] = {
      \'name': '+finds',
      \'/':  'Search in buffer',
      \'c':  'Commands',
      \'g':  'Grep',
      \'k':  'Normal Keymaps',
      \'p':  'Git / Project Files',
      \}

let g:which_key_map['v'] = {
      \'name': '+vim',
      \'e': 'Edit .vimrc',
      \'r': 'Reload .vimrc',
      \}

call which_key#register('<Space>', "g:which_key_map")

"}}}

" }}}
