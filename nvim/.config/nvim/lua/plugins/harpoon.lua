return {}
-- return {
--   {
--     "ThePrimeagen/harpoon",
--     branch = "harpoon2",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     keys = function()
--       local harpoon = require("harpoon")
--       local keys = {
--         {
--           "<leader>H",
--           function()
--             require("harpoon"):list():add()
--           end,
--           desc = "Harpoon current file",
--         },
--         {
--           "<leader>h",
--           function()
--             harpoon.ui:toggle_quick_menu(harpoon:list())
--           end,
--           desc = "Open harpoon window",
--         },
--         {
--           "<M-1>",
--           function()
--             harpoon:list():select(1)
--           end,
--           desc = "Select harpoon item 1",
--         },
--         {
--           "<M-2>",
--           function()
--             harpoon:list():select(2)
--           end,
--           desc = "Select harpoon item 2",
--         },
--         {
--           "<M-3>",
--           function()
--             harpoon:list():select(3)
--           end,
--           desc = "Select harpoon item 3",
--         },
--         {
--           "<M-4>",
--           function()
--             harpoon:list():select(4)
--           end,
--           desc = "Select harpoon item 4",
--         },
--         -- {
--         --   "<leader>hn",
--         --   function()
--         --     harpoon:list():next()
--         --   end,
--         --   desc = "Go to next harpoon item",
--         -- },
--         -- {
--         --   "<leader>hp",
--         --   function()
--         --     harpoon:list():prev()
--         --   end,
--         --   desc = "Go to prev harpoon item",
--         -- },
--       }
--       return keys
--     end,
--   },
-- }
