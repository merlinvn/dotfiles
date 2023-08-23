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
"{{ The Basics }}
  Plug 'gmarik/Vundle.vim'                           " Vundle
  Plug 'itchyny/lightline.vim'                       " Lightline statusbar

"{{ File management }}
  Plug 'vifm/vifm.vim'                               " Vifm
  Plug 'scrooloose/nerdtree'                         " Nerdtree
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
  Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree

"{{ Productivity }}
  Plug 'easymotion/vim-easymotion' " easy moving around
  Plug 'machakann/vim-highlightedyank'    " highlight yanked text for 1 second

"{{ Tim Pope Plugins }}
  Plug 'tpope/vim-surround'                          " Change surrounding marks
  Plug 'tpope/vim-repeat'                          " Change surrounding marks

"{{ Syntax Highlighting and Colors }}
  Plug 'gruvbox-community/gruvbox'
  Plug 'vim-python/python-syntax' " Python highlighting
  Plug 'ap/vim-css-color' " Color previews for CSS

"{{ Junegunn Choi Plugins }}
  Plug 'junegunn/limelight.vim' " Hyperfocus on a range
  "Plug 'junegunn/vim-emoji'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-peekaboo'

"{{ UI }}"
  Plug 'liuchengxu/vim-which-key'

"{{ Coding }}
" NerdCommenter
" https://github.com/preservim/nerdcommenter
  Plug 'preservim/nerdcommenter'

call plug#end()

" }}} End Plugin Section =============

" {{{ Basic Settings Section
set nocompatible
filetype off
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" hange cursor shape on different mode
if exists($TMUX)
    " Vertical bar in insert mode
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    " Block in normal mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    " Underline in replace mode
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
    " Vertical bar in insert mode
    let &t_SI = "\e[5 q"
    " Block in normal mode
    let &t_SR = "\e[4 q"
    " Underline in replace mode
    let &t_EI = "\e[1 q"
endif

set ttimeout
set ttimeoutlen=100
set timeoutlen=500

" fold method: marker
set fdm=marker

set relativenumber
set nohlsearch

set hidden

set noerrorbells
set vb t_vb=

set expandtab
set smarttab
set tabstop=2 softtabstop=2
set shiftwidth=2
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

" {{{ Keymaps Section =================

" n: normal mode
" i: insert mode
" v: visual mode
" nore: no-recursive
" map
" ==> nnormap

" change Leader from '\' to '\s'
nnoremap <SPACE> <Nop>
let g:mapleader="\<Space>"
let g:maplocalleader = ','

nnoremap Q <nop>

" remap save key
nnoremap <silent> <C-s> :up<CR>
inoremap <silent> <C-s> <Esc>:up<CR>

" remap close key
nnoremap <silent> <Leader>qq :qa<CR>
nnoremap <silent> <C-q> :q<CR>

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vims configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

" move lines up down
nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

