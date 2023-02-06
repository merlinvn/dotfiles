return {
  {
    "sbdchd/neoformat",
    keys = {
      { "<leader>F", "<cmd>Neoformat prettierd<cr>", noremap = true, silent = true, desc = "Neoformat" }
    },
    config = function()
      vim.g.neoformat_try_node_exe = 1
    end
  }
}
