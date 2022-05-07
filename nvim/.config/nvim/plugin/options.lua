-- autocmd FileType go setlocal expandtab!
local opt, wo = vim.opt, vim.wo

local indent, width = 2, 100

local USER = vim.fn.expand('$USER')

local undo_path
if vim.fn.has("mac") == 1 then
  undo_path = '/Users/' .. USER .. '/.vim/undodir'
elseif vim.fn.has("unix") == 1 then
  undo_path = '/home/' .. USER .. '/.vim/undodir'
elseif vim.fn.has('win32') == 1 then
else
  print("Unsupported system for undo_path")
end


opt.backup = false -- combine with nowritebackup to completely turn off backup
opt.belloff = 'all'
-- opt.clipboard:prepend { "unnamedplus" }
opt.colorcolumn = tostring(width) -- Line length marker
opt.completeopt = { 'menuone', 'noinsert', 'noselect' } -- Completion options
opt.cursorline = true -- Highlight cursor line
opt.errorbells = false
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = 'crqnj' -- Automatic formatting options
opt.hidden = true -- Enable background buffers
opt.hlsearch = false -- turn off hightlight for searched text
opt.ignorecase = true -- Ignore case
opt.incsearch = true
opt.joinspaces = false -- No double spaces with join
opt.laststatus = 2 -- last windows will always have status line
opt.list = true -- Show some invisible characters
opt.number = true -- Show line numbers
opt.pastetoggle = '<F2>' -- Paste mode
opt.pumheight = 12 -- Max height of popup menu
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 8 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = indent -- Size of an indent
opt.shortmess = 'atToOFc' -- Prompt message options
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = 'yes' -- Show sign column
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.softtabstop = 2 --
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.swapfile = false -- not using swap file
opt.tabstop = indent -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.textwidth = width -- Maximum width of text
opt.undodir = undo_path
opt.undofile = true
opt.updatetime = 100 -- Delay before swap file is saved
opt.wildmode = { 'list', 'longest' } -- Command-line completion mode
opt.wrap = false -- Disable line wrap
opt.writebackup = false

vim.cmd('filetype plugin on')
vim.cmd('syntax on')
