local M = {}
M.config = function()
  require("catppuccin").setup({
    flavor = "mocha",
    term_colors = true,
    color_overrides = {
      -- mocha = {
      --   text = "#f5f5f5",
      --   subtext0 = "#c7c7c7",
      --   subtext1 = "#dedede",
      --   overlay0 = "#878787",
      --   overlay1 = "#9c9c9c",
      --   overlay2 = "#b3b3b3",
      --   surface0 = "#454545",
      --   surface1 = "#595959",
      --   surface2 = "#707070",
      --   base = "#202020",
      --   mantle = "#161616",
      --   crust = "#121212",
      -- },
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      notify = false,
      mini = true,
      mason = true,
      bufferline = true,
      harpoon = true,
      leap = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      -- dap = {
      --   enabled = true,
      --   enable_ui = true, -- enable nvim-dap-ui
      -- },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  })
  vim.cmd("colorscheme catppuccin")
end

return M
