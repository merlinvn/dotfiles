local status, leap = pcall(require, "leap")
if (not status) then return end

local nnoremap = require("merlinvn.keymap").nnoremap
local vnoremap = require("merlinvn.keymap").vnoremap
local onoremap = require("merlinvn.keymap").onoremap

leap.setup {
  max_phase_one_targets = nil,
  highlight_unlabeled_phase_one_targets = false,
  max_highlighted_traversal_targets = 20,
  case_sensitive = false,
  -- Sets of characters that should match each other.
  -- Obvious candidates are braces and quotes ('([{', ')]}', '`"\'').
  equivalence_classes = { ' \t\r\n', },
  substitute_chars = {},
  -- Leaving the appropriate list empty effectively disables "smart" mode,
  -- and forces auto-jump to be on or off.
  -- safe_labels = { . . . },
  safe_labels =
  -- { "s", "f", "n", "u", "t",
  --   "S", "F", "N", "L", "H", "M", "U", "G", "T", "Z" },
  { "s", "f", "n", "u", "t",
    "a", "d", "j", "k", "l", "m", "u", "u", "e", "r" },
  labels =
  { "s", "f", "n",
    "j", "k", "l", "h", "o", "d", "w", "e", "m", "b",
    "u", "y", "v", "r", "g", "t", "c", "x", "z",
    "S", "F", "N",
    "J", "K", "L", "H", "O", "D", "W", "E", "M", "B",
    "U", "Y", "V", "R", "G", "T", "C", "X", "Z" },
  special_keys = {
    repeat_search = '<enter>',
    next_phase_one_target = '<enter>',
    next_target = { '<enter>', ';' },
    prev_target = { '<tab>', ',' },
    next_group = '<space>',
    prev_group = '<tab>',
    multi_accept = '<enter>',
    multi_revert = '<backspace>',
  },
}

-- leap.add_default_mappings()

nnoremap('s', '<Plug>(leap-forward-to)', { silent = true })
nnoremap('S', '<Plug>(leap-backward-to)', { silent = true })
vnoremap('s', '<Plug>(leap-forward-to)', { silent = true })
vnoremap('S', '<Plug>(leap-backward-to)', { silent = true })

vnoremap('z', '<Plug>(leap-forward-till)', { silent = true })
vnoremap('Z', '<Plug>(leap-backward-till)', { silent = true })
onoremap('z', '<Plug>(leap-forward-till)', { silent = true })
onoremap('Z', '<Plug>(leap-backward-till)', { silent = true })

