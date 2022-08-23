local status, indent_blankline = pcall(require, "indent_blankline")
if (not status) then return end

-- vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"
vim.cmd [[highlight IndentBlanklineChar gui=nocombine guifg=#3b4261]]
vim.cmd [[highlight IndentBlanklineSpaceChar gui=nocombine guifg=#3b4261]]
vim.cmd [[highlight IndentBlanklineSpaceCharBlankLine gui=nocombine guifg=#3b4261]]

vim.cmd [[highlight IndentBlanklineContextChar gui=nocombine guifg=#bb9af7]]
vim.cmd [[highlight IndentBlanklineContextStart gui=nocombine guifg=#bb9af7]]



indent_blankline.setup {
  show_end_of_line = false,
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
