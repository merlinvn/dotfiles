local nvim_lsp = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- require('lspkind').init()

-- Diagnostics symbols for display in the sign column.
vim.cmd("sign define LspDiagnosticsSignError text=")
vim.cmd("sign define LspDiagnosticsSignWarning text=")
vim.cmd("sign define LspDiagnosticsSignInformation text=")
vim.cmd("sign define LspDiagnosticsSignHint text=")
vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")

require("merlinvn.lsp.lua-ls")

require "lspconfig".html.setup {
  filetypes = {"html", "eruby"},
  capabilities = capabilities
}

require "lspconfig".tsserver.setup {}

-- require "lspconfig".solargraph.setup {capabilities = capabilities}
require "lspconfig".cssls.setup {capabilities = capabilities}
require "lspconfig".dockerls.setup {}
require "lspconfig".jsonls.setup {
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
      end
    }
  }
}
require "lspconfig".yamlls.setup {}
-- require "lspconfig".vimls.setup {}

require "lspconfig".clangd.setup {
  -- on_attach = require'completion'.on_attach,
  cmd = {"clangd", "--background-index"}
}

require "lspconfig".tailwindcss.setup {}

require "lspconfig".gopls.setup {capabilities = capabilities}

require "lspconfig".hls.setup {}

require "lspconfig".rust_analyzer.setup {}
