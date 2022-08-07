local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local MerlinVnGroup = augroup('MerlinVn', {})
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 300,
    })
  end,
})

--autocmd({"BufEnter", "BufWinEnter", "TabEnter"}, {
--    group = MerlinVnGroup,
--    pattern = "*.rs",
--    callback = function()
--        require("lsp_extensions").inlay_hints{}
--    end
--})

-- remove trailing spaces at the end of all lines
autocmd({ "BufWritePre" }, {
  group = MerlinVnGroup,
  pattern = "*",
  command = "%s/\\s\\+$//e",
})


