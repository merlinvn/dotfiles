local Hydra = require("hydra")
require('hydra.statusline')

local hint = [[
^ ^ ^ ^ ^ ^ ^    Jump around
_s_ Jump to begin of 2 chars ^ ^ ^ ^ _w_ Jump to begin of word
_c_ Jump to 1 char           ^ ^ ^ ^ _l_ Jump to begin of line
_/_ Jump to search pattern
]]

Hydra({
  name = 'Hop',
  hint = hint,
  config = {
    color = "pink",
    -- exit = true,
    invoke_on_body = true,
    hint = {
      border = 'rounded',
      position = 'bottom'
    }
    -- hint = 'statusline',
  },
  mode = { 'n', 'x', 'o' },
  body = 's',
  heads = {
    { 'c', "<cmd>HopChar1MW<cr>", { exit = true } },
    { 's', "<cmd>HopChar2MW<cr>", { exit = true } },
    { 'l', "<cmd>HopLineStartMW<cr>", { exit = true } },
    { 'w', "<cmd>HopWordMW<cr>", { exit = true } },
    { '/', "<cmd>lua require'hop'.hint_patterns()<cr>", { exit = true } },
    { 'q', "", { desc = false, nowait = true } },
    { '<Esc>', nil, { exit = true, mode = 'n' } }
  }
})
