local Hydra = require('hydra')

local window_hint = [[
 ^^^^^^^^^^^^     Move      ^^    Size   ^^   ^^     Split
 ^^^^^^^^^^^^-------------  ^^-----------^^   ^^---------------
 ^ ^ _k_ ^ ^  ^ ^ _K_ ^ ^   ^   _<C-k>_   ^   _s_: horizontally
 _h_ ^ ^ _l_  _H_ ^ ^ _L_   _<C-h>_ _<C-l>_   _v_: vertically
 ^ ^ _j_ ^ ^  ^ ^ _J_ ^ ^   ^   _<C-j>_   ^   _q_, _c_: close
 focus^^^^^^  window^^^^^^  ^_=_: equalize^   _z_: maximize
 ^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^   ^^ ^          ^   _o_: remain only
 _b_: choose buffer
]]

Hydra({
  name = 'Windows',
  hint = window_hint,
  config = {
    invoke_on_body = true,
    hint = {
      border = 'rounded',
      offset = -1
    }
  },
  mode = 'n',
  body = '<leader>yw',
  heads = {
    { 'h', '<C-w>h' },
    { 'j', '<C-w>j' },
    { 'k', '<C-w>k' },
    { 'l', '<C-w>l' },

    { 'H', '<C-w>H' },
    { 'J', '<C-w>J' },
    { 'K', '<C-w>K' },
    { 'L', '<C-w>L' },

    { '<C-h>', '<C-w><' },
    { '<C-j>', '<C-w>+' },
    { '<C-k>', '<C-w>-' },
    { '<C-l>', '<C-w>>' },

    { '=', '<C-w>=', { desc = 'equalize' } },

    { 's', '<C-w>s' }, { '<C-s>', '<C-w><C-s>', { desc = false } },
    { 'v', '<C-w>v' }, { '<C-v>', '<C-w><C-v>', { desc = false } },

    { 'w', '<C-w>w', { exit = true, desc = false } },
    { '<C-w>', '<C-w>w', { exit = true, desc = false } },

    -- for maximizer
    { 'z', '<cmd>lua print("hello")<CR>' },
    { '<C-z>', '' },

    { 'o', '<C-w>o', { exit = true, desc = 'remain only' } },
    { '<C-o>', '<C-w>o', { exit = true, desc = false } },

    { 'b', "<cmd>lua require('merlinvn.telescope').buffers() <CR>" , { exit  = true, desc = 'choose buffer' } },

    { 'c', '<C-w>q' },
    { 'q', '<C-w>q' },

    { '<Esc>', nil, { exit = true, desc = false } }
  }
})
