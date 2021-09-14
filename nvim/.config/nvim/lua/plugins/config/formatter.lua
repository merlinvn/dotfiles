-- Ref
-- https://www.reddit.com/r/neovim/comments/le1duu/nvim_lsp_and_typescript_eslint_and_prettier/
-- https://github.com/mhartington/formatter.nvim/blob/master/CONFIG.md

local M = {}

function M.setup()
  require("formatter").setup(
    {
      logging = true,
      filetype = {
        -- javascript = {
        --   -- prettier
        --   function()
        --     return {
        --       exe = "prettier",
        --       args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
        --       stdin = true
        --     }
        --   end
        -- },
        lua = {
          -- luafmt
          function()
            return {
              exe = "luafmt",
              args = {"--indent-count", 2, "--stdin"},
              stdin = true
            }
          end
        }
      }
    }
  )
end

return M
