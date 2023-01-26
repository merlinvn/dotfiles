require("which-key").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
local wk = require("which-key")

wk.register({
  ["<leader>r"] = {
    name = "Reload",
    l = "Reload current luafile",
  },
  ["<leader>g"] = {
    name = "Git",
  },
  ["<leader>t"] = {
    name = "Telescope"
  },
  ["<leader>z"] = {
    name = "hydra",
    w = "Windows",
    g = "Git"
  },
  ["<leader>w"] = {
    name = "+windows",
  },
  ["<leader>o"] = {
    name = "+options/open",
  },
  ["<leader>n"] = {
    name = "+neotree",
  },
  ["<leader>b"] = {
    name = "+buffer",
  },
  ["<leader><tab>"] = {
    name = "+tab",
  },
  ["<leader>c"] = {
    name = "+code",
    w = "swap next",
    W = "swap previous",
  }
})
