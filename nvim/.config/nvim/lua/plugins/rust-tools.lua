return {
  {
    "simrat39/rust-tools.nvim",
    event = "VeryLazy",
    opts = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            assist = {
              importEnforceGranularity = true,
              importPrefix = "crate"
            },
            cargo = {
              allFeatures = true
            },
            checkOnSave = {
              -- default: `cargo check`
              command = "clippy"
            },
          },
          inlayHints = {
            lifetimeElisionHints = {
              enable = true,
              useParameterNames = true
            },
          },
        },
        on_attach = require("plugins.lsp.keymaps").lsp_on_attach_rust,
      },

    }
  }
}
