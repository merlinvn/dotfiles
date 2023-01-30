local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
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
})

-- local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

-- null_ls.setup({
--   sources = {
--     null_ls.builtins.diagnostics.eslint.with({
--       diagnostics_format = '[eslint] #{m}\n(#{c})'
--     }),
--     -- null_ls.builtins.diagnostics.fish
--   },
--   -- on_attach = function(client, bufnr)
--   --   if client.server_capabilities.documentFormattingProvider then
--   --     vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
--   --     vim.api.nvim_create_autocmd("BufWritePre", {
--   --       group = augroup_format,
--   --       buffer = 0,
--   --       callback = function() vim.lsp.buf.formatting_seq_sync() end
--   --     })
--   --   end
--   --   if client.server_capabilities.documentRangeFormattingProvider then
--   --     vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting_seq_sync({})<CR>")
--   --   end
--   -- end,
-- })
