local M = {}

M.config = function()
  require("catppuccin").setup({
    flavor = "mocha",
    term_colors = true,
    -- color_overrides = {
    --   mocha = {
    --     base = "#000000",
    --     mantle = "#000000",
    --     crust = "#000000",
    --   },
    -- },
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      notify = false,
      mini = true,
      bufferline = true,
      harpoon = true,
      leap = true,
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  })
  require("plugins.config.color").colorMyPencils("catppuccin")
end

return M
