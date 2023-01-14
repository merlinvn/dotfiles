vim.opt.termguicolors = true

local get_number_of_buffers = function()
  local count = 0
  local scratch = 0
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, "modified") and vim.api.nvim_buf_get_option(buf, "buftype") ~= "nofile" then
      count = count + 1
    end
    if vim.api.nvim_buf_get_option(buf, "buftype") == "nofile" then
      scratch = scratch + 1
    end
  end
  return { count, #vim.api.nvim_list_bufs() - scratch }
end

require("bufferline").setup {
  options = {
    mode = "tabs",
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    indicator = {
      icon = '▎',
      style = 'underline',
    },
    --- count is an integer representing total count of errors
    --- level is a string "error" | "warning"
    --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info") to number of errors for each level.
    --- this should return a string
    --- Don't get too fancy as this function will be executed a lot
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    color_icons = true,
    show_buffer_icons = true,
    custom_areas = {
      left = function()
        local count = get_number_of_buffers();
        return {
          {
            text = "" .. count[1],
            guifg = "orange",
            guibg = "#1d2021",
          },
          {
            text = "/",
            guifg = "#ebdbb2",
            guibg = "#1d2021",
          },
          {
            text = "" .. count[2],
            guifg = "#ebdbb2",
            guibg = "#1d2021",
          },
        }
      end
    }
  }
}


-- vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>")
vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>")

for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    require("bufferline").go_to_buffer(i, true)
  end)
end
