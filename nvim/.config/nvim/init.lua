-- Handle plugins with lazy.nvim
require("core.lazy")
-- disable netrw and use nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("core.set")
require("core.keymaps")
require("core.autocmd")
