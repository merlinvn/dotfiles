return {
  {
    enabled= false,
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lint").linters_by_ft = {
        markdown = {
          -- "vale",
          "markdownlint",
        },
        -- typescript = { "eslint_d" },
        -- typescriptreact = { "eslint_d" },
        -- javascript = { "eslint_d" },
        -- javascriptreact = { "eslint_d" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}