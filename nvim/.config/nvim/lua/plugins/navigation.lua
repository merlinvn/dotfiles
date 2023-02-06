return {
  -- file marker & navigation
  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<cr>", mode = { "n", "v" }, noremap = true,
        silent = true, desc = "Add file to harpoon" },
      { "<leader>'", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", mode = { "n", "v" }, noremap = true,
        silent = true, desc = "Toggle harpoon quick menu" },
      { "<C-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", mode = { "n", "v" }, noremap = true, silent = true,
        desc = "Navigate to harpoon file 1" },
      { "<C-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", mode = { "n", "v" }, noremap = true, silent = true,
        desc = "Navigate to harpoon file 2" },
      { "<C-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", mode = { "n", "v" }, noremap = true, silent = true,
        desc = "Navigate to harpoon file 3" },
      { "<C-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", mode = { "n", "v" }, noremap = true, silent = true,
        desc = "Navigate to harpoon file 4" },
    },
  },

  -- Navigation
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = {
      "tpope/vim-repeat",
      { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } }
    },
    opts = {
      max_phase_one_targets = nil,
      highlight_unlabeled_phase_one_targets = false,
      max_highlighted_traversal_targets = 20,
      case_sensitive = false,
      -- Sets of characters that should match each other.
      -- Obvious candidates are braces and quotes ('([{', ')]}', '`"\'').
      equivalence_classes = { ' \t\r\n', },
      substitute_chars = {},
      -- Leaving the appropriate list empty effectively disables "smart" mode,
      -- and forces auto-jump to be on or off.
      -- safe_labels = { . . . },
      safe_labels =
      -- { "s", "f", "n", "u", "t",
      --   "S", "F", "N", "L", "H", "M", "U", "G", "T", "Z" },
      { "s", "f", "n", "u", "t",
        "a", "d", "j", "k", "l", "m", "u", "u", "e", "r" },
      labels =
      { "s", "f", "n",
        "j", "k", "l", "h", "o", "d", "w", "e", "m", "b",
        "u", "y", "v", "r", "g", "t", "c", "x", "z",
        "S", "F", "N",
        "J", "K", "L", "H", "O", "D", "W", "E", "M", "B",
        "U", "Y", "V", "R", "G", "T", "C", "X", "Z" },
      special_keys = {
        repeat_search = '<enter>',
        next_phase_one_target = '<enter>',
        next_target = { '<enter>', ';' },
        prev_target = { '<tab>', ',' },
        next_group = '<space>',
        prev_group = '<tab>',
        multi_accept = '<enter>',
        multi_revert = '<backspace>',
      },
    },
    keys = {
      { "s", "<plug>(leap-forward-to)", mode = { "n", "v" }, noremap = true, silent = true },
      { "S", "<plug>(leap-backward-to)", mode = { "n", "v" }, noremap = true, silent = true },

      { "z", "<plug>(leap-forward-till)", mode = { "v", "o" }, noremap = true, silent = true },
      { "Z", "<plug>(leap-backward-till)", mode = { "v", "o" }, noremap = true, silent = true }
    }
  },
  -- {
  --   "justinmk/vim-sneak",
  --   dependencies = {
  --     "tpope/vim-repeat"
  --   }
  -- },
  --  {
  --   "phaazon/hop.nvim",
  --   branch = 'v2',
  --   as = "hop",
  --   config = function()
  --     -- you can configure Hop the way you like here; see :h hop-config
  --     require "hop".setup { keys = "arsgmeioqwfpbjluyzxcdvkhtn" }
  --   end
  -- },

  -- "ggandor/lightspeed.nvim"
  -- vim.g.any_jump_disable_default_keybindings = 1
  --  "pechorin/any-jump.vim",

}
