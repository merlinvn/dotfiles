return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup({
        settings = {
          save_on_toggle = false,
          sync_on_ui_close = false,
        },
      })
    end,
    keys = function()
      local harpoon = require("harpoon")
      return {
        {
          "<leader>a",
          function()
            require("harpoon"):list():append()
          end,
          desc = "Harpoon current file",
        },
        {
          "<leader>h",
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Open harpoon window",
        },
        {
          "<leader>j",
          function()
            harpoon:list():select(1)
          end,
          desc = "Select harpoon item 1",
        },
        {
          "<leader>k",
          function()
            harpoon:list():select(2)
          end,
          desc = "Select harpoon item 2",
        },
        {
          "<leader>l",
          function()
            harpoon:list():select(3)
          end,
          desc = "Select harpoon item 3",
        },
        {
          "<leader>m",
          function()
            harpoon:list():select(4)
          end,
          desc = "Select harpoon item 4",
        },
        -- {
        --   "<leader>hn",
        --   function()
        --     harpoon:list():next()
        --   end,
        --   desc = "Go to next harpoon item",
        -- },
        -- {
        --   "<leader>hp",
        --   function()
        --     harpoon:list():prev()
        --   end,
        --   desc = "Go to prev harpoon item",
        -- },
      }
    end,
  },
}
