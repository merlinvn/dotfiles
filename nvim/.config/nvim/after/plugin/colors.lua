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
-- vim.g.my_colorscheme = "gruvbox"
-- vim.g.my_colorscheme = "kanagawa"
-- vim.g.my_colorscheme = "oxocarbon-lua"

function ColorMyPencils()
  vim.g.gruvbox_contrast_dark = 'hard'
  vim.g.gruvbox_invert_selection = '0'
  vim.g.oxocarbon_lua_transparent = false
  vim.g.oxocarbon_lua_keep_terminal = false
  vim.g.tokyonight_transparent_sidebar = false
  vim.g.tokyonight_transparent = false
  vim.g.tokyonight_style = "night"
  vim.g.background = "dark"

  vim.cmd("colorscheme " .. vim.g.my_colorscheme)

  local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
  end

  hl("SignColumn", {
    bg = "none",
  })

  hl("ColorColumn", {
    ctermbg = 0,
    bg = "#333333",
  })

  hl("CursorLineNR", {
    bg = "None"
  })

  hl("Normal", {
    -- bg = "#0d0e14"
    bg = "" -- transparent background
  })

  hl("LineNr", {
    fg = "#5eacd3"
  })

  hl("netrwDir", {
    fg = "#5eacd3"
  })

end

-- ColorMyPencils()


vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup()

vim.cmd [[colorscheme catppuccin]]
