return {
  {
    "echasnovski/mini.fuzzy",
    event = "BufEnter",
    config = function(_, opts)
      require("mini.fuzzy").setup(opts)
    end,
  },
  -- manage session
  {
    "echasnovski/mini.sessions",
    config = function()
      require("mini.sessions").setup({})
    end,
  },
  -- underline or highlight word at cursor
  {
    "echasnovski/mini.cursorword",
    event = "BufReadPre",
    config = function()
      require("mini.cursorword").setup({})
    end,
  },

  {
    "echasnovski/mini.comment",
    event = "BufReadPre",
    config = function()
      require("mini.comment").setup({})
    end,
  },
  -- remove buffers but reserver window layout
  {
    "echasnovski/mini.bufremove",
    event = "BufReadPre",
    version = false,
    keys = {
      {
        "<leader>bd",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>bD",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Delete Buffer (Force)",
      },
      {
        "<leader>q",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>Q",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Delete Buffer (Force)",
      },
    },
  },
  -- {
  --   "echasnovski/mini.align",
  --   event = "VeryLazy",
  --   config = function()
  --     require("mini.align").setup({})
  --   end,
  -- },
}
