-- ============================================================================
-- Minimal Neovim config: native Neovim + mini.nvim
--
-- Goals:
--   - Keep everything understandable in one file.
--   - Prefer mini.nvim defaults over recreating behavior manually.
--   - Use native Neovim for LSP, diagnostics, formatting, terminal, and autocmds.
--   - Keep LazyVim-like leader namespaces only where they are actually useful.
--
-- Run separately with:
--   NVIM_APPNAME=nvim-mini nvim
--
-- ============================================================================
-- Environment assumptions
-- ============================================================================
--
-- This config targets Neovim 0.12+.
--
-- External tools are expected to be installed outside Neovim and available on
-- $PATH. The preferred tool manager is mise.
--
-- Base tools:
--   git
--   curl
--   rg
--   fd
--
-- Current LSP:
--   lua-language-server
--
-- Optional later:
--   tree-sitter
--   language runtimes
--   formatters / linters
--
-- Neovim intentionally does not manage these through Mason.
--
-- ============================================================================
-- 1. Leaders
-- ============================================================================

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ============================================================================
-- 2. Bootstrap mini.nvim
-- ============================================================================

vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

-- ============================================================================
-- 3. Shared helpers
-- ============================================================================

local map = vim.keymap.set

-- Shared augroup so reloading the config does not duplicate autocmds.
local augroup = vim.api.nvim_create_augroup("MiniVim", { clear = true })

-- Project-like root used by the terminal.
local function root()
  local markers = {
    ".git",
    "pyproject.toml",
    "package.json",
    "Cargo.toml",
    "go.mod",
  }

  local found = vim.fs.find(markers, { upward = true })[1]
  return found and vim.fs.dirname(found) or vim.uv.cwd()
end

-- ============================================================================
-- 4. Basic editor behavior
-- ============================================================================
-- mini.basics supplies sane defaults. Keep overrides intentionally small.

require("mini.basics").setup({
  mappings = {
    windows = true,
    option_toggle_prefix = "<Leader>u",
  },
})

vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- ============================================================================
-- 5. Core UI
-- ============================================================================

require("mini.icons").setup()
require("mini.statusline").setup({ use_icons = true })
require("mini.tabline").setup({ show_icons = true })
require("mini.statuscolumn").setup()

-- ============================================================================
-- 6. Core editing/navigation primitives
-- ============================================================================

require("mini.bracketed").setup()

local mini_bufremove = require("mini.bufremove")
mini_bufremove.setup()

require("mini.ai").setup({ n_lines = 500 })
require("mini.pairs").setup()
require("mini.comment").setup()

require("mini.surround").setup({
  mappings = {
    add = "gsa",
    delete = "gsd",
    find = "gsf",
    find_left = "gsF",
    highlight = "gsh",
    replace = "gsr",
    suffix_last = "l",
    suffix_next = "n",
  },
})

require("mini.move").setup()

-- ============================================================================
-- 7. Files, pickers, notifications
-- ============================================================================

local mini_files = require("mini.files")
mini_files.setup()

local mini_pick = require("mini.pick")
mini_pick.setup()

local mini_extra = require("mini.extra")
mini_extra.setup()

local mini_notify = require("mini.notify")
mini_notify.setup()

require("mini.input").setup()

-- ============================================================================
-- 8. Jumping
-- ============================================================================

require("mini.jump").setup()

local mini_jump2d = require("mini.jump2d")
mini_jump2d.setup({
  view = {
    n_steps_ahead = 1,
  },
})

-- ============================================================================
-- 9. Appearance helpers
-- ============================================================================

