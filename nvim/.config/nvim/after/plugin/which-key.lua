require("which-key").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
local wk = require("which-key")
wk.register({
  y = {
    name = "hYdra",
    -- w = { name = "Windows" },
    -- g = { name = "Git" }
  }
}, { prefix = "<leader>" })
