-- [[ Fix file on save]]
-- remove trailing spaces at the end of all lines
local MerlinVnGroup = vim.api.nvim_create_augroup("MerlinVn", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   group = MerlinVnGroup,
--   pattern = "*",
--   callback = function()
--     local MiniTrail = require("mini.trailspace")
--     MiniTrail.trim()
--     MiniTrail.trim_last_lines()
--   end,
-- })

-- resize splis if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = MerlinVnGroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = MerlinVnGroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = MerlinVnGroup,
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set(
      "n",
      "q",
      "<cmd>close<cr>",
      { buffer = event.buf, silent = true }
    )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = MerlinVnGroup,
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "TabLeave" }, {
  group = MerlinVnGroup,
  pattern = "*",
  command = "let g:lasttab = tabpagenr()",
})