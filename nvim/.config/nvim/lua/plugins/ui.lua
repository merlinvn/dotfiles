local colorMyPencils = function(colorscheme)
  -- vim.g.gruvbox_contrast_dark = 'hard'
  -- vim.g.gruvbox_italic = 1
  -- vim.g.gruvbox_transparent_bg = 1
  -- vim.g.gruvbox_termcolors = 256

  vim.cmd("colorscheme " .. colorscheme)

  -- local hl = function(thing, opts)
  --   vim.api.nvim_set_hl(0, thing, opts)
  -- end

  -- hl("SignColumn", {
  --   bg = "none",
  -- })
  --
  -- hl("ColorColumn", {
  --   ctermbg = 0,
  --   bg = "#333333",
  -- })
  --
  -- hl("CursorLineNR", {
  --   -- fg = "orange",
  --   -- bg = "None"
  -- })
  --
  -- hl("Normal", {
  --   -- ctermbg = "None",
  --   -- guibg = 0,
  --   bg = "#282828"
  --   -- bg = "" -- transparent background
  -- })
  --
  -- -- hl("NormalFloat", {
  -- --   -- ctermbg = "None",
  -- --   -- guibg = 0,
  -- --   bg = "#1d2021"
  -- --   -- bg = "" -- transparent background
  -- -- })
  --
  -- hl("LineNr", {
  --   fg = "gray"
  -- })
  --
  -- -- hl("netrwDir", {
  -- --   fg = "#5eacd3"
  -- -- })
  --
  -- hl("IncSearch", {
  --   bg = "orange",
  --   fg = "black"
  -- })
  --
  -- hl("CurSearch", {
  --   bg = "orange",
  --   fg = "#1d2021"
  -- })
end

return {
  -- Color highlight
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  -- "machakann/vim-highlightedyank",

  -- UI improvement
  -- dashboard
  {
    "echasnovski/mini.starter",
    config = function()
      require("mini.starter").setup()
    end,
  },
  -- "mhinz/vim-startify",
  -- "goolord/alpha-nvim",
  -- use({
  --   "folke/noice.nvim",
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- })

  -- -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    opts = {
      options = {
        icons_enabled = true,
        -- theme = 'ayu_dark',
        -- theme = "auto",
        theme = "gruvbox_dark",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {},
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filename",
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " ",
            },
          },
          "encoding",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" },
    },
  },

  -- toggle terminal
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    branch = "main",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 10
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.33
          end
          return 20
        end,
        open_mapping = [[<C-t>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        -- direction = "float",
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          -- The border key is *almost* the same as 'nvim_win_open'
          -- see :h nvim_win_open for details on borders however
          -- the 'curved' border is a custom border type
          -- not natively supported but implemented in this plugin.
          -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
          border = "curved",
          -- width = <value>,
          -- height = <value>,
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      -- vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
    end,
    keys = {
      -- { "n", "<leader>tt", "<cmd>ToggleTerm<cr>" },
      { "<M-1>", "<cmd>exe v:count1 . 'ToggleTerm direction=horizontal'<cr>" },
      { "<M-2>", "<cmd>exe v:count1 . 'ToggleTerm direction=vertical'<cr>" },
      { "<M-3>", "<cmd>exe v:count1 . 'ToggleTerm direction=float'<cr>" },
    },
  },

  -- GUI Keymaps

  -- Colorscheme section
  "tjdevries/colorbuddy.nvim",
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme gruvbox]])
      colorMyPencils("gruvbox")
    end,
    enabled = false,
  },

  {
    "arturgoms/moonbow.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme gruvbox]])
      colorMyPencils("moonbow")
    end,
    enabled = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
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
      colorMyPencils("catppuccin")
    end,
    enabled = false,
  },
  -- "navarasu/onedark.nvim",

  -- "gruvbox-community/gruvbox",
  -- "folke/tokyonight.nvim",
  -- "rebelot/kanagawa.nvim",
  -- "B4mbus/oxocarbon-lua.nvim",
  -- use({
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = function()
  --     vim.cmd('colorscheme rose-pine')
  --   end
  -- })
  -- { "shaunsingh/oxocarbon.nvim", build = "./install.sh" },
}
