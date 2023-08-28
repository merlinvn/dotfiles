return {
  {
    "folke/trouble.nvim",
    event = "BufReadPre",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        icons = false,
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
    keys = {
      {
        "<leader>xX",
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
        silent = true,
        noremap = true,
        desc = "Workspace Diagnostics",
      },
      {
        "<leader>xx",
        "<cmd>TroubleToggle document_diagnostics<cr>",
        silent = true,
        noremap = true,
        desc = "Document Diagnostics",
      },
      {
        "<leader>xl",
        "<cmd>TroubleToggle loclist<cr>",
        silent = true,
        noremap = true,
        desc = "Loclist",
      },
      {
        "<leader>xq",
        "<cmd>TroubleToggle quickfix<cr>",
        silent = true,
        noremap = true,
        desc = "Quickfix",
      },
      {
        "<leader>xr",
        "<cmd>TroubleToggle lsp_references<cr>",
        silent = true,
        noremap = true,
        desc = "LSP References",
      },
    },
  },
}
