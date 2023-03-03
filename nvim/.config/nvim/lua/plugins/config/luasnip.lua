local M = {}

M.opts = {
  history = false,
  delete_check_events = "TextChanged",
}

M.keys = {
  {
    "<tab>",
    function()
      return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next"
        or "<tab>"
    end,
    expr = true,
    silent = true,
    mode = "i",
  },
  {
    "<tab>",
    function()
      require("luasnip").jump(1)
    end,
    mode = "s",
  },
  {
    "<s-tab>",
    function()
      require("luasnip").jump(-1)
    end,
    mode = { "i", "s" },
  },
  {
    "<leader>rs",
    "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<cr>",
  },
}
M.config = function()
  local ls = require("luasnip")
  ls.config.setup(M.opts)
  ls.filetype_extend("javascript", { "javascriptreact" })

  for _, ft_path in
    ipairs(vim.api.nvim_get_runtime_file("lua/merlinvn/snips/ft/*.lua", true))
  do
    loadfile(ft_path)()
  end
end

return M
