local neogit = require('neogit')
local nnoremap = require('merlinvn.keymap').nnoremap

neogit.setup {
  auto_refresh = false
}

nnoremap("<leader>gs", function()
  neogit.open({})
end);

nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>");
