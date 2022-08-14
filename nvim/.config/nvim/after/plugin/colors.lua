--[[ require('onedark').setup {
  -- Main options --
  style = 'warm', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = true, -- Show/hide background
  term_colors = true, -- Change terminal color as per the selected theme style
  ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

  -- toggle theme style ---
  toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
  toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },

  -- Custom Highlights --
  colors = {}, -- Override default colors
  highlights = {}, -- Override highlight groups

  -- Plugins Config --
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true, -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
}
require('onedark').load() ]]


vim.g.my_colorscheme = "tokyonight"

function ColorMyPencils()
  vim.g.gruvbox_contrast_dark = 'hard'
  vim.g.tokyonight_transparent_sidebar = true
  vim.g.tokyonight_transparent = true
  vim.g.gruvbox_invert_selection = '0'
  vim.opt.background = "dark"

  vim.cmd("colorscheme " .. vim.g.my_colorscheme)

  local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
  end

  hl("SignColumn", {
    bg = "none",
  })

  hl("ColorColumn", {
    ctermbg = 0,
    bg = "#555555",
  })

  hl("CursorLineNR", {
    bg = "None"
  })

  hl("Normal", {
    bg = "none"
  })

  hl("LineNr", {
    fg = "#5eacd3"
  })

  hl("netrwDir", {
    fg = "#5eacd3"
  })

end

ColorMyPencils()
