vim.opt.termguicolors = true

-- local get_number_of_buffers = function()
--   local count = 0
--   local scratch = 0
--   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--     if vim.api.nvim_buf_get_option(buf, "modified") and vim.api.nvim_buf_get_option(buf, "buftype") ~= "nofile" then
--       count = count + 1
--     end
--     if vim.api.nvim_buf_get_option(buf, "buftype") == "nofile" then
--       scratch = scratch + 1
--     end
--   end
--   return { count, #vim.api.nvim_list_bufs() - scratch }
-- end
local mode = "tabs"
require("bufferline").setup {
  highlights = {
    tab = {
      fg = "#ebdbb2",
      bg = "#1d2021",
    },
    tab_selected = {
      fg = "orange",
      bg = "#1d2021",
    },
  },
  options = {
    mode = mode,
    numbers = "ordinal",
    -- mode = "buffers",
    -- numbers = "none",
    diagnostics = "nvim_lsp",
    indicator = {
      icon = '▎',
      style = 'icon',
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
        separator = true
      }
    },
    color_icons = true,
    show_buffer_icons = false,
    always_show_bufferline = true,
    show_close_icon = false,
    show_tab_indicators = false,
    -- show_tab_indicators = true,
    separator_style = "thick",
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
  }
}


if mode == "buffers" then
  vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true, desc = "Prev buffer" })
  vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "Next buffer" })
  vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true, desc = "Prev buffer" })
  vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "Next buffer" })
  vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "Next buffer" })
  vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true, desc = "Prev buffer" })
  vim.keymap.set("n", "gb", ":BufferLineCycleNext<cr>", { noremap = true, silent = true, desc = "next buffer" })
  vim.keymap.set("n", "gB", ":bprev<cr>", { noremap = true, silent = true, desc = "next buffer" })

  vim.keymap.set("n", "<leader>bb", ":BufferLinePick<CR>", { noremap = true, silent = true, desc = "Buffer pick" })
  vim.keymap.set("n", "<C-b>", ":BufferLinePick<CR>", { noremap = true, silent = true, desc = "Buffer pick" })
  vim.keymap.set("n", "<leader>bw", ":BufferLinePickClose<CR>", { noremap = true, silent = true, desc = "Buffer close" })
  vim.keymap.set("n", "<leader>br", ":BufferLineCloseRight<CR>",
    { noremap = true, silent = true, desc = "Close all right" })
  vim.keymap.set("n", "<leader>bl", ":BufferLineCloseLeft<CR>",
    { noremap = true, silent = true, desc = "Close all left" })
  vim.keymap.set("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>",
    { noremap = true, silent = true, desc = "Close others" })
  vim.keymap.set("n", "<leader>ba", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>:bdelete<CR>",
    { noremap = true, silent = true, desc = "Close all" })
  vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true, desc = "Close current" })
else
  vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
  vim.keymap.set("n", "<leader>bn", ":bnext<cr>", { noremap = true, silent = true, desc = "Next buffer" })
  vim.keymap.set("n", "<leader>bp", ":bprev<cr>", { noremap = true, silent = true, desc = "Prev buffer" })
  vim.keymap.set("n", "gb", ":bnext<cr>", { noremap = true, silent = true, desc = "next buffer" })
  vim.keymap.set("n", "gB", ":bprev<cr>", { noremap = true, silent = true, desc = "next buffer" })
end

for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    require("bufferline").go_to_buffer(i, true)
  end, { noremap = true, silent = true, desc = "Go to tab " .. i })
end

vim.keymap.set("n", "<leader>0", function()
  require("bufferline").go_to_buffer(-1, true)
end, { noremap = true, silent = true, desc = "Go to last tab" })
