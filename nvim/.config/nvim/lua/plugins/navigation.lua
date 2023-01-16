return {
  -- file marker & navigation
  "ThePrimeagen/harpoon",

  -- Navigation
  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat"
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
