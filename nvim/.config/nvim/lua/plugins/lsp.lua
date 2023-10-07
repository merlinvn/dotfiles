local M = {}

---@diagnostic disable-next-line: unused-local
M.default_keymaps = function(client, bufnr)
  local buf_map = require("helpers.keys").buf_map
  -- Mappings.
  local nmap = function(keys, func, desc)
    buf_map("n", keys, func, bufnr, desc, { noremap = true })
  end

  -- local imap = function(keys, func, desc)
  --   buf_map("i", keys, func, bufnr, desc, { noremap = true })
  -- end
  nmap("K", vim.lsp.buf.hover, "Show hover")
  nmap("gK", vim.lsp.buf.signature_help, "Show signature help")

  nmap(
    "gd",
    "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>",
    "Definitions"
  )

  nmap(
    "gy",
    "<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>",
    "Type definitions"
  )
  -- default gi can be substituted by 0i
  nmap(
    "gi",
    "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>",
    "Implementations"
  )

  nmap(
    "gr",
    "<cmd>lua require('telescope.builtin').lsp_references()<CR>",
    "References"
  )

  nmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
  nmap("<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action")
  nmap("<leader>cr", vim.lsp.buf.rename, "Code rename")
  nmap("<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", "Code rename")
  nmap("[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous diagnostic")
  nmap("]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic")
end

M.opts = {
  -- options for vim.diagnostic.config()
  diagnostics = {
    underline = true,
    update_in_insert = true,
    virtual_text = true,
    severity_sort = true,
    float = {
      source = "always", -- Or "if_many"
      style = "minimal",
      border = "rounded",
      header = "",
      prefix = "",
    },
  },
  -- add any global capabilities here
  capabilities = {},
  autoformat = true,
  format = {
    formatting_options = nil,
    timeout_ms = nil,
  },
  -- LSP Server Settings
  servers = {
    clangd = {
      mason = false,
      filetypes = {
        "c",
        "cpp",
        "cuda",
        "proto",
      },
      -- cmd = {
      --   "clangd",
      --   "--background-index",
      --   "--suggest-missing-includes",
      --   "--clang-tidy",
      --   "--header-insertion=iwyu",
      -- },
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
      settings = {

        -- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
        javascript = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
          },
        },
        typescript = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
          },
        },
      },
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
          hint = {
            enable = true,
            -- Disable LSP diagnostics for Lua
            -- diagnostics = false,
          },
        },
      },
    },
    tailwindcss = {},
    dockerls = {},
    cmake = {
      mason = false,
    },
    eslint = {},
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
      require("rust-tools").setup({
        server = opts,
        tools = {
          inlay_hints = {
            highlight = "@comment",
          },
        },
      })
      -- additional keymaps
      -- require("helpers").on_attach(function(client, buf)
      --   require("plugins.config.lsp.keymaps").on_attach_rust(client, buf)
      -- end)
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
  inlay_hints = { enable = true },
}

M.config_diagnotics = function(opts)
  -- config diagnostics
  local signs = { Error = "✘ ", Warn = "▲ ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
  vim.diagnostic.config(opts.diagnostics)
end

return {
  {
    "neovim/nvim-lspconfig",
    cmd = "LspInfo",
    lazy = "VeryLazy",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Additional lua configuration, makes nvim stuff amazing
      "folke/neodev.nvim",
      {
        "simrat39/rust-tools.nvim",
        event = { "BufReadPre", "BufNewFile" },
      },
    },
    config = function()
      -- -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
      require("neodev").setup({
        -- add any options here, or leave empty to use the default settings
      })
      M.config_diagnotics(M.opts)

      -- create autoformat
      require("helpers.lsp_format").setup(M.opts)

      require("helpers.lsp").on_attach(function(client, bufnr)
        M.default_keymaps(client, bufnr)
        -- mhartington/formatter.nvim will manage formatting on save
      end)

      local capabilities = require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.offsetEncoding = { "utf-16" }

      local setup = function(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, M.opts.servers[server] or {})

        if M.opts.setup[server] then
          if M.opts.setup[server](server, server_opts) then
            return
          end
        elseif M.opts.setup["*"] then
          if M.opts.setup["*"](server, server_opts) then
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
      for server, server_opts in pairs(M.opts.servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if
            server_opts.mason == false
            or not vim.tbl_contains(available, server)
          then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup_handlers({ setup })

      if vim.lsp.inlay_hint then
        vim.keymap.set(
          "n",
          "<leader>ch",
          "<cmd>lua vim.lsp.inlay_hint(0, nil)<cr>",
          { noremap = true, silent = true, desc = "Toggle hints" }
        )
      end
    end,
  },
  -- {
  --   "nvim-lua/lsp_extensions.nvim",
  --   event = "BufReadPre",
  -- },
  -- {
  --   "simrat39/symbols-outline.nvim",
  --   event = "BufReadPre",
  -- },
}
