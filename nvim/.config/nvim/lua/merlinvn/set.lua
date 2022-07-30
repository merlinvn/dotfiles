vim.g.isColemakDH = true
vim.g.mapleader = " "

if vim.fn.has("mac") == 1 then
  vim.opt.shell = "/bin/zsh"
end

local indent, width = 2, 80

-- local USER = vim.fn.expand('$USER')

-- local undo_path
-- if vim.fn.has("mac") == 1 then
--   undo_path = "/Users/" .. USER .. "/.vim/undodir"
-- elseif vim.fn.has("unix") == 1 then
--   undo_path = "/home/" .. USER .. "/.vim/undodir"
-- elseif vim.fn.has('win32') == 1 then
--   undo_path = ""
-- else
--   print("Unsupported system for undo_path")
-- end
--

vim.opt.belloff = 'all'
vim.opt.errorbells = false

-- vim.opt.guicursor = ""

vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' } -- Completion options

vim.opt.cursorline = true -- Highlight cursor line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end

set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers

vim.opt.tabstop = indent -- Number of spaces tabs count for
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent
vim.opt.expandtab = true -- Use spaces instaed of tabs
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.wrap = false -- Disable line wrap

vim.opt.swapfile = false
vim.opt.backup = false
-- combine with var undo_path above if needed
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.formatoptions = 'crqnj' -- Automatic formatting options
vim.opt.hidden = true -- Enable background buffers
vim.opt.hlsearch = false -- turn off hightlight for searched text
vim.opt.ignorecase = true -- Ignore case
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8 -- Lines of context
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current

vim.opt.joinspaces = false -- No double spaces with join
vim.opt.laststatus = 2 -- last windows will always have status line
vim.opt.list = true -- Show some invisible characters
vim.opt.pastetoggle = '<F2>' -- Paste mode
vim.opt.pumheight = 12 -- Max height of popup menu

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = indent -- Size of an indent
vim.opt.shortmess = 'atToOFc' -- Prompt message options
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.signcolumn = 'yes' -- Show sign column
vim.opt.smartcase = true -- Do not ignore case with capitals

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 100 -- Delay before swap file is saved
vim.opt.wildmode = { 'list', 'longest' } -- Command-line completion mode
vim.opt.writebackup = false

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.opt.colorcolumn = tostring(width) --Line length marker
