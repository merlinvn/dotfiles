local nmap = require("merlinvn.keymaps").nmap
-- local my_telescope = require('plugins.config.telescope')

-- File pickers
nmap {"<leader>tf", ":lua require('telescope.builtin').find_files()<CR>", {noremap = true, silent = true}}

nmap {
  "<leader>tp",
  ":lua require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },  })<CR>",
  {noremap = true, silent = true}
}

nmap {
  "<leader>ta",
  ":lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
  {noremap = true, silent = true}
}

nmap {"<leader>tg", ":lua require('telescope.builtin').live_grep()<CR>", {noremap = true, silent = true}}
nmap {
  "<leader>ts",
  ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>",
  {noremap = true, silent = true}
}
nmap {
  "<leader>tw",
  ":lua require('telescope.builtin').grep_string{ search = vim.fn.expand('<cword>')}<CR>",
  {noremap = true, silent = true}
}

-- dotfiles search
nmap {"<leader>td", ":lua require('merlinvn.telescope').search_dotfiles()<CR>", {noremap = true, silent = true}}

nmap {"<leader>vd", ":lua require('merlinvn.telescope').search_dotfiles()<CR>", {noremap = true, silent = true}}

-- Vim pickers
nmap {"<leader>tb", ":lua require('telescope.builtin').buffers()<CR>", {noremap = true, silent = true}}
nmap {"<leader>tk", ":lua require('telescope.builtin').keymaps()<CR>", {noremap = true, silent = true}}
nmap {"<leader>tt", ":lua require('telescope.builtin').current_buffer_tags()<CR>", {noremap = true, silent = true}}
nmap {
  "<leader>tl",
  ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
  {noremap = true, silent = true}
}
nmap {"<leader>th", ":lua require('telescope.builtin').help_tags()<CR>", {noremap = true, silent = true}}
nmap {"<leader>tm", ":lua require('telescope.builtin').marks()<CR>", {noremap = true, silent = true}}

nmap {"<leader>tc", ":lua require('merlinvn.telescope').git_branches()<CR>", {noremap = true, silent = true}}

nmap {"<leader>ti", ":lua require('telescope.builtin').treesitter()<CR>", {noremap = true, silent = true}}

nmap {"<leader>tr", ":lua require('telescope.builtin').registers()<CR>", {noremap = true, silent = true}}
