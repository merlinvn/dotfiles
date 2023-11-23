local tsjs_formatter = function(ft)
  if
    require("helpers.path").root_has_file({
      ".eslintrc.json",
      ".eslintrc",
    })
  then
    -- return require("formatter.filetypes." .. ft).eslint
    return require("formatter.filetypes." .. ft).prettier
  end
  return require("formatter.filetypes." .. ft).prettier
end

return {
  {
    "mhartington/formatter.nvim",
    enabled = false,
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      -- Utilities for creating configurations
      local defaults = require("formatter.defaults")
      local util = require("formatter.util")

      -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
      require("formatter").setup({
        -- Enable or disable logging
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        -- All formatter configurations are opt-in
        filetype = {
          -- Formatter configurations for filetype "lua" go here
          -- and will be executed in order
          lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            -- require("formatter.filetypes.lua").stylua,

            -- You can also define your own configuration
            function()
              -- Supports conditional formatting
              if util.get_current_buffer_file_name() == "special.lua" then
                return nil
              end

              -- Full specification of configurations is down below and in Vim help
              -- files
              return {
                exe = "stylua",
                args = {
                  "--search-parent-directories",
                  "--stdin-filepath",
                  util.escape_path(util.get_current_buffer_file_path()),
                  "--",
                  "-",
                },
                stdin = true,
              }
            end,
          },
          typescriptreact = {
            -- require("formatter.filetypes.typescriptreact").prettier,
            tsjs_formatter("typescriptreact"),
          },
          typescript = {
            tsjs_formatter("typescript"),
          },
          javascript = {
            tsjs_formatter("javascript"),
          },
          javascriptreact = {
            tsjs_formatter("javascriptreact"),
          },
          json = {
            require("formatter.filetypes.json").prettier,
          },
          cpp = {
            require("formatter.filetypes.cpp").clangformat,
          },
          rust = {
            require("formatter.filetypes.rust").rustfmt,
          },
          yaml = {
            require("formatter.filetypes.yaml").prettier,
          },
          python = {
            require("formatter.filetypes.python").autopep8,
          },
          astro = {
            util.withl(defaults.prettier, "astro"),
          },
          -- Use the special "*" filetype for defining formatter configurations on
          -- any filetype
          ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace,
            function()
              -- Ignore already configured types.
              local defined_types = require("formatter.config").values.filetype
              if defined_types[vim.bo.filetype] ~= nil then
                return nil
              end

              vim.cmd([[LspZeroFormat]])
              -- vim.lsp.buf.format({ async = true })
            end,
          },
        },
      })
      -- autoformat on save
      local FormatterGroup =
        vim.api.nvim_create_augroup("FormatterGroup", { clear = true })
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        group = FormatterGroup,
        pattern = "*",
        callback = function()
          vim.cmd([[FormatWrite]])
        end,
      })
    end,
  },
}
