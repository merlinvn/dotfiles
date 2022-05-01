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

require('nvim-lsp-setup').setup({
  -- nvim-lsp-installer
  -- https://github.com/williamboman/nvim-lsp-installer#configuration
  installer = {},
  -- Default mappings
  -- gD = 'lua vim.lsp.buf.declaration()',
  -- gd = 'lua vim.lsp.buf.definition()',
  -- gt = 'lua vim.lsp.buf.type_definition()',
  -- gi = 'lua vim.lsp.buf.implementation()',
  -- gr = 'lua vim.lsp.buf.references()',
  -- K = 'lua vim.lsp.buf.hover()',
  -- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
  -- ['<space>rn'] = 'lua vim.lsp.buf.rename()',
  -- ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
  -- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
  -- ['<space>e'] = 'lua vim.lsp.diagnostic.show_line_diagnostics()',
  -- ['[d'] = 'lua vim.lsp.diagnostic.goto_prev()',
  -- [']d'] = 'lua vim.lsp.diagnostic.goto_next()',
  default_mappings = true,
  -- Custom mappings, will overwrite the default mappings for the same key
  -- Example mappings for telescope pickers:
  -- gd = 'lua require"telescope.builtin".lsp_definitions()',
  -- gi = 'lua require"telescope.builtin".lsp_implementations()',
  -- gr = 'lua require"telescope.builtin".lsp_references()',
  mappings = {},
  -- Global on_attach
  on_attach = function(client, bufnr)
    require('nvim-lsp-setup.utils').format_on_save(client)
  end,
  -- Global capabilities
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  -- Configuration of LSP servers
  servers = {
    -- Install LSP servers automatically
    -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    -- not automatically install yet
    -- clangd = {},
    -- hls = {},
    -- pylsp = {},
    sumneko_lua = {},
    gopls = {},
    html = {
      filetypes = { "html", "eruby" },
      capabilities = capabilities
    },
    cssls = {
      capabilities = capabilities
    },
    dockerls = {},
    tailwindcss = {},
    jsonls = {
      commands = {
        Format = {
          function()
            vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
          end
        }
      }
    },
    yamlls = {},
    rust_analyzer = {
      settings = {
        ['rust-analyzer'] = {
          cargo = {
            loadOutDirsFromCheck = true,
          },
          procMacro = {
            enable = true,
          },
        },
      },
    },
  },
})

require "lspconfig".clangd.setup {
  -- on_attach = require'completion'.on_attach,
  cmd = { "clangd", "--background-index" }
}
require "lspconfig".hls.setup {}

-- require("merlinvn.lsp.lua-ls")
--
-- require "lspconfig".html.setup {
--   filetypes = {"html", "eruby"},
--   capabilities = capabilities
-- }
--
-- require "lspconfig".tsserver.setup {}
--
-- -- require "lspconfig".solargraph.setup {capabilities = capabilities}
-- require "lspconfig".cssls.setup {capabilities = capabilities}
-- require "lspconfig".dockerls.setup {}
-- require "lspconfig".jsonls.setup {
--   commands = {
--     Format = {
--       function()
--         vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
--       end
--     }
--   B
--   }
-- }
-- require "lspconfig".yamlls.setup {}
-- -- require "lspconfig".vimls.setup {}
--
--
-- require "lspconfig".tailwindcss.setup {}
--
-- require "lspconfig".gopls.setup {capabilities = capabilities}
--
--
-- require "lspconfig".rust_analyzer.setup {}
