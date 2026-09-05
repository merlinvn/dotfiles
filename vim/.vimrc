" =============================================================================
" Minimal modern Vim config — zero external plugins
" =============================================================================
"
" Philosophy:
"   - Prefer native Vim features.
"   - Keep mappings predictable and easy to remember.
"   - Use external CLI tools only where they materially improve Vim.
"   - No plugin manager and no external Vim plugins.
"
" Recommended external tools:
"   git
"   rg
"   fd
"
" =============================================================================


" =============================================================================
" 1. Leaders
" =============================================================================

let mapleader = " "
let maplocalleader = "\\"


" =============================================================================
" 2. General
" =============================================================================

set encoding=utf-8

" Allow switching away from modified buffers without forcing an immediate write.
set hidden

" Ask before discarding unsaved changes where possible.
set confirm

" Reload externally modified files when safe.
set autoread

" Faster CursorHold and general responsiveness.
set updatetime=300

" Faster terminal key-code recognition without making mappings too eager.
set ttimeout
set ttimeoutlen=50
set timeout
set timeoutlen=500


" =============================================================================
" 3. Filetypes, syntax, built-in packages
" =============================================================================

filetype plugin indent on
syntax enable

" Built-in extended % matching.
packadd! matchit


" =============================================================================
" 4. UI
" =============================================================================

set title

set number
set relativenumber

set cursorline

set nowrap
set scrolloff=8
set sidescrolloff=8

set laststatus=2
set showtabline=1

set showcmd
set wildmenu

if exists("+termguicolors")
  set termguicolors
endif

set background=dark

" Built into modern Vim.
silent! colorscheme habamax

" Compact but useful native statusline.
set statusline=
set statusline+=%F
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=%=
set statusline+=[%{&ff}]
set statusline+=%y
set statusline+=[%p%%/%L]
set statusline+=[%04l:%04v]


" =============================================================================
" 5. Search
" =============================================================================

set ignorecase
set smartcase

set hlsearch
set incsearch

" Clear search highlighting without changing the search register.
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>


" =============================================================================
" 6. Indentation
" =============================================================================

set expandtab

set tabstop=2
set softtabstop=2
set shiftwidth=2

set smartindent
set shiftround

" Backspace behaves naturally in insert mode.
set backspace=indent,eol,start


" =============================================================================
" 7. Files and command-line completion
" =============================================================================

set nobackup
set nowritebackup

" Recursive :find support.
set path+=**

set wildmode=longest:full,full

