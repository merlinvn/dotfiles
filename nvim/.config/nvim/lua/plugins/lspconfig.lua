return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ocamllsp = {
          mason = false,
        },
        gleam = {
          mason = false,
        },
      },
      setup = {
        clangd = function(_, opts)
          -- opts.capabilities.offsetEncoding = { "utf-16" }
          opts.mason = false
          opts.cmd = {
            "/opt/homebrew/opt/llvm/bin/clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          }
          -- Specify additional command arguments for clangd
          -- opts.cmd = {
          --   "clangd",
          -- }
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable the 'K' keymap
      keys[#keys + 1] = { "<M-n>", false }
      keys[#keys + 1] = { "<M-p>", false }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
}
