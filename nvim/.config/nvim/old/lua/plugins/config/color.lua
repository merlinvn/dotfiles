local M = {}

-- Fetch and setup colorscheme if available, otherwise just return 'default'
-- This should prevent Neovim from complaining about missing colorschemes on first boot
local function get_if_available(name, opts)
  local lua_ok, colorscheme = pcall(require, name)
  if lua_ok then
    colorscheme.setup(opts)
    return name
  end

  local vim_ok, _ = pcall(vim.cmd.colorscheme, name)
  if vim_ok then
    return name
  end

  return "default"
end

M.setup_gruvbox = function()
  vim.o.background = "dark"

  require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    dim_inactive = false,
    transparent_mode = false,
    overrides = {
      -- Normal = { fg = "#ebdbb2", bg = "#282828" },
      -- SignColumn = { bg = "None" },
      -- ColorColumn = { ctermbg = 0, bg = "#333333" },
      CursorLineNR = { fg = "orange", bg = "None" },
      NormalFloat = { ctermbg = "None", bg = "" },
      LineNr = { fg = "gray", bg = "None" },
      ntrwDir = { fg = "#5eacd3", bg = "None" },
      IncSearch = { bg = "orange", fg = "black" },
      CurSearch = { bg = "orange", fg = "#1d2021" },
    },
  })
end

M.loadColorscheme = function(colorscheme)
  local colorscheme_or_default = get_if_available(colorscheme, {})
  vim.cmd("colorscheme " .. colorscheme_or_default)
end

return M
