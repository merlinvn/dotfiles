local M = {}
M.setup = function()
  require("legendary").setup(M.opts)
end
M.opts = {
  which_key = {
    auto_register = true,
  },
  keymaps = {
    -- {
    --   "<leader>rl",
    --   ":w<cr>:luafile %<CR>",
    --   opts = { silent = true, desc = "Reload current luafile" },
    -- },
  },
  commands = {},
  funcs = {},
  autocmds = {
    -- Create autocmds and augroups
    -- { "BufWritePre", vim.lsp.buf.format, description = "Format on save" },
    {
      name = "YankHighlight",
      clear = true,
      {
        "TextYankPost",
        function()
          vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 300,
          })
        end,
        opts = {
          pattern = "*",
          -- desc = "Highlight on yank",
        },
      },
    },
    {
      name = "MerlinVn",
      clear = true,
      description = "MerlinVn autogroup",
      {
        "BufWritePre",
        ":%s/\\s\\+$//e",
        -- desc = "remove trailing spaces at the end of all lines",
        opts = {
          pattern = "*",
        },
      },
      {
        "VimResized",
        function()
          vim.cmd("tabdo wincmd =")
        end,
        -- description = "resize splis if window got resized",
      },
      {
        -- go to last loc when opening a buffer
        "BufReadPost",
        function()
          local mark = vim.api.nvim_buf_get_mark(0, '"')
          local lcount = vim.api.nvim_buf_line_count(0)
          if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
          end
        end,
      },
      {
        "FileType",
        function(event)
          vim.bo[event.buf].buflisted = false
          vim.keymap.set(
            "n",
            "q",
            "<cmd>close<cr>",
            { buffer = event.buf, silent = true }
          )
        end,
        opts = {
          pattern = {
            "qf",
            "help",
            "man",
            "notify",
            "lspinfo",
            "spectre_panel",
            "startuptime",
            "tsplayground",
            "PlenaryTestPopup",
          },
        },
        -- description = "Close buffer on q",
      },
      {
        "FileType",
        function()
          vim.opt_local.wrap = true
          vim.opt_local.spell = true
        end,
        opts = {
          pattern = {
            "markdown",
            "gitcommit",
          },
        },
        -- description = "wrap and spell for markdown and gitcommit",
      },
    },
  },
}

return M
