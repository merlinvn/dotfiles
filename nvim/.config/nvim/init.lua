-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH
-- set rtp^="/Users/neo/.opam/default/share/ocp-indent/vim"
vim.env.PATH = vim.env.HOME .. "/.opam/default/share/ocp-indent/vim" .. vim.env.PATH

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
