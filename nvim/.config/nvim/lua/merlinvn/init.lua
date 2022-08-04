-- print("Hello from merlinvn init")
require("merlinvn.set")
require("merlinvn.packer")
require("merlinvn.telescope")
-- require("merlinvn.neogit")

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

autocmd({ "BufWritePre" }, {
  group = MerlinVnGroup,
  pattern = "*",
  command = "%s/\\s\\+$//e",
})


vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
