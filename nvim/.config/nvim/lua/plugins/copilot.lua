return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    -- dependencies = { { "zbirenbaum/copilot-cmp" } },
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          -- enabled = false,
        },
        panel = {
          enabled = false,
        },
      })
      -- require("copilot_cmp").setup()
    end,
  },
}
