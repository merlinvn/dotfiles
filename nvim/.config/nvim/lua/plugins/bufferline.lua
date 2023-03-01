local mode = "tabs"
local keys = {}

if mode == "buffers" then
  keys = {
    {
      "[b",
      "<cmd>BufferLineCyclePrev<cr>",
      { noremap = true, silent = true, desc = "Prev buffer" },
    },
    {
      "]b",
      "<cmd>BufferLineCycleNext<cr>",
      { noremap = true, silent = true, desc = "Next buffer" },
    },
    {
      "<leader>bn",
      ":BufferLineCycleNext<cr>",
      { noremap = true, silent = true, desc = "Next buffer" },
    },
    {
      "<leader>bp",
      ":BufferLineCyclePrev<cr>",
      { noremap = true, silent = true, desc = "Prev buffer" },
    },
    {
      "gb",
      ":BufferLineCycleNext<cr>",
      { noremap = true, silent = true, desc = "next buffer" },
    },
    {
      "gB",
      ":bprev<cr>",
      { noremap = true, silent = true, desc = "next buffer" },
    },

    {
      "<leader>bb",
      ":BufferLinePick<CR>",
      { noremap = true, silent = true, desc = "Buffer pick" },
    },
    {
      "<C-b>",
      ":BufferLinePick<CR>",
      { noremap = true, silent = true, desc = "Buffer pick" },
    },
    {
      "<leader>bw",
      ":BufferLinePickClose<CR>",
      { noremap = true, silent = true, desc = "Buffer close" },
    },
    {
      "<leader>br",
      ":BufferLineCloseRight<CR>",
      { noremap = true, silent = true, desc = "Close all right" },
    },
    {
      "<leader>bl",
      ":BufferLineCloseLeft<CR>",
      { noremap = true, silent = true, desc = "Close all left" },
    },
    {
      "<leader>bo",
      ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>",
      { noremap = true, silent = true, desc = "Close others" },
    },
    {
      "<leader>ba",
      ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>:bdelete<CR>",
      { noremap = true, silent = true, desc = "Close all" },
    },
    {
      "<leader>bd",
      ":bdelete<CR>",
      { noremap = true, silent = true, desc = "Close current" },
    },
  }
else
  keys = {
    { "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" } },
    { "]b", "<cmd>bnext<cr>", { desc = "Next buffer" } },
    {
      "<leader>bn",
      ":bnext<cr>",
      { noremap = true, silent = true, desc = "Next buffer" },
    },
    {
      "<leader>bp",
      ":bprev<cr>",
      { noremap = true, silent = true, desc = "Prev buffer" },
    },
    {
      "gb",
      ":bnext<cr>",
      { noremap = true, silent = true, desc = "next buffer" },
    },
    {
      "gB",
      ":bprev<cr>",
      { noremap = true, silent = true, desc = "next buffer" },
    },
  }
end

return {
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      options = {
        numbers = "ordinal",
        mode = mode,
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
        diagnostics_indicator = function(
          count,
          level,
          diagnostics_dict,
          context
        )
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
    keys = keys,
    config = function(_, opts)
      require("bufferline").setup(opts)
      for i = 1, 9 do
        vim.keymap.set("n", "<leader>" .. i, function()
          require("bufferline").go_to_buffer(i, true)
        end, { noremap = true, silent = true, desc = "Go to tab " .. i })
      end

      vim.keymap.set("n", "<leader>0", function()
        require("bufferline").go_to_buffer(-1, true)
      end, { noremap = true, silent = true, desc = "Go to last tab" })
    end,
  },
}
