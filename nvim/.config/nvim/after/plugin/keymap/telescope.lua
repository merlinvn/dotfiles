if not pcall(require, "telescope") then
  return
end

local sorters = require "telescope.sorters"

local nnoremap = require("merlinvn.keymap").nnoremap

-- Press Ctrl-R twice after ':' to fuzzy search command history, b/c single Ctrl-R is already mapped to register
-- paste.
vim.api.nvim_set_keymap("c", "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })

-- dotfiles
nnoremap(
  "<leader>vn",
  "<cmd>lua require('merlinvn.telescope').edit_neovim() <CR>"
)

--nnoremap("<leader>vn", "edit_neovim")
nnoremap(
  "<leader>vd",
  "<cmd>lua require('merlinvn.telescope').edit_dotfiles() <CR>"
)

-- SEARCH
-- search word under cursor
nnoremap(
  "<space>tw",
  function()
    require('merlinvn.telescope').grep_string(
      { short_path = true,
        word_match = '-w',
        only_sort_text = true,
        layout_strategy = 'vertical',
        sorter = sorters.get_fzy_sorter()
      })
  end
)

-- search word from input
nnoremap(
  "<space>ts",
  "<cmd>lua require('merlinvn.telescope').grep_prompt() <CR>"
)

-- search exact match with last search
nnoremap(
  "<space>t/",
  "<cmd>lua require('merlinvn.telescope').grep_last_search( { layout_strategy = 'vertical' }) <CR>"
)

-- File pickers
-- pick file using git if there is .git other wise use fd
nnoremap(
  "<leader>tf",
  "<cmd>lua require('merlinvn.telescope').project_files() <CR>"
)
nnoremap(
  "<space>te",
  "<cmd>lua require('merlinvn.telescope').file_browser() <CR>"
)
nnoremap(
  "<space>td",
  "<cmd>lua require('merlinvn.telescope').fd() <CR>"
)

--nnoremap(
--  "<space>ts",
--  "<cmd>lua
--    require('merlinvn.telescope').fs()
--  <CR>"
--)

nnoremap(
  "<space>tg",
  "<cmd>lua require('merlinvn.telescope').multi_rg() <CR>"
)
nnoremap(
  "<space>tz",
  "<cmd>lua require('merlinvn.telescope').search_only_certain_files() <CR>"
)
-- nnoremap("<space>fo", "oldfiles")
-- nnoremap("<space>pp", "project_search")

-- Vim pickers
nnoremap(
  "<space>tb",
  "<cmd>lua require('merlinvn.telescope').buffers() <CR>"
)

nnoremap(
  "<space>tl",
  "<cmd>lua require('merlinvn.telescope').curbuf() <CR>"
)

nnoremap(
  "<space>th",
  "<cmd>lua require('merlinvn.telescope').help_tags() <CR>"
)
nnoremap(
  "<space>ta",
  "<cmd>lua require('merlinvn.telescope').search_all_files() <CR>"
)
nnoremap(
  "<space>to",
  "<cmd>lua require('merlinvn.telescope').vim_options() <CR>"
)

nnoremap(
  "<leader>tk", "<cmd>lua require('telescope.builtin').keymaps()<CR>"
)

nnoremap(
  "<leader>tt",
  "<cmd>lua require('telescope.builtin').current_buffer_tags() <CR>"
)
nnoremap(
  "<leader>tm",
  "<cmd>lua require('telescope.builtin').marks() <CR>"
)
nnoremap(
  "<leader>tc",
  "<cmd>lua require('telescope.builtin').commands() <CR>"
)

nnoremap(
  "<leader>ti",
  "<cmd>lua require('telescope.builtin').treesitter() <CR>"
)

nnoremap(
  "<leader>tr",
  "<cmd>lua require('telescope.builtin').registers() <CR>"
)

-- LSP

nnoremap("gd", ":lua require('telescope.builtin').lsp_definitions()<CR>")
nnoremap("gi", ":lua require('telescope.builtin').lsp_implementations()<CR>")
nnoremap("gt", ":lua require('telescope.builtin').lsp_type_definitions()<CR>")
nnoremap("gr", ":lua require('telescope.builtin').lsp_references()<CR>")

-- nnoremap ("gh", ":lua vim.lsp.buf.signature_help()<CR>")
-- nnoremap ("<leader>ch", ":lua vim.lsp.buf.signature_help()<CR>")
--
-- " nnoremap gs :lua vim.lsp.buf.document_symbol()<CR>
-- " nnoremap <leader>cs :lua vim.lsp.buf.document_symbol()<CR>

nnoremap("gs", ":lua require('telescope.builtin').lsp_document_symbols()<CR>")
nnoremap("gS", ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>")
nnoremap("<leader>d", ":lua require('telescope.builtin').diagnostics({bufnr=0})<CR>")
nnoremap("<leader>D", ":lua require('telescope.builtin').diagnostics()<CR>")

-- nnoremap [d :lua vim.lsp.diagnostic.goto_prev()<CR>
-- nnoremap ]d :lua vim.lsp.diagnostic.goto_next()<CR>

-- nnoremap ("<leader>cp", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
-- nnoremap ("<leader>cn", ":lua vim.lsp.diagnostic.goto_next()<CR>")

-- nnoremap <leader>= :lua vim.lsp.buf.formatting()<CR>
-- nnoremap ("<leader>cf", ":lua vim.lsp.buf.formatting()<CR>")

-- " nnoremap <leader>cl :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

-- nnoremap ("K", ":lua vim.lsp.buf.hover()<CR>")
-- nnoremap ("<leader>ck", ":lua vim.lsp.buf.hover()<CR>")

-- nnoremap ("<leader>ce", ":lua vim.lsp.buf.rename()<CR>")
-- " nnoremap <leader>c. :lua vim.lsp.buf.code_action()<CR>

-- nnoremap ("<leader>c>", ":lua require('telescope.builtin').lsp_range_code_actions()<CR>")

-- nnoremap ("<leader>ci", ":lua vim.lsp.buf.incoming_calls()<CR>")
-- nnoremap ("<leader>co", ":lua vim.lsp.buf.outgoing_calls()<CR>")
