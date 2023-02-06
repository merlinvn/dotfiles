return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    opts = function()

      local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
      local event = "BufWritePre" -- or "BufWritePost"
      local async = event == "BufWritePost"
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = '[eslint] #{m}\n(#{c})'
          }),
          -- null_ls.builtins.diagnostics.fish
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<Leader>cf", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf(), timeout_ms = 5000 })
            end, { buffer = bufnr, desc = "[lsp] format" })

            -- format on save
            vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
            vim.api.nvim_create_autocmd(event, {
              buffer = bufnr,
              group = group,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, async = async })
              end,
              desc = "[lsp] format on save",
            })
          end

          if client.supports_method("textDocument/rangeFormatting") then
            vim.keymap.set("x", "<Leader>cf", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf(), timeout_ms = 5000 })
            end, { buffer = bufnr, desc = "[lsp] format" })
          end
        end,
      }



    end
  }, -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
}
