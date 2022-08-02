local Hydra = require('hydra')

local function cmd(command)
  return table.concat({ '<Cmd>', command, '<CR>' })
end

local hint = [[
                 _f_: files        _p_: projects
   🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _o_: old files    _g_: live grep
  🭉🭁🭠🭘    🭣🭕🭌🬾   _b_: buffers      _/_: search in file
  🭅█ ▁     █🭐   _a_: all files    _e_: file browser
  ██🬿      🭊██
 🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬆█🭀  _r_: registers    _c_: execute command
 🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬹🭝🭙  _k_: keymaps      _h_: vim help
                 _m_: marks        _;_: commands history
                 _O_: options      _?_: search history

                 _d_: dotfiles     _n_: neovim configs
                 _z_: file type    _w_: word under cursor
                 ^
                 _<Enter>_: Telescope           _<Esc>_
]]

Hydra({
  name = "Telescope",
  hint = hint,
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = {
      position = 'middle',
      border = 'rounded',
    },
  },
  mode = 'n',
  body = '<leader>t',
  heads = {
    { 'f', cmd "lua require('merlinvn.telescope').fd()" },
    { 'p', cmd "lua require('merlinvn.telescope').project_files()", { desc = 'projects' } },
    { 'o', cmd "Telescope oldfiles", { desc = 'recently opened files' } },
    { 'g', cmd "lua require('merlinvn.telescope').multi_rg()" },
    { 'b', cmd "lua require('merlinvn.telescope').buffers()", { desc = 'buffers' } },
    { '/', cmd "lua require('merlinvn.telescope').curbuf()", { desc = 'search in file' } },
    { 'a', cmd "lua require('merlinvn.telescope').search_all_files()", { desc = 'all files' } },
    { 'e', cmd "lua require('merlinvn.telescope').file_browser()", { desc = 'file browser' } },

    { 'r', cmd "lua require('telescope.builtin').registers()", { desc = 'registers' } },
    { 'c', cmd "Telescope commands", { desc = 'execute command' } },
    { 'h', cmd "lua require('merlinvn.telescope').help_tags()", { desc = 'vim help' } },
    { 'k', cmd "lua require('telescope.builtin').keymaps()" },
    { 'O', cmd "lua require('merlinvn.telescope').vim_options()" },
    { 'm', cmd 'Telescope marks', { desc = 'marks' } },
    { ';', cmd "", { desc = 'command-line history' } },
    { '?', cmd "", { desc = 'search history' } },

    { 'd', cmd "lua require('merlinvn.telescope').edit_dotfiles()", { desc = 'dotfiles' } },
    { 'n', cmd "lua require('merlinvn.telescope').edit_neovim()", { desc = 'neovim config' } },
    { 'z', cmd "lua require('merlinvn.telescope').search_only_certain_files()", { desc = 'search by file type' } },
    { 'w', cmd "lua require('merlinvn.telescope').word_under_cursor()", { desc = 'find word undder cursor' } },
    { '<Enter>', cmd "Telescope", { exit = true, desc = 'list all pickers' } },
    { '<Esc>', nil, { exit = true, nowait = true } },
  }
})
