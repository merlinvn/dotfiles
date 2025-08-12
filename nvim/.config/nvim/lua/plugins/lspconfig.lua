return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Merge servers
      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        ocamllsp = {
          mason = false,
        },
        gleam = {
          mason = false,
        },
      })

      -- Merge setup
      opts.setup = vim.tbl_deep_extend("force", opts.setup or {}, {
        clangd = function(_, clangd_opts)
          clangd_opts.mason = false
          clangd_opts.cmd = {
            "/opt/homebrew/opt/llvm/bin/clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          }
        end,
        rust_analyzer = function()
          return true
        end,
      })

      -- Merge keymap modifications
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<M-n>", false }
      keys[#keys + 1] = { "<M-p>", false }
    end,
  },
}
