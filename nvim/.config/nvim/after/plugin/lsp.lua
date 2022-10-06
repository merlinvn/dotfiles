local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local nnoremap = require("merlinvn.keymap").nnoremap
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")

require("nvim-lsp-installer").setup {}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'go', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

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
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'H', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  vim.keymap.set('n', 'gr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>.', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>cf', function() vim.lsp.buf.format { async = true } end, bufopts)
  -- for other mappings related to telescope, see the 'telescope/mappings.lua' file
end
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  "pyright",
  -- rust-analyzer will be managed by rust-tools
  -- "rust_analyzer",
  -- "yamlls",
  "tailwindcss",
  "gopls",
  "dockerls",
  "cssls",
  "hls"
}

for _, lsp in pairs(servers) do
  require("lspconfig")[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
    }
  }
end
-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  -- capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.sumneko_lua.setup {
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

nvim_lsp.clangd.setup {
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

nvim_lsp.cmake.setup {}

-- nvim_lsp.html.setup {
--   filetypes = { "html", "eruby" },
--   capabilities = capabilities
-- }

-- nvim_lsp.jsonls.setup {
--   commands = {
--     Format = {
--       function()
--         vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
--       end
--     }
--   }
-- }

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

require("rust-tools").setup({
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
})
