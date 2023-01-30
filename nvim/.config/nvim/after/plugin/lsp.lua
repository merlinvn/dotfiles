local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

-- Turn on lsp status information
require('fidget').setup()
-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

local protocol = require('vim.lsp.protocol')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
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

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', 'go', vim.diagnostic.open_float,
--   { noremap = true, silent = true, desc = 'Open diagnostics float' })
vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev,
  { noremap = true, silent = true, desc = 'Go to previous diagnostic' })
vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Go to next diagnostic" })
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = require("merlinvn.util").lsp_on_attach

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  clangd = {
    cmd = { "clangd", "--background-index", "--suggest-missing-includes", "--clang-tidy", "--header-insertion=iwyu" },
  },
  gopls = {},
  pyright = {},
  -- rust analyzer is managed by the rust-tools plugin
  -- rust_analyzer = {},
  tsserver = {
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
  },

  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
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
  },
  tailwindcss = {},
  dockerls = {},
  cmake = {},
  -- hsl = {},
}

-- mason will install the language servers for you
local mason_lspconfig = require 'mason-lspconfig'
require('mason').setup()

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    -- print("LSP server " .. server_name .. " attached")
    nvim_lsp[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name]["settings"],
      cmd = servers[server_name]["cmd"],
    }
  end,
}

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
