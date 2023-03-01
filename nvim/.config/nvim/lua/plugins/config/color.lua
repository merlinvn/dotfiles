local M = {}
M.colorMyPencils = function(colorscheme)
  -- vim.g.gruvbox_contrast_dark = 'hard'
  -- vim.g.gruvbox_italic = 1
  -- vim.g.gruvbox_transparent_bg = 1
  -- vim.g.gruvbox_termcolors = 256

  vim.cmd("colorscheme " .. colorscheme)

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

return M