set wildignore=
set wildignore+=*.docx
set wildignore+=*.jpg
set wildignore+=*.jpeg
set wildignore+=*.png
set wildignore+=*.gif
set wildignore+=*.pdf
set wildignore+=*.pyc
set wildignore+=*.exe
set wildignore+=*.flv
set wildignore+=*.img
set wildignore+=*.xlsx
set wildignore+=*.o
set wildignore+=*.obj
set wildignore+=*.class
set wildignore+=*.DS_Store
set wildignore+=*/.git/*
set wildignore+=*/node_modules/*
set wildignore+=*/__pycache__/*


" =============================================================================
" 8. Persistent undo
" =============================================================================

let s:undo_dir = expand("~/.vim/undo")

if !isdirectory(s:undo_dir)
  call mkdir(s:undo_dir, "p", 0700)
endif

let &undodir = s:undo_dir
set undofile


" =============================================================================
" 9. Splits and windows
" =============================================================================

set splitbelow
set splitright

" Window navigation.
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" Resize windows.
nnoremap <silent> <C-Up>    :resize +2<CR>
nnoremap <silent> <C-Down>  :resize -2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

" Split management.
nnoremap <silent> <leader>-  <C-w>s
nnoremap <silent> <leader>\| <C-w>v
nnoremap <silent> <leader>wd <C-w>c


" =============================================================================
" 10. Movement and editing
" =============================================================================

" Move by visual lines when text is wrapped.
"
" With nowrap this mostly behaves like normal j/k, but remains sensible if
" wrapping is temporarily enabled.
nnoremap <expr> j v:count == 0 ? "gj" : "j"
nnoremap <expr> k v:count == 0 ? "gk" : "k"

xnoremap <expr> j v:count == 0 ? "gj" : "j"
xnoremap <expr> k v:count == 0 ? "gk" : "k"

" Join lines while keeping the cursor close to its previous position.
nnoremap J mzJ`z

" Move lines / selections.
nnoremap <silent> <A-j> :move .+1<CR>==
nnoremap <silent> <A-k> :move .-2<CR>==

xnoremap <silent> <A-j> :move '>+1<CR>gv=gv
xnoremap <silent> <A-k> :move '<-2<CR>gv=gv

" Replacing a visual selection should not overwrite the last yank.
xnoremap p "_dP


" =============================================================================
" 11. Buffers
" =============================================================================

nnoremap <silent> <S-h> :bprevious<CR>
nnoremap <silent> <S-l> :bnext<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

" Alternate buffer.
nnoremap <silent> <leader>bb <C-^>

" Native buffer command with completion.
nnoremap <leader>, :buffer<Space>

" Delete buffers.
nnoremap <silent> <leader>bd :bdelete<CR>
nnoremap <silent> <leader>bD :bdelete!<CR>


" =============================================================================
" 12. Tabs
" =============================================================================

nnoremap <silent> <leader><Tab><Tab> :tabnew<CR>

nnoremap <silent> <leader><Tab>] :tabnext<CR>
nnoremap <silent> ]<Tab> :tabnext<CR>

nnoremap <silent> <leader><Tab>[ :tabprevious<CR>
nnoremap <silent> [<Tab> :tabprevious<CR>

nnoremap <silent> <leader><Tab>d :tabclose<CR>
nnoremap <silent> <leader><Tab>f :tabfirst<CR>
nnoremap <silent> <leader><Tab>l :tablast<CR>


" =============================================================================
" 13. Save / quit
" =============================================================================

nnoremap <silent> <leader>qq :qa<CR>

nnoremap <silent> <C-s> <Cmd>write<CR>
inoremap <silent> <C-s> <Cmd>write<CR>
xnoremap <silent> <C-s> <Cmd>write<CR>
snoremap <silent> <C-s> <Cmd>write<CR>


" =============================================================================
" 14. Spell / UI toggles
" =============================================================================

nnoremap <silent> <leader>us :setlocal spell!<CR>
nnoremap <silent> <leader>uw :setlocal wrap!<CR>
nnoremap <silent> <leader>un :setlocal number!<CR>

set nospell
set spelllang=en_us


" =============================================================================
" 15. Native completion
" =============================================================================

set completeopt=menu,menuone,noinsert

" Vim already provides:
"
"   <C-x><C-f>   file names
"   <C-x><C-i>   included files
"   <C-x><C-l>   whole lines
"   <C-x><C-n>   current buffer keywords
"   <C-x><C-o>   omnifunc
"
" Keep the native keys instead of mapping comma-prefixed insert mappings.
" Mapping ',' in insert mode can introduce an unwanted timeout when typing ','.


" =============================================================================
" 16. Native project search with ripgrep
" =============================================================================

if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat=%f:%l:%c:%m

  " Start project grep.
  nnoremap <leader>sg :silent\ grep!<Space>

  " Quickfix navigation.
  nnoremap <silent> [q :cprevious<CR>
  nnoremap <silent> ]q :cnext<CR>

  nnoremap <silent> <leader>xo :copen<CR>
  nnoremap <silent> <leader>xc :cclose<CR>
endif


" =============================================================================
" 17. Native file finding
" =============================================================================

" :find uses 'path', which includes ** above.
nnoremap <leader><Space> :find<Space>


" =============================================================================
" 18. Netrw explorer
" =============================================================================

" Open directory browser.
nnoremap <silent> <leader>e :Lexplore<CR>
nnoremap <silent> <leader>o :Explore<CR>

" Open selected files in the previous window.
let g:netrw_browse_split = 4

" Do not silently change Vim's cwd while browsing.
let g:netrw_keepdir = 1

" Prefer vertical splitting.
let g:netrw_altv = 1

" Cleaner UI.
let g:netrw_banner = 0

" Tree-like listing.
let g:netrw_liststyle = 3

" Explorer width as percentage.
let g:netrw_winsize = 20


" =============================================================================
" 19. Config editing / reload
" =============================================================================

nnoremap <silent> <leader>ve :edit $MYVIMRC<CR>

nnoremap <silent> <leader>vr :write<CR>:source $MYVIMRC<CR>:echo "vimrc reloaded"<CR>


" =============================================================================
" 20. Substitute selected text
" =============================================================================

" Visually select text, then <leader>sr to prepare a global substitution.
xnoremap <leader>sr "hy:%s/<C-r>h//g<Left><Left>


" =============================================================================
" 21. Safe command-line abbreviations
" =============================================================================
"
" Only expand when the whole Ex command matches, rather than replacing these
" words inside larger commands.

cnoreabbrev <expr> Q
      \ getcmdtype() ==# ":" && getcmdline() ==# "Q" ? "q" : "Q"

cnoreabbrev <expr> Q1
      \ getcmdtype() ==# ":" && getcmdline() ==# "Q1" ? "q!" : "Q1"

cnoreabbrev <expr> q1
      \ getcmdtype() ==# ":" && getcmdline() ==# "q1" ? "q!" : "q1"

cnoreabbrev <expr> Qa
      \ getcmdtype() ==# ":" && getcmdline() ==# "Qa" ? "qa" : "Qa"

cnoreabbrev <expr> Qa1
      \ getcmdtype() ==# ":" && getcmdline() ==# "Qa1" ? "qa!" : "Qa1"

cnoreabbrev <expr> W
      \ getcmdtype() ==# ":" && getcmdline() ==# "W" ? "w" : "W"

cnoreabbrev <expr> Wq
      \ getcmdtype() ==# ":" && getcmdline() ==# "Wq" ? "wq" : "Wq"

cnoreabbrev <expr> WQ
      \ getcmdtype() ==# ":" && getcmdline() ==# "WQ" ? "wq" : "WQ"


" =============================================================================
" 22. Autocommands
" =============================================================================

augroup vimrc
  autocmd!

  " Hide cursorline while typing.
  autocmd InsertEnter * setlocal nocursorline
  autocmd InsertLeave * setlocal cursorline

  " Return to the previous cursor position when reopening a file.
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute "normal! g`\"" |
        \ endif

  " Close common utility windows with q.
  autocmd FileType help,qf,man
        \ nnoremap <silent><buffer> q :close<CR>

  " Trim trailing whitespace and trailing empty lines before saving source files.
  "
  " winsaveview()/winrestview() prevents the cleanup from moving the cursor.
  autocmd BufWritePre *.c,*.cpp,*.h,*.hpp,*.rs,*.py,*.js,*.ts,*.sh,*.vim,.vimrc
        \ let s:view = winsaveview() |
        \ keeppatterns %s/\s\+$//e |
        \ keeppatterns %s/\n\+\%$//e |
        \ call winrestview(s:view)

augroup END
