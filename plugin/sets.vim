"change gui cursor by mode
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
"                    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
"                    \,sm:block-blinkwait175-blinkoff150-blinkon175

" if &term =~ '^xterm'
"   " SI = INSERT mode
"   " SR = REPLACE mode
"   " EI = NORMAL mode (ELSE)
"   let &t_SI .= "\<Esc>[6 q"
"   let &t_SR .= "\<Esc>[4 q"
"   let &t_EI .= "\<Esc>[2 q"
"  " 1 or 0 -> blinking block
"  " 2 -> solid block
"  " 3 -> blinking underscore
"  " Recent versions of xterm (282 or above) also support
"  " 4-> solid underscore
"  " 5 -> blinking vertical bar
"  " 6 -> solid vertical bar
"   augroup windows_term
"     autocmd!
"     autocmd VimEnter * silent !echo -ne "\e[1 q"
"     autocmd VimLeave * silent !echo -ne "\e[5 q"
"   augroup END
" endif

"set ttimeout
"set ttimeoutlen=1
"set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
"set ttyfast

set relativenumber
set nohlsearch

set hidden

set noerrorbells

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set nu
set nowrap
set noswapfile
set nobackup
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
"
" " Don't pass messages to |ins-completion-menu|.
set shortmess+=c
"
set colorcolumn=80
