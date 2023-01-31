--[[ require('kanagawa').setup({
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  variablebuiltinStyle = { italic = true },
  specialReturn = true, -- special highlight for the return keyword
  specialException = true, -- special highlight for exception handling keywords
  transparent = true, -- do not set background color
  dimInactive = false, -- dim inactive window `:h hl-NormalNC`
  globalStatus = false, -- adjust window separators highlight for laststatus=3
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = {},
  overrides = {},
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa") ]]

-- vim.cmd("colorscheme oxocarbon")
-- vim.g.my_colorscheme = "tokyonight"
-- vim.g.my_colorscheme = "kanagawa"
-- vim.g.my_colorscheme = "gruvbox"
-- vim.g.my_colorscheme = "nord"


vim.o.background = "dark"
local my_colorscheme = "gruvbox"
-- local my_colorscheme = "gruvbuddy"

function ColorMyPencils()
  -- vim.g.gruvbox_contrast_dark = 'hard'
  -- vim.g.gruvbox_italic = 1
  -- vim.g.gruvbox_transparent_bg = 1
  -- vim.g.gruvbox_termcolors = 256

  vim.cmd("colorscheme " .. my_colorscheme)

  -- local hl = function(thing, opts)
  --   vim.api.nvim_set_hl(0, thing, opts)
  -- end

  -- hl("SignColumn", {
  --   bg = "none",
  -- })
  --
  -- hl("ColorColumn", {
  --   ctermbg = 0,
  --   bg = "#333333",
  -- })
  --
  -- hl("CursorLineNR", {
  --   -- fg = "orange",
  --   -- bg = "None"
  -- })
  --
  -- hl("Normal", {
  --   -- ctermbg = "None",
  --   -- guibg = 0,
  --   bg = "#282828"
  --   -- bg = "" -- transparent background
  -- })
  --
  -- -- hl("NormalFloat", {
  -- --   -- ctermbg = "None",
  -- --   -- guibg = 0,
  -- --   bg = "#1d2021"
  -- --   -- bg = "" -- transparent background
  -- -- })
  --
  -- hl("LineNr", {
  --   fg = "gray"
  -- })
  --
  -- -- hl("netrwDir", {
  -- --   fg = "#5eacd3"
  -- -- })
  --
  -- hl("IncSearch", {
  --   bg = "orange",
  --   fg = "black"
  -- })
  --
  -- hl("CurSearch", {
  --   bg = "orange",
  --   fg = "#1d2021"
  -- })

end

ColorMyPencils()

-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
--
-- require("catppuccin").setup({
--   neogit = true,
--   harpoon = true,
--   treesitter = true,
--   treesitter_context = false,
--   telescope = true,
--   which_key = true,
--   cmp = true,
--   vim_sneak = true,
--   dap = {
--     enabled = true,
--     enable_ui = true, -- enable nvim-dap-ui
--   },
--   indent_blankline = {
--     enabled = true,
--     colored_indent_levels = true,
--   },
--   native_lsp = {
--     enabled = true,
--     virtual_text = {
--       errors = { "italic" },
--       hints = { "italic" },
--       warnings = { "italic" },
--       information = { "italic" },
--     },
--     underlines = {
--       errors = { "underline" },
--       hints = { "underline" },
--       warnings = { "underline" },
--       information = { "underline" },
--     },
--   },
-- })
--
-- vim.cmd [[colorscheme catppuccin]]


-- onedark setup
-- require('onedark').setup {
--   style = 'deep'
-- }
-- require('onedark').load()
