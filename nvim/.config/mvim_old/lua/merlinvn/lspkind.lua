local lspkind = {}
local fmt = string.format

-- if you change or add symbol here
-- replace corresponding line in readme
local kind_symbols = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Variable = '[]',
  Class = ' פּ ',
  Interface = ' 蘒 ',
  Module = '  ',
  Property = '  ',
  Unit = ' 塞 ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  UltiSnips = '  ',
  Color = '  ',
  File = '  ',
  Folder = ' ﱮ ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '   ',
  Field = '  ',
  Event = '  ',
  Reference = '  ',
  TypeParameter = '<>',
  Operator = '  ',
}

local kind_order = {
  'Text', 'Method', 'Function', 'Constructor', 'Field', 'Variable', 'Class', 'Interface', 'Module',
  'Property', 'Unit', 'Value', 'Enum', 'Keyword', 'Snippet', 'Color', 'File', 'Reference', 'Folder',
  'EnumMember', 'Constant', 'Struct', 'Event', 'Operator', 'TypeParameter', 'UltiSnips'
}

function lspkind.init(opts)
  local with_text = opts == nil or opts['with_text']
  local symbol_map = (opts and opts['symbol_map'] and
                       vim.tbl_extend('force', kind_symbols, opts['symbol_map'])) or kind_symbols

  local symbols = {}
  local len = table.getn(kind_order)

  if with_text == true or with_text == nil then
    for i = 1, len do
      local name = kind_order[i]
      local symbol = symbol_map[name]
      symbol = symbol and (symbol .. ' ') or ''
      symbols[i] = fmt('%s%s', symbol, name)
    end
  else
    for i = 1, len do
      local name = kind_order[i]
      symbols[i] = symbol_map[name]
    end
  end

  require('vim.lsp.protocol').CompletionItemKind = symbols
end

return lspkind