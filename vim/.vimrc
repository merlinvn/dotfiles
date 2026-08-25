" Compatibility
set nocompatible

" Leader
let mapleader = " "

" Encoding
set encoding=utf-8

" UI
syntax on
set title
set number
set relativenumber
set cursorline
set nowrap
set scrolloff=8
set sidescrolloff=8
set termguicolors
set background=dark
set laststatus=2
set showtabline=1
set statusline=%F%m%r%h%w%=[%{&ff}]%y[%p%%/%L][%04l:%04v]

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Indentation
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent

" Files
set nobackup
set path+=**
set wildmenu
set wildmode=longest:full,full
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Splits
set splitbelow
set splitright

" Filetypes
filetype plugin on

" Spell
set nospell
set spelllang=en_us

" Clipboards
set clipboard=unnamedplus

" Terminal
set ttimeout
set ttimeoutlen=100

let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[2 q"

" Completion
set completeopt=menu,menuone,noinsert

inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
inoremap <silent> ,o <C-x><C-o>

" Colors
if !empty(globpath(&runtimepath, "colors/habamax.vim"))
  colorscheme habamax
endif

" Undo
if !isdirectory(expand('~/.vim/undo'))
  call mkdir(expand('~/.vim/undo'), 'p')
endif

set undodir=~/.vim/undo
set undofile

" Better vertical movement
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk
"
" Better join
nnoremap J mzJ`z

" Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows
nnoremap <C-Up>    :resize +2<CR>
nnoremap <C-Down>  :resize -2<CR>
nnoremap <C-Left>  :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Splits
nnoremap <leader>- <C-w>s
nnoremap <leader>\| <C-w>v
nnoremap <leader>wd <C-w>c

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Buffers
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

" Alternate buffer
nnoremap <leader>bb :b#<CR>
" Buffers
nnoremap <leader>, :b<Space><C-d>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bD :bd!<CR>

" Tabs
nnoremap <leader><Tab><Tab> :tabnew<CR>
nnoremap <leader><Tab>] :tabnext<CR>
nnoremap ]<Tab> :tabnext<CR>
nnoremap <leader><Tab>[ :tabprevious<CR>
nnoremap [<Tab> :tabprevious<CR>
nnoremap <leader><Tab>d :tabclose<CR>
nnoremap <leader><Tab>f :tabfirst<CR>
nnoremap <leader><Tab>l :tablast<CR>

" Preserve yank register when pasting over selection
xmap p "_dP

" Quit
nnoremap <leader>qq :qa<CR>
" Toggle spell
nnoremap <leader>us :setlocal spell!<CR>

" Save
nnoremap <C-s> <Cmd>w<CR><Esc>
inoremap <C-s> <Cmd>w<CR><Esc>
xnoremap <C-s> <Cmd>w<CR><Esc>
snoremap <C-s> <Cmd>w<CR><Esc>


" Abbreviations
cnoreabbrev Q q
cnoreabbrev q1 q!
cnoreabbrev Q1 q!
cnoreabbrev Qa1 qa!
cnoreabbrev Qa qa
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq

" Misc
vnoremap <leader>sr "hy:%s/<C-r>h//g<left><left>
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vr :w<CR>:source %<CR>

" File browser
nnoremap <leader><Space> :find<Space>

" Explorer
nnoremap <leader>e :Lex<CR>
nnoremap <leader>o :Explore<CR>

let g:netrw_browse_split=4
let g:netrw_keepdir=0
let g:netrw_altv=1
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=15

" Autocommands
augroup vimrc
  autocmd!

  autocmd InsertEnter * setlocal nocursorline
  autocmd InsertLeave * setlocal cursorline

  autocmd BufWritePre *.c,*.cpp,*.h,*.hpp,*.rs,*.py,*.js,*.ts,*.sh,*.vim,.vimrc %s/\s\+$//e
  autocmd BufWritePre *.c,*.cpp,*.h,*.hpp,*.rs,*.py,*.js,*.ts,*.sh,*.vim,.vimrc %s/\n\+\%$//e
augroup END
