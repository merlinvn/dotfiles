local M = {}

M.init = function()
  vim.g.navic_silence = true
  require("core.util").on_attach(function(client, buffer)
    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, buffer)
    end
  end)
end

M.opts = function()
  return {
    separator = " ",
    highlight = true,
    depth_limit = 5,
    icons = {
      Array = " ",
      Boolean = " ",
      Class = " ",
      Color = " ",
      Constant = " ",
      Constructor = " ",
      Copilot = " ",
      Enum = " ",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = " ",
      Interface = " ",
      Key = " ",
      Keyword = " ",
      Method = " ",
      Module = " ",
      Namespace = " ",
      Null = " ",
      Number = " ",
      Object = " ",
      Operator = " ",
      Package = " ",
      Property = " ",
      Reference = " ",
      Snippet = " ",
      String = " ",
      Struct = " ",
      Text = " ",
      TypeParameter = " ",
      Unit = " ",
      Value = " ",
      Variable = " ",
    },
  }
end

M.config = function()
  require("nvim-navic").setup(M.opts())
end

return M
