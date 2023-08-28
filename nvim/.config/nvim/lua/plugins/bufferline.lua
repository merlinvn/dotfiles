return {
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = { "BufReadPre", "BufNewFile" },

    opts = {
      options = {
        numbers = "ordinal",
        mode = "tabs",
        -- mode = "buffers",
        -- numbers = "none",
        diagnostics = "nvim_lsp",
        indicator = {
          icon = "▎",
          style = "icon",
        },
        name_formatter = function(buf)
          -- buf contains:
          -- name                | str        | the basename of the active file
          -- path                | str        | the full path of the active file
          -- bufnr (buffer only) | int        | the number of the active buffer
          -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
          -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
          ---@diagnostic disable-next-line: undefined-field
          if string.find(buf.name, "#toggleterm#") then
            return "Terminal"
          end
          ---@diagnostic disable-next-line: undefined-field
          return buf.name
        end,
        --- count is an integer representing total count of errors
        --- level is a string "error" | "warning"
        --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info") to number of errors for each level.
        --- this should return a string
        --- Don't get too fancy as this function will be executed a lot
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
        color_icons = true,
        show_buffer_icons = false,
        always_show_bufferline = true,
        show_close_icon = false,
        show_tab_indicators = false,
        -- show_tab_indicators = true,
        separator_style = "thin",
        tab_size = 10,
        enforce_regular_tabs = false,
        -- custom_areas = {
        --   left = function()
        --     local count = get_number_of_buffers();
        --     return {
        --       {
        --         text = "" .. count[1],
        --         guifg = "orange",
        --         guibg = "#1d2021",
        --       },
        --      {
        --         text = "/",
        --         guifg = "#ebdbb2",
        --         guibg = "#1d2021",
        --       },
        --       {
        --         text = "" .. count[2],
        --         guifg = "#ebdbb2",
        --         guibg = "#1d2021",
        --       },
        --     }
        --   end
        -- }
      },
    },
  },
}
