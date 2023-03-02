local M = {}

M.opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = "[eslint] #{m}\n(#{c})",
          }),
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.flake8,
          null_ls.builtins.formatting.prettierd,
          -- null_ls.builtins.diagnostics.fish
          -- null_ls.builtins.formatting.clang_format
          -- null_ls.builtins.formatting.cmake_format
          -- null_ls.builtins.formatting.gofmt
        },
      }
    end

return M
