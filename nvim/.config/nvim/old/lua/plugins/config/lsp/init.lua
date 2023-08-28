local M = {}

M.opts = { -- options for vim.diagnostic.config()
  diagnostics = {
    underline = true,
    update_in_insert = true,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
    float = {
      source = "always", -- Or "if_many"
    },
  },
  -- Automatically format on save
  autoformat = true,
  -- options for vim.lsp.buf.format
  -- `bufnr` and `filter` is handled by the LazyVim formatter,
  -- but can be also overriden when specified
  format = {
    formatting_options = nil,
    timeout_ms = nil,
  },
  -- LSP Server Settings
  servers = {
    clangd = {
      mason = false,
      cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
        "--clang-tidy",
        "--header-insertion=iwyu",
      },
    },
    gopls = {},
    pyright = {},
    astro = {},
    tsserver = {
      format = {
        enable = true,
      },
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      cmd = { "typescript-language-server", "--stdio" },
    },
    lua_ls = {
      settings = {
        Lua = {
          format = {
            enable = false,
            defaultConfig = {
              indent_type = "space",
              indent_size = 2,
            },
          },
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            -- library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
          },
          completion = {
            callSnippet = "Replace",
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
          diagnostics = {
            globals = {
              "vim",
              "use",
              "t",
            },
          },
        },
      },
    },
    tailwindcss = {},
    dockerls = {},
    cmake = {},
    ["rust_analyzer"] = {
      mason = false,
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importEnforceGranularity = true,
            importPrefix = "crate",
          },
          cargo = {
            allFeatures = true,
          },
          checkOnSave = {
            -- default: `cargo check`
            command = "clippy",
            -- command = "check",
          },
        },
        inlayHints = {
          lifetimeElisionHints = {
            enable = true,
            useParameterNames = true,
          },
        },
      },
    },
    -- hsl = {},
  },
  -- you can do any additional / custom lsp server setup here
  -- return true if you don't want additional default setup with lspconfig
  setup = {
    rust_analyzer = function(_, opts)
      require("rust-tools").setup({ server = opts })
      -- additional keymaps
      require("helpers").on_attach(function(client, buf)
        require("plugins.config.lsp.keymaps").on_attach_rust(client, buf)
      end)
      return true
    end,

    -- example to setup with typescript.nvim
    -- tsserver = function(_, opts)
    --   require("typescript").setup({ server = opts })
    --   return true
    -- end,
    -- Specify * to use this function as a fallback for any server
    -- ["*"] = function(server, opts) end,
  },
}

function M.config(_, opts)
  -- setup autoformat
  require("plugins.config.lsp.format").autoformat = opts.autoformat

  require("helpers").on_attach(function(client, buffer)
    require("plugins.config.lsp.format").on_attach(client, buffer)
    require("plugins.config.lsp.keymaps").on_attach(client, buffer)
  end)

  -- Diagnostic symbols in the sign column (gutter)
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  vim.diagnostic.config(opts.diagnostics)

  -- vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
  local servers = opts.servers
  local capabilities = require("cmp_nvim_lsp").default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local setup = function(server)
    local server_opts = vim.tbl_deep_extend("force", {
      capabilities = vim.deepcopy(capabilities),
    }, servers[server] or {})

    if opts.setup[server] then
      if opts.setup[server](server, server_opts) then
        return
      end
    elseif opts.setup["*"] then
      if opts.setup["*"](server, server_opts) then
        return
      end
    end
    -- default setup
    require("lspconfig")[server].setup(server_opts)
  end

  -- temp fix for lspconfig rename
  -- https://github.com/neovim/nvim-lspconfig/pull/2439
  local mappings = require("mason-lspconfig.mappings.server")
  if not mappings.lspconfig_to_package.lua_ls then
    mappings.lspconfig_to_package.lua_ls = "lua-language-server"
    mappings.package_to_lspconfig["lua-language-server"] = "lua_ls"
  end

  local mlsp = require("mason-lspconfig")
  local available = mlsp.get_available_servers()

  local ensure_installed = {}
  for server, server_opts in pairs(servers) do
    if server_opts then
      server_opts = server_opts == true and {} or server_opts
      -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
      if
        server_opts.mason == false or not vim.tbl_contains(available, server)
      then
        setup(server)
      else
        ensure_installed[#ensure_installed + 1] = server
      end
    end
  end

  require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
  require("mason-lspconfig").setup_handlers({ setup })

  local protocol = require("vim.lsp.protocol")
  protocol.CompletionItemKind = {
    "", -- Text
    "", -- Method
    "", -- Function
    "", -- Constructor
    "", -- Field
    "", -- Variable
    "", -- Class
    "ﰮ", -- Interface
    "", -- Module
    "", -- Property
    "", -- Unit
    "", -- Value
    "", -- Enum
    "", -- Keyword
    "﬌", -- Snippet
    "", -- Color
    "", -- File
    "", -- Reference
    "", -- Folder
    "", -- EnumMember
    "", -- Constant
    "", -- Struct
    "", -- Event
    "ﬦ", -- Operator
    "", -- TypeParameter
  }
end

M.keys = {
  -- {
  --   "<leader>f",
  --   "<cmd>lua require('plugins.config.lsp.format').format()<CR>",
  --   desc = "Format",
  -- },
}

return M
