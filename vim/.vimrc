" Set Leader Key
let mapleader = " "
" Options
set nospell
set spelllang=en_us
set title
set keywordprg=:help
syntax on
set nobackup
set cursorline
set number
set relativenumber
set ignorecase
set smartcase
set hlsearch
set incsearch
set nowrap
set fileencoding=utf-8
set showtabline=1
set laststatus=2
set statusline=%F%m%r%h%w%=[%{&ff}]%y[%p%%/%L][%04l:%04v]
set expandtab
set smarttab
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set scrolloff=8
set sidescrolloff=8
set guifont=monospace:h17
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set splitbelow
set splitright
set termguicolors
set background=dark

set nocompatible
set path+=**
set wildmenu

filetype plugin on
colorscheme habamax

" Undo Settings
set undodir=~/.vim/undo
set undofile

" Key Mappings
nnoremap j gj
nnoremap k gk

" better Ctrl-C
nnoremap <C-C> <esc>

" better join
nnoremap J mzJ`z

" Tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tx :tabclose<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<CR>

" Splits & Windows
nnoremap <leader>w <C-w>
nnoremap <C-q> :close<CR>

" Split Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Split Resize
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-

" Buffer Navigation
"nnoremap <leader>bb :ls<CR>:b<Space>
nnoremap <leader>bb :b<Space><C-d>
nnoremap <leader><leader> :b<Space><C-d>
nnoremap <leader>a  :b#<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bd!<CR>

" Clipboard
vnoremap <C-p> "+gP
nnoremap <C-p> "+p
nnoremap <C-y> "+y
vnoremap <leader>dx "+x
xmap p "_dP
vnoremap <leader>dd "_d

" Align
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Quit
nnoremap <leader>qw :wq<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>q! :q!<CR>
nnoremap <leader>q1 :q!<CR>
nnoremap <leader>qq :qa<CR>
nnoremap <M-q> :q<CR>

" Save File
inoremap <C-s> <cmd>w<CR><Esc>
xnoremap <C-s> <cmd>w<CR><Esc>
nnoremap <C-s> <cmd>w<CR><Esc>
snoremap <C-s> <cmd>w<CR><Esc>

" Abbreviations
cnoreabbrev Q q
cnoreabbrev q1 q!
cnoreabbrev Q1 q!
cnoreabbrev Qa1 qa!
cnoreabbrev Qa qa
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Set set
cnoreabbrev SEt set
cnoreabbrev SET set

" Misc
vnoremap <leader>sr "hy:%s/<C-r>h//g<left><left>
nnoremap <leader>os :setlocal spell! spelllang=en_us<CR>

nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vr :w<CR>:source %<CR>

" AutoCOMMANDS
" augroup highlight_yank
"   autocmd!
"   autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='ErrorMsg', timeout=300 }
" augroup END

" Mode based Cursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

" change cursor for different mod
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Format Trailing on save
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

" FileBrowser
nnoremap <leader>p :find<space>
nnoremap <leader>e :Lex<CR>
nnoremap <leader>o :Explore<CR>
let g:netrw_browse_split=4
let g:netrw_keepdir=0
let g:netrw_altv=1
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=15
let g:netrw_list_hide=netrw_gitignore#Hide()

" Completion
set omnifunc=syntaxcomplete#Complete
set complete+=k
set completeopt=menu,menuone,noinsert

" file names
inoremap <silent> ,f <C-x><C-f>
" tags
inoremap <silent> ,i <C-x><C-i>
" whole line
inoremap <silent> ,l <C-x><C-l>
" keywords in current file
inoremap <silent> ,n <C-x><C-n>
" omni completion
inoremap <silent> ,o <C-x><C-o>
" keyword in thesaurus
"inoremap <silent> ,t <C-x><C-]>
"inoremap <silent> ,u <C-x><C-u>

" Automatically Pair brackets, parentheses, and quotes
" "inoremap ' ''<left>
" "inoremap " ""<left>
" "inoremap ( ()<left>
" "inoremap [ []<left>
" "inoremap { {}<left>
" "inoremap {; {};<left><left>
" "inoremap /* /**/<left><left>
