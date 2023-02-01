local status, rt = pcall(require, "rust-tools")
if (not status) then return end

local opts = {
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
    on_attach = require("merlinvn.lsp").lsp_on_attach_rust,
  },
};


rt.setup(opts);
