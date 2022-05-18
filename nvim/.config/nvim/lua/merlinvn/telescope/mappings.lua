if not pcall(require, "telescope") then
  return
end

local sorters = require "telescope.sorters"

TelescopeMapArgs = TelescopeMapArgs or {}

local nmap = require("merlinvn.keymaps").nmap

local map_tele = function(key, f, options, buffer)
  local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

  TelescopeMapArgs[map_key] = options or {}

  local mode = "n"
  local rhs = string.format("<cmd>lua R('merlinvn.telescope')['%s'](TelescopeMapArgs['%s'])<CR>", f, map_key)

  local map_options = {
    noremap = true,
    silent = true,
  }

  if not buffer then
    vim.api.nvim_set_keymap(mode, key, rhs, map_options)
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
  end
end

-- Press Ctrl-R twice after ':' to fuzzy search command, b/c single Ctrl-R is already mapped to register
-- paste.
vim.api.nvim_set_keymap("c", "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })

-- dotfiles
map_tele("<leader>vn", "edit_neovim")
map_tele("<leader>vd", "edit_dotfiles")

-- SEARCH
-- search word under cursor
map_tele("<space>gw", "grep_string", {
  short_path = true,
  word_match = "-w",
  only_sort_text = true,
  layout_strategy = "vertical",
  sorter = sorters.get_fzy_sorter(),
})
-- search word from input
map_tele("<space>gs", "grep_prompt")

-- search exact match with last search
map_tele("<space>g/", "grep_last_search", {
  layout_strategy = "vertical",
})

-- File pickers
-- pick file using git if there is .git other wise use fd
map_tele("<leader>tf", "project_files")
map_tele("<space>te", "file_browser")
map_tele("<space>td", "fd")
map_tele("<space>ts", "fs")
map_tele("<space>tg", "multi_rg")
-- map_tele("<space>fo", "oldfiles")
-- map_tele("<space>pp", "project_search")
map_tele("<space>tz", "search_only_certain_files")

-- Vim pickers
map_tele("<space>tb", "buffers")
map_tele("<space>tl", "curbuf")
map_tele("<space>th", "help_tags")
map_tele("<space>ta", "search_all_files")
map_tele("<space>to", "vim_options")

nmap { "<leader>tk", ":lua require('telescope.builtin').keymaps()<CR>", }
nmap { "<leader>tt", ":lua require('telescope.builtin').current_buffer_tags()<CR>", }
nmap { "<leader>tm", ":lua require('telescope.builtin').marks()<CR>", }
nmap { "<leader>tc", ":lua require('telescope.builtin').commands()<CR>", }
nmap { "<leader>ti", ":lua require('telescope.builtin').treesitter()<CR>", }
nmap { "<leader>tr", ":lua require('telescope.builtin').registers()<CR>", }

-- LSP

-- nmap {"gD", ":lua vim.lsp.buf.declaration()<CR>"}
-- nmap {"<leader>cgD", ":lua vim.lsp.buf.declaration()<CR>"}
--
-- nmap {"gd", ":lua vim.lsp.buf.definition()<CR>"}
-- nmap {"<leader>cgd", ":lua vim.lsp.buf.definition()<CR>"}
--
-- nmap {"gi", ":lua vim.lsp.buf.implementation()<CR>"}
-- nmap {"<leader>cgi", ":lua vim.lsp.buf.implementation()<CR>"}
--
-- nmap {"gt", ":lua vim.lsp.buf.type_definition()<CR>"}
-- nmap {"<leader>cgt", ":lua vim.lsp.buf.type_definition()<CR>"}
--
-- nmap {"gh", ":lua vim.lsp.buf.signature_help()<CR>"}
-- nmap {"<leader>ch", ":lua vim.lsp.buf.signature_help()<CR>"}
--
-- " nnoremap gs :lua vim.lsp.buf.document_symbol()<CR>
-- " nnoremap <leader>cs :lua vim.lsp.buf.document_symbol()<CR>

nmap { "gs", ":lua require('telescope.builtin').lsp_document_symbols()<CR>" }
nmap { "gS", ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>" }
nmap { "gr", ":lua require('telescope.builtin').lsp_references()<CR>" }
nmap { "<leader>d", ":lua require('telescope.builtin').diagnostics({bufnr=0})<CR>" }
nmap { "<leader>D", ":lua require('telescope.builtin').diagnostics()<CR>" }

-- nnoremap [d :lua vim.lsp.diagnostic.goto_prev()<CR>
-- nnoremap ]d :lua vim.lsp.diagnostic.goto_next()<CR>

-- nmap {"<leader>cp", ":lua vim.lsp.diagnostic.goto_prev()<CR>"}
-- nmap {"<leader>cn", ":lua vim.lsp.diagnostic.goto_next()<CR>"}

-- nnoremap <leader>= :lua vim.lsp.buf.formatting()<CR>
-- nmap {"<leader>cf", ":lua vim.lsp.buf.formatting()<CR>"}

-- " nnoremap <leader>cl :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

-- nmap {"K", ":lua vim.lsp.buf.hover()<CR>"}
-- nmap {"<leader>ck", ":lua vim.lsp.buf.hover()<CR>"}

-- nmap {"<leader>ce", ":lua vim.lsp.buf.rename()<CR>"}
-- " nnoremap <leader>c. :lua vim.lsp.buf.code_action()<CR>
-- nnoremap <leader>c. :lua require('telescope.builtin').lsp_code_actions()<CR>

-- nmap {"<leader>c.", ":lua require('telescope.builtin').lsp_code_actions()<CR>"}

-- nmap {"<leader>c>", ":lua require('telescope.builtin').lsp_range_code_actions()<CR>"}

-- nmap {"<leader>ci", ":lua vim.lsp.buf.incoming_calls()<CR>"}
-- nmap {"<leader>co", ":lua vim.lsp.buf.outgoing_calls()<CR>"}