" buffers navigation
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bb :e #<CR>
nnoremap <Leader>` :e #<CR>

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

if !exists('g:lasttab')
  let g:lasttab = 1
endif

au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <leader><tab> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <leader><tab> :exe "tabn ".g:lasttab<cr>

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
"noremap <expr> k (v:count > 5 ? 'm' . v:count : '') . 'k'
"noremap <expr> j (v:count > 5 ? 'm' . v:count : '') . 'j'

" better p
noremap ,p "0p
noremap ,P "0p

" paste from clipboard
noremap <C-p> "+p
vnoremap <C-p> "+p
inoremap <C-p> <esc>"+pa

" copy whole text in file
"noremap yz :%y+<CR>

nnoremap <C-y> "+y
vnoremap <C-y> "+y

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
"map <Leader>th <C-w>t<C-w>H
"map <Leader>tk <C-w>t<C-w>K

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

" {{{2 colors themes
autocmd vimenter * nested colorscheme gruvbox

highlight Normal guibg=NONE
set background=dark

"highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
"highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
"highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
"highlight Statement        ctermfg=2    ctermbg=none    cterm=none
"highlight Directory        ctermfg=4    ctermbg=none    cterm=none
"highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
"highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
"highlight NERDTreeClosable ctermfg=2
"highlight NERDTreeOpenable ctermfg=8
"highlight Comment          ctermfg=4    ctermbg=none    cterm=italic
"highlight Constant         ctermfg=12   ctermbg=none    cterm=none
"highlight Special          ctermfg=4    ctermbg=none    cterm=none
"highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
"highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
"highlight String           ctermfg=12   ctermbg=none    cterm=none
"highlight Number           ctermfg=1    ctermbg=none    cterm=none
"highlight Function         ctermfg=1    ctermbg=none    cterm=none
" highlight WildMenu         ctermfg=0       ctermbg=80      cterm=none
" " highlight Folded           ctermfg=103     ctermbg=234     cterm=none
" " highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none
" " highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none
" " highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none
" " highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none
" " highlight DiffText         ctermfg=0       ctermbg=80      cterm=none
" " highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none
" " highlight Conceal          ctermfg=251     ctermbg=none    cterm=none
" " highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline
" " highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline
" " highlight SpellRare        ctermfg=121     ctermbg=none    cterm=underline
" " highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline
" " highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none
" " highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none
" " highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none
" " highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none
" " highlight TabLine          ctermfg=244     ctermbg=234     cterm=none
" " highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none
" " highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none
" " highlight CursorColumn     ctermfg=none    ctermbg=236     cterm=none
" " highlight CursorLine       ctermfg=none    ctermbg=236     cterm=none
" " highlight ColorColumn      ctermfg=none    ctermbg=236     cterm=none
" " highlight Cursor           ctermfg=0       ctermbg=5       cterm=none
" " highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none
" " highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none

" }}}
" set path for gofmt
let g:gofmt_exe='/usr/local/go/bin/gofmt'

" {{{2 The lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'darcula',
  \ }

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode
"}}}

" {{{2 Vifm
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>vx :SplitVifm<CR>
map <Leader>vd :DiffVifm<CR>
map <Leader>vt :TabVifm<CR>
" }}}

"{{{2 NERDTree
"" Uncomment to autostart the NERDTree
"" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
map <Leader>tt :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38
"}}}

" {{{2 nerdcommenter
let g:NERDCreateDefaultMappings = 0
nnoremap gcc :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap gc :call nerdcommenter#Comment(0,"toggle")<CR>

" }}}

" {{{2 easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
map f <Plug>(easymotion-bd-f)
map t <Plug>(easymotion-bd-t)
"nmap f <Plug>(easymotion-overwin-f2)
nmap s <Plug>(easymotion-overwin-f2)

"}}}

" {{{2 Vim highlightedyank
let g:highlightedyank_highlight_duration = 750
"}}}

" {{{2 fzf
" files / find
nnoremap <Leader><SPACE> :Buffers<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>e :Files<CR>
nnoremap <Leader>fp :GFiles<CR>
nnoremap <Leader>p :GFiles<CR>

" search
nnoremap <Leader>sc :Commands<CR>
nnoremap <Leader>sg :Rg<CR>
nnoremap <Leader>sh :Helptags<CR>
nnoremap <Leader>sj :Jumps<CR>
nnoremap <Leader>sk :Maps<CR>
nnoremap <Leader>sm :Marks<CR>
nnoremap <Leader>s/ :BLines<CR>
nnoremap <Leader>/ :BLines<CR>

" }}}

" {{{2 vim-which-key
" Map leader to which_key
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
set timeoutlen=500

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

let g:which_key_map['p'] = 'Project files'


let g:which_key_map['b'] = {
      \'name': '+buffers',
      \'b': 'Other buffers',
      \'d':  'Close'
      \}

"let g:which_key_map['h'] = 'win-left'
"let g:which_key_map['j'] = 'win-down'
"let g:which_key_map['k'] = 'win-up'
"let g:which_key_map['l'] = 'win-right'

let g:which_key_map['q'] = {
      \'name': '+quit',
      \'q': 'Quit All',
      \}

let g:which_key_map['f'] = {
      \'name': '+finds',
      \'f':  'Files',
      \'p':  'Git / Project Files',
      \}

let g:which_key_map['t'] = {
      \'name': '+tree',
      \'t':  'Toggle Tree',
      \}

let g:which_key_map['s'] = {
      \'name': '+search',
      \'/':  'Search in buffer',
      \'c':  'Commands',
      \'g':  'Grep',
      \'k':  'Normal Keymaps',
      \}
let g:which_key_map['v'] = {
      \'name': '+vim',
      \'e': 'Edit .vimrc',
      \'r': 'Reload .vimrc',
      \}

call which_key#register('<Space>', "g:which_key_map")
"}}}

" }}}