local mini_indentscope = require("mini.indentscope")
mini_indentscope.setup({
  draw = {
    animation = mini_indentscope.gen_animation.none(),
  },
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = {
    "help",
    "starter",
    "terminal",
    "qf",
    "minifiles",
    "minipick",
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

local mini_hipatterns = require("mini.hipatterns")
mini_hipatterns.setup({
  highlighters = {
    fixme = {
      pattern = "%f[%w]()FIXME()%f[%W]",
      group = "MiniHipatternsFixme",
    },
    hack = {
      pattern = "%f[%w]()HACK()%f[%W]",
      group = "MiniHipatternsHack",
    },
    todo = {
      pattern = "%f[%w]()TODO()%f[%W]",
      group = "MiniHipatternsTodo",
    },
    note = {
      pattern = "%f[%w]()NOTE()%f[%W]",
      group = "MiniHipatternsNote",
    },
    hex_color = mini_hipatterns.gen_highlighter.hex_color(),
  },
})

require("mini.cursorword").setup()

local mini_trailspace = require("mini.trailspace")
mini_trailspace.setup()

require("mini.hues").setup({
  background = "#101014",
  foreground = "#cdd6f4",
  accent = "azure",
  saturation = "medium",
})

local mini_misc = require("mini.misc")
mini_misc.setup()


-- ============================================================================
-- 10. Key discovery: mini.clue
-- ============================================================================

local mini_clue = require("mini.clue")

mini_clue.setup({
  triggers = {
    { mode = { "n", "x" }, keys = "<Leader>" },
    { mode = "n",          keys = "[" },
    { mode = "n",          keys = "]" },
    { mode = { "x", "o" }, keys = "a" },
    { mode = { "x", "o" }, keys = "i" },
    { mode = { "n", "x" }, keys = "g" },
    { mode = "i",          keys = "<C-x>" },
    { mode = { "n", "x" }, keys = "'" },
    { mode = { "n", "x" }, keys = "`" },
    { mode = { "n", "x" }, keys = '"' },
    { mode = { "i", "c" }, keys = "<C-r>" },
    { mode = "n",          keys = "<C-w>" },
    { mode = { "n", "x" }, keys = "z" },
  },

  clues = {
    mini_clue.gen_clues.square_brackets(),
    mini_clue.gen_clues.g(),
    mini_clue.gen_clues.marks(),
    mini_clue.gen_clues.registers(),
    mini_clue.gen_clues.windows(),
    mini_clue.gen_clues.z(),

    { mode = "n",          keys = "<Leader>n", desc = "+notifications" },
    { mode = "n",          keys = "<Leader>b", desc = "+buffer" },
    { mode = "n",          keys = "<Leader>c", desc = "+code" },
    { mode = "n",          keys = "<Leader>f", desc = "+file/find" },
    { mode = "n",          keys = "<Leader>g", desc = "+git" },
    { mode = "n",          keys = "<Leader>q", desc = "+quit/session" },
    { mode = "n",          keys = "<Leader>s", desc = "+search" },
    { mode = "n",          keys = "<Leader>u", desc = "+ui/toggle" },
    { mode = "n",          keys = "<Leader>w", desc = "+windows" },
    { mode = "n",          keys = "<Leader>x", desc = "+diagnostics" },

    { mode = { "x", "o" }, keys = "aw",        desc = "Around Word" },
    { mode = { "x", "o" }, keys = "iw",        desc = "Inside Word" },
    { mode = { "x", "o" }, keys = 'a"',        desc = "Around Quotes" },
    { mode = { "x", "o" }, keys = 'i"',        desc = "Inside Quotes" },
    { mode = { "x", "o" }, keys = "a(",        desc = "Around Parentheses" },
    { mode = { "x", "o" }, keys = "i(",        desc = "Inside Parentheses" },
  },

  window = {
    delay = 300,
  },
})

-- ============================================================================
-- 11. Diagnostics
-- ============================================================================

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
  },
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})

-- ============================================================================
-- 12. LSP
-- ============================================================================
-- lua-language-server is installed outside Neovim, e.g. through mise.

