-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      -- higroup = 'IncSearch',
      -- timeout = 300,
    })
  end,
  group = highlight_group,
  pattern = '*',
})


-- [[ Fix file on save]]
-- remove trailing spaces at the end of all lines
local MerlinVnGroup = vim.api.nvim_create_augroup('MerlinVn', {})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = MerlinVnGroup,
  pattern = "*",
  command = "%s/\\s\\+$//e",
})
