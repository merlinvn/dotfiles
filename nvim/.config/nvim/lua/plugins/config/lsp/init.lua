local M = {}
function M.setup()
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

  require("plugins.config.lsp.lua-ls")

  require "lspconfig".html.setup {
    filetypes = {"html", "eruby"},
    capabilities = capabilities
  }

  require "lspconfig".tsserver.setup {}

  require "lspconfig".solargraph.setup {capabilities = capabilities}
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
  require "lspconfig".vimls.setup {}

  require "lspconfig".clangd.setup {
    -- on_attach = require'completion'.on_attach,
    cmd = {"clangd", "--background-index"}
  }

  require "lspconfig".tailwindcss.setup {}

  require "lspconfig".gopls.setup {capabilities = capabilities}
end

return M

--
-- require'lspconfig'.dartls.setup{
-- }
-- require("flutter-tools").setup{} -- use defaults

---- alternatively you can override the default configs
-- require("flutter-tools").setup {
-- experimental = { -- map of feature flags
-- lsp_derive_paths = true, -- EXPERIMENTAL: Attempt to find the user's flutter SDK
-- },
-- debugger = { -- EXPERIMENTAL: integrate with nvim dap
-- enabled = false,
-- },
-- widget_guides = {
-- enabled = false,
-- },
-- closing_tags = {
-- highlight = "ErrorMsg",
-- prefix = ">"
-- },
-- dev_log = {
-- open_cmd = "tabedit",
-- },
-- outline = {
-- open_cmd = "30vnew",
-- },
-- lsp = {
-- capabilities = capabilities -- e.g. lsp_status capabilities
-- }
-- }

-- require'lspconfig'.clangd.setup{
-- on_attach=require'completion'.on_attach;
-- cmd = { "clangd", "--background-index"};
-- }

-- require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }

-- require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
-- require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
-- require'lspconfig'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }
-- require'nvim_lsp'.sumneko_lua.setup{ on_attach=require'completion'.on_attach }

-- require('merlinvn.lspkind').init()