vim.lsp.config("lua_ls", {
  cmd = {
    "lua-language-server",
  },

  filetypes = {
    "lua",
  },

  root_markers = {
    ".git",
    ".luarc.json",
    ".luarc.jsonc",
  },

  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim",
        },
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    },
  },
})

vim.lsp.enable("lua_ls")

-- ============================================================================
-- 13. Completion and snippets
-- ============================================================================

require("mini.completion").setup({
  lsp_completion = {
    source_func = "completefunc",
    auto_setup = true,
  },
})

require("mini.snippets").setup({
  snippets = {},
})

local mini_keymap = require("mini.keymap")

-- ============================================================================
-- 14. Git
-- ============================================================================

local mini_git = require("mini.git")
mini_git.setup()

-- Keep diff signs/navigation, but disable mutation/textobject mappings.
require("mini.diff").setup({
  mappings = {
    apply = "",
    reset = "",
    textobject = "",
  },
})

-- ============================================================================
-- 15. Sessions and start screen
-- ============================================================================

local mini_sessions = require("mini.sessions")
mini_sessions.setup()

local mini_starter = require("mini.starter")
mini_starter.setup({
  evaluate_single = true,
  items = {
    mini_starter.sections.builtin_actions(),
    mini_starter.sections.recent_files(8, false),
    mini_starter.sections.sessions(5, true),
  },
  content_hooks = {
    mini_starter.gen_hook.adding_bullet("░ "),
    mini_starter.gen_hook.aligning("center", "center"),
  },
})

-- ============================================================================
-- 16. Keymaps: config and sessions
-- ============================================================================

map("n", "<leader>vr", function()
  dofile(vim.env.MYVIMRC)
  vim.notify("Reloaded init.lua")
end, { desc = "Reload Config" })

map("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit All" })

map("n", "<leader>qs", function()
  mini_sessions.write("Session.vim")
end, { desc = "Save Session" })

map("n", "<leader>qr", function()
  mini_sessions.read("Session.vim")
end, { desc = "Restore Session" })

map("n", "<leader>qd", function()
  mini_sessions.delete("Session.vim")
end, { desc = "Delete Session" })

-- ============================================================================
-- 17. Keymaps: buffers
-- ============================================================================

map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next Buffer" })

map("n", "<leader>bd", function()
  mini_bufremove.delete(0, false)
end, { desc = "Delete Buffer" })

map("n", "<leader>bD", "<cmd>bdelete<CR>", { desc = "Delete Buffer and Window" })

map("n", "<leader>bb", "<C-^>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<C-^>", { desc = "Switch to Other Buffer" })

map("n", "<leader>bo", function()
  local current = vim.api.nvim_get_current_buf()

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.bo[buf].buflisted then
      mini_bufremove.delete(buf, false)
    end
  end
end, { desc = "Delete Other Buffers" })

map("n", "<leader>bi", function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buflisted and #vim.fn.win_findbuf(buf) == 0 then
      mini_bufremove.delete(buf, false)
    end
  end
end, { desc = "Delete Invisible Buffers" })

-- ============================================================================
-- 18. Keymaps: editing and movement
-- ============================================================================

mini_keymap.map_combo({ "n", "i", "x", "c" }, "<Esc><Esc>", function()
  vim.cmd("nohlsearch")
end)

map({ "n", "x", "o" }, "s", function()
  mini_jump2d.start(mini_jump2d.builtin_opts.word_start)
end, { desc = "Jump" })

local map_multistep = mini_keymap.map_multistep

map_multistep("i", "<C-n>", { "pmenu_next" })
map_multistep("i", "<C-p>", { "pmenu_prev" })
map_multistep("i", "<C-y>", { "pmenu_accept" })
map_multistep("i", "<CR>", { "minipairs_cr" })
map_multistep("i", "<BS>", { "minipairs_bs" })

-- `c` changes text without overwriting the default/system clipboard register.
map({ "n", "x" }, "c", '"_c')

