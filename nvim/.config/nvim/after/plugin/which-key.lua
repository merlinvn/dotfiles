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
    w = { ":wincmd n<CR>", "New window" },
    n = { ":wincmd w<CR>", "Next window" },
    p = { ":wincmd p<CR>", "Previous windows" },
    h = { ":wincmd h<CR>", "Left window" },
    j = { ":wincmd j<CR>", "Down window" },
    k = { ":wincmd k<CR>", "Up window" },
    l = { ":wincmd l<CR>", "Right window" },
    ["-"] = { ":vertical resize -5<CR>", "Decrease width" },
    ["+"] = { ":vertical resize +5<CR>", "Increase width" },
    ["["] = { ":horizontal resize -5 <CR>", "Decrease height" },
    ["]"] = { ":horizontal resize +5 <CR>", "Increase height" },
    ["="] = { ":wincmd =<CR>", "Reset size" },
  },
  ["<leader>c"] = {
    name = "+code",
    w = "swap next",
    W = "swap previous",
  }
})
