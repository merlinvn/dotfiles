return {
  -- lazyvim.plugins.coding
  {
    "nvim-cmp",
    opts = function(_, opts)
      local bordered = require("cmp.config.window").bordered
      return vim.tbl_deep_extend("force", opts, {
        window = {
          completion = bordered("rounded"),
          documentation = bordered("double"),
        },
      })
    end,
  },
  -- lazyvim.plugins.editor
  {
    "which-key.nvim",
    opts = { win = { border = "rounded" } },
  },
  -- lazyvim.plugins.lsp
  {
    "nvim-lspconfig",
    opts = function(_, opts)
      -- Set LspInfo border
      require("lspconfig.ui.windows").default_options.border = "double"
      return opts
    end,
  },
  {
    "mason.nvim",
    opts = {
      ui = { border = "double" },
    },
  },
  -- lazyvim.plugins.ui
  {
    "noice.nvim",
    opts = {
      presets = { lsp_doc_border = true },
    },
  },
}