map("n", "<leader>ut", function()
  mini_trailspace.trim()
end, { desc = "Trim Trailing Whitespace" })

-- ============================================================================
-- 19. Keymaps: diagnostics
-- ============================================================================

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- ============================================================================
-- 20. Keymaps: files and search
-- ============================================================================

map("n", "<leader>e", function()
  mini_files.open()
end, { desc = "Explorer" })

map("n", "<leader><space>", function()
  mini_pick.builtin.files()
end, { desc = "Find Files" })

map("n", "<leader>/", function()
  mini_pick.builtin.grep_live()
end, { desc = "Grep" })

map("n", "<leader>,", function()
  mini_pick.builtin.buffers()
end, { desc = "Buffers" })

-- Diagnostic pickers belong to mini.extra.
map("n", "<leader>sd", function()
  mini_extra.pickers.diagnostic({ scope = "current" })
end, { desc = "Buffer Diagnostics" })

map("n", "<leader>sD", function()
  mini_extra.pickers.diagnostic({ scope = "all" })
end, { desc = "Workspace Diagnostics" })

map("n", "<leader>ff", function()
  mini_pick.builtin.files()
end, { desc = "Find Files" })

map("n", "<leader>fg", function()
  mini_pick.builtin.files({ tool = "git" })
end, { desc = "Find Git Files" })

map("n", "<leader>fr", function()
  mini_extra.pickers.oldfiles()
end, { desc = "Recent Files" })

-- ============================================================================
-- 21. Keymaps: notifications
-- ============================================================================

map("n", "<leader>n", function()
  mini_notify.show_history()
end, { desc = "Notification History" })

map("n", "<leader>un", function()
  mini_notify.clear()
end, { desc = "Clear All Notifications" })

-- ============================================================================
-- 22. Keymaps: code
-- ============================================================================

map({ "n", "x" }, "<leader>cf", function()
  vim.lsp.buf.format({
    async = true,
  })
end, { desc = "Format" })

-- ============================================================================
-- 23. Keymaps: Git
-- ============================================================================

map({ "n", "x" }, "<leader>gb", function()
  mini_git.show_range_history()
end, { desc = "Git Blame Line" })

map("n", "<leader>gf", "<cmd>Git log -- %<CR>", { desc = "Git Current File History" })

map("n", "<leader>gs", function()
  mini_extra.pickers.git_files({ scope = "modified" })
end, { desc = "Git Modified Files" })

map("n", "<leader>gl", function()
  mini_extra.pickers.git_commits()
end, { desc = "Git Log" })

map("n", "<leader>gd", function()
  mini_extra.pickers.git_hunks()
end, { desc = "Git Diff Hunks" })

-- ============================================================================
-- 23. Keymaps: Windows
-- ============================================================================
map("n", "<leader>uZ", function() mini_misc.zoom() end, { desc = "Toggle Zoom Mode" })


-- ============================================================================
-- 23. Keymaps: UI
-- ============================================================================
map("n", "<leader>uC", function()
  vim.ui.select(
    vim.fn.getcompletion("", "color"),
    { prompt = "Colorscheme" },
    function(choice)
      if choice then
        vim.cmd.colorscheme(choice)
      end
    end
  )
end, { desc = "Colorscheme" })

-- ============================================================================
-- 24. LSP buffer-local keymaps
-- ============================================================================

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,

  callback = function(ev)
    local opts = {
      buffer = ev.buf,
      silent = true,
    }

    local function bmap(lhs, rhs, desc, mode)
      vim.keymap.set(mode or "n", lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
    end

    bmap("gd", vim.lsp.buf.definition, "Goto Definition")
    bmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
    bmap("K", vim.lsp.buf.hover, "Hover")

    bmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    bmap("<leader>cr", vim.lsp.buf.rename, "Rename")

    bmap("gr", function()
      mini_extra.pickers.lsp({ scope = "references" })
    end, "References")

    bmap("gI", function()
      mini_extra.pickers.lsp({ scope = "implementation" })
    end, "Goto Implementation")

    bmap("gy", function()
      mini_extra.pickers.lsp({ scope = "type_definition" })
    end, "Type Definition")

    bmap("<leader>ss", function()
      mini_extra.pickers.lsp({ scope = "document_symbol" })
    end, "LSP Symbols")

    bmap("<leader>sS", function()
      mini_extra.pickers.lsp({ scope = "workspace_symbol" })
    end, "LSP Workspace Symbols")
  end,
})

