-- function _G.set_terminal_keymaps()
--   local opts = { noremap=true, buffer = 0 }
--   vim.keymap.set('t', '<c-esc>', '<esc>', opts)
--   vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--   vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
--
--   vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
--   vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
--   vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
--   vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
-- end

return {
  -- Color highlight
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup()
    end
  },

  -- "machakann/vim-highlightedyank",

  -- UI improvement
  -- dashboard
  "echasnovski/mini.starter",
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
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true }
  },

  -- tabline
  { 'akinsho/bufferline.nvim', version = "v3.*", dependencies = 'nvim-tree/nvim-web-devicons' },

  -- toggle terminal
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    branch = "main",
    config = function()
      require("toggleterm").setup {
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
      }

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      -- vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
    end,
    keys = {
      -- { "n", "<leader>tt", "<cmd>ToggleTerm<cr>" },
      { "<M-1>", "<cmd>exe v:count1 . 'ToggleTerm direction=horizontal'<cr>" },
      { "<M-2>", "<cmd>exe v:count1 . 'ToggleTerm direction=vertical'<cr>" },
      { "<M-3>", "<cmd>exe v:count1 . 'ToggleTerm direction=float'<cr>" },
    }
  },


  -- GUI Keymaps
  "anuvyklack/hydra.nvim",
  "folke/which-key.nvim",

  -- Colorscheme section
  "tjdevries/colorbuddy.nvim",
  "ellisonleao/gruvbox.nvim",
  -- "gruvbox-community/gruvbox",
  -- "folke/tokyonight.nvim",
  -- "rebelot/kanagawa.nvim",
  -- "B4mbus/oxocarbon-lua.nvim",
  -- { "catppuccin/nvim", as = "catppuccin" },
  -- use 'navarasu/onedark.nvim'
  -- use({
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = function()
  --     vim.cmd('colorscheme rose-pine')
  --   end
  -- })
  -- { "shaunsingh/oxocarbon.nvim", build = "./install.sh" },

}
