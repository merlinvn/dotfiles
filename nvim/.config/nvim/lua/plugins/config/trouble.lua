local M = {}
M.keys = {
  -- {
  --   "<leader>xx",
  --   "<cmd>TroubleToggle<cr>",
  --   silent = true,
  --   noremap = true,
  --   desc = "Toggle Trouble",
  -- },
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
    "xr",
    "<cmd>TroubleToggle lsp_references<cr>",
    silent = true,
    noremap = true,
    desc = "LSP References",
  },
}
return M
