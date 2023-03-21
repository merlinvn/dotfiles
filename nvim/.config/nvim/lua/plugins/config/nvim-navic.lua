local M = {}

M.init = function()
  vim.g.navic_silence = true
  require("merlinvn.util").on_attach(function(client, buffer)
    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, buffer)
    end
  end)
end

M.opts = function()
  return {
    separator = " > ",
    highlight = true,
    depth_limit = 4,
    icons = {
      File = " ",
      Module = " ",
      Namespace = " ",
      Package = " ",
      Class = " ",
      Method = " ",
      Property = " ",
      Field = " ",
      Constructor = " ",
      Enum = "練",
      Interface = "練",
      Function = " ",
      Variable = " ",
      Constant = " ",
      String = " ",
      Number = " ",
      Boolean = "◩ ",
      Array = " ",
      Object = " ",
      Key = " ",
      Null = "ﳠ ",
      EnumMember = " ",
      Struct = " ",
      Event = " ",
      Operator = " ",
      TypeParameter = " ",
    },
  }
end

M.config = function()
  require("nvim-navic").setup(M.opts())
end

return M
