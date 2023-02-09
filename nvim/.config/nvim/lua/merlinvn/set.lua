vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "K", "5gk")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

if vim.fn.has("mac") == 1 then
  vim.opt.shell = "/bin/zsh"
end

local indent, width = 2, 80

vim.opt.belloff = 'all'
vim.opt.errorbells = false

-- vim.opt.guicursor = ""
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

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'


--- Neovide setting
-- vim.o.guifont = "JetbrainsMono Nerd Font:h11"
-- vim.g.neovide_scale_factor = 1.0
-- local change_scale_factor = function(delta)
--   vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
-- end
-- vim.keymap.set("n", "<C-=>", function()
--   change_scale_factor(1.25)
-- end)
-- vim.keymap.set("n", "<C-->", function()
--   change_scale_factor(1 / 1.25)
-- end)


-- winbar
vim.o.winbar = "%=%m %f"
