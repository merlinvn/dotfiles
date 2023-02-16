return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.norg.concealer"] = {
          config = {
            folds = false,
          },
        }, -- Adds pretty icons to your documents
        ["core.norg.dirman"] = { -- Manages Neorg workspaces
          config = {
            default_workspace = "notes",
            workspaces = {
              notes = "~/My_zet/neorg",
            },
          },
        },
        ["core.integrations.telescope"] = {},
      },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-neorg/neorg-telescope" },
    },
    keys = {
      { "<leader>nn", ":Neorg<CR>", desc = "Neoorg menu" },
      { "<leader>ni", ":Neorg index<CR>", desc = "Neoorg index" },
      { "<leader>nd", ":Neorg diary<CR>", desc = "Neoorg diary" },
      { "<leader>nt", ":Neorg todo<CR>", desc = "Neoorg todo" },
    },
    config = function(_, opts)
      require("neorg").setup(opts)

      local neorg_callbacks = require("neorg.callbacks")

      neorg_callbacks.on_event(
        "core.keybinds.events.enable_keybinds",
        function(_, keybinds)
          -- Map all the below keybinds only when the "norg" mode is active
          keybinds.map_event_to_mode("norg", {
            n = { -- Bind keys in normal mode
              {
                "<localleader>tl",
                "core.integrations.telescope.find_linkable",
              },
            },

            i = { -- Bind in insert mode
              { "<C-l>", "core.integrations.telescope.insert_link" },
            },
          }, {
            silent = true,
            noremap = true,
          })
        end
      )
    end,
  },
}
