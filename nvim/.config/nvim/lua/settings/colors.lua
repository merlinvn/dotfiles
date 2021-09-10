-- Ref: https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
vim.cmd("set background=dark")
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_disable_italic_comment = 1
vim.cmd 'colorscheme gruvbox-material'
vim.cmd 'highlight HighlightedyankRegion cterm=reverse gui=reverse'

-- vim.cmd([[
-- if exists("+termguicolors")
--   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
--   set termguicolors
-- endif
-- ]])
