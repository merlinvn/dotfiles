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
    on_attach = function(_, bufnr)
      -- Hover actions
      -- vim.keymap.set("n", "<C-Space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      -- vim.keymap.set("n", "<Leader>.", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
};


-- rt.setup(opts);
