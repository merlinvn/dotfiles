-- https://github.com/sbdchd/neoformat
-- Lua Fommatter: sudo luarocks install --server=https://luarocks.org/dev luaformatter
vim.api.nvim_exec([[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]], true)
