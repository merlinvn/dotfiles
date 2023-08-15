local M = {}

M.opts = function()
  local null_ls = require("null-ls")
  return {

    root_dir = require("null-ls.utils").root_pattern(
      ".null-ls-root",
      ".neoconf.json",
      "Makefile",
      ".git"
    ),
    sources = {
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.diagnostics.eslint_d.with({
        diagnostics_format = "[eslint] #{m}\n(#{c})",
      }),
      null_ls.builtins.formatting.prettierd.with({
        condition = function(utils)
          -- root has file .prettierrc and not .eslintrc.json
          return utils.root_has_file({ ".prettierrc" })
            and not utils.root_has_file({ ".eslintrc.json", ".eslintrc" })
        end,
      }),
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.diagnostics.flake8,
      null_ls.builtins.formatting.autopep8,
      -- null_ls.builtins.diagnostics.fish
      null_ls.builtins.formatting.clang_format,
      null_ls.builtins.formatting.cmake_format,
      null_ls.builtins.formatting.gofmt,
    },
  }
end

return M
