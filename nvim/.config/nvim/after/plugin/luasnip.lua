if vim.g.snippets ~= "luasnip" then
  return
end


require('luasnip').filetype_extend("javascript", { "javascriptreact" })
