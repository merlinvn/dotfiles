local nnoremap = require("merlinvn.keymap").nnoremap
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Diagnostics symbols for display in the sign column.
vim.cmd("sign define LspDiagnosticsSignError text=")
vim.cmd("sign define LspDiagnosticsSignWarning text=")
vim.cmd("sign define LspDiagnosticsSignInformation text=")
vim.cmd("sign define LspDiagnosticsSignHint text=")
vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")

require("nvim-lsp-installer").setup {}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
nnoremap(
  "go",
  function()
    vim.diagnostic.open_float()
  end
)

nnoremap("gp", function()
  vim.diagnostic.goto_prev()
end)

nnoremap("gn", function()
  vim.diagnostic.goto_next()
end)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
  -- for other mappings related to telescope, see the 'telescope/mappings.lua' file
end
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  "pyright",
  "rust_analyzer",
  "tsserver",
  "hls",
  "tsserver",
  "yamlls",
  "tailwindcss",
  "gopls",
  "dockerls",
  "cssls"
}

for _, lsp in pairs(servers) do
  require("lspconfig")[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150
    }
  }
end

require "lspconfig".sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim", "use", "t",
          -- vim = true,
          -- nvim = true,
          -- use = true,
          -- lsp = true,
          -- _G = true,
          -- print = true,
          -- ipairs = true,
          -- pairs = true,
          -- next = true,
          -- type = true,
          -- tonumber = true,
          -- tostring = true,
          -- unpack = true,
          -- io = true,
          -- coroutine = true,
          -- table = true,
          -- string = true,
          -- math = true,
          -- bit32 = true,
          -- debug = true,
          -- assert = true,
          -- os = true,
          -- package = true,
          -- _VERSION = true,
          -- xpcall = true,
          -- module = true,
          -- rawset = true,
          -- rawget = true,
          -- pcall = true,
          -- error = true,
          -- gcinfo = true,
          -- collectgarbage = true,
          -- getmetatable = true,
          -- setmetatable = true,
          -- getfenv = true,
          -- setfenv = true,
        }
      }
    }
  }
}

require "lspconfig".clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--clang-tidy-checks=*",
    "--all-scopes-completion",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--header-insertion-decorators",
    "--header-insertion=iwyu",
    "--pch-storage=memory",
  }
}

-- require("clangd_extensions").setup {
--   server = {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = {
--       "clangd",
--       "--background-index",
--       "--suggest-missing-includes",
--       "--clang-tidy",
--       "--completion-style=bundled",
--       "--header-insertion=iwyu"
--     },
--     -- options to pass to nvim-lspconfig
--     -- i.e. the arguments to require("lspconfig").clangd.setup({})
--   },
-- }

-- require "lspconfig".html.setup {
--   filetypes = { "html", "eruby" },
--   capabilities = capabilities
-- }

-- require "lspconfig".jsonls.setup {
--   commands = {
--     Format = {
--       function()
--         vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
--       end
--     }
--   }
-- }