-- ============================================================================
-- 25. Toggleable terminal
-- ============================================================================
-- Reuse one terminal while its shell process is alive.
-- If that process exits, the next toggle creates a fresh terminal.

local term = {
  buf = nil,
  win = nil,
  job = nil,
}

local function create_terminal(cwd)
  term.buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(0, term.buf)

  term.job = vim.fn.jobstart(vim.o.shell, {
    cwd = cwd,
    term = true,

    on_exit = function()
      term.job = nil
    end,
  })

  vim.cmd("startinsert")
end

local function toggle_terminal(cwd)
  -- Hide the terminal if it is currently visible.
  if term.win and vim.api.nvim_win_is_valid(term.win) then
    vim.api.nvim_win_close(term.win, true)
    term.win = nil
    return
  end

  -- Open the split which will display the terminal.
  vim.cmd("botright split")
  term.win = vim.api.nvim_get_current_win()

  -- Reuse the old terminal only while its process is still alive.
  if term.buf and vim.api.nvim_buf_is_valid(term.buf) and term.job and vim.fn.jobwait({ term.job }, 0)[1] == -1 then
    vim.api.nvim_win_set_buf(term.win, term.buf)
    vim.cmd("startinsert")
    return
  end

  create_terminal(cwd)
end

map("n", "<leader>ft", function()
  toggle_terminal(root())
end, { desc = "Terminal Root" })

map("n", "<leader>fT", function()
  toggle_terminal(vim.uv.cwd())
end, { desc = "Terminal Cwd" })

map({ "n", "t" }, "<C-/>", function()
  toggle_terminal(root())
end, { desc = "Terminal Root" })

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Enter Normal Mode" })

-- ============================================================================
-- 26. Autocommands
-- ============================================================================

-- Restore the last cursor position when reopening a file.
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,

  callback = function(ev)
    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(ev.buf)

    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- `q` closes common utility buffers.
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,

  pattern = {
    "help",
    "qf",
    "checkhealth",
    "man",
  },

  callback = function(ev)
    map("n", "q", "<cmd>close<CR>", {
      buffer = ev.buf,
      silent = true,
      desc = "Close",
    })
  end,
})

-- Autoformat and trim before saving.
--
-- Order matters:
--   1. Format synchronously so edits finish before the write.
--   2. Trim trailing whitespace after formatting.
--
-- Markdown is excluded from trimming because trailing spaces can represent
-- an intentional hard line break.
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,

  callback = function(ev)
    if vim.bo[ev.buf].buftype ~= "" then
      return
    end

    vim.lsp.buf.format({
      bufnr = ev.buf,
      async = false,
    })

    if vim.bo[ev.buf].filetype ~= "markdown" then
      mini_trailspace.trim()
    end
  end,
})

-- ============================================================================
-- 27. Treesitter
-- ============================================================================
require("nvim-treesitter").install({
  "lua",
  "vim",
  "vimdoc",
  "bash",
  "c",
  "cpp",
  "python",
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

map("n", "<leader>uT", function()
  local buf = vim.api.nvim_get_current_buf()

  if vim.treesitter.highlighter.active[buf] then
    vim.treesitter.stop(buf)
    print("Treesitter OFF")
  else
    vim.treesitter.start(buf)
    print("Treesitter ON")
  end
end, { desc = "Toggle Treesitter" })
