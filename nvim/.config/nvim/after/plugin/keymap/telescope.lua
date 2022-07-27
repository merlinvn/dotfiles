if not pcall(require, "telescope") then
  return
end

local sorters = require "telescope.sorters"

local my_telescope = require("merlinvn.telescope")

local nnoremap = require("merlinvn.keymap").nnoremap

-- Press Ctrl-R twice after ':' to fuzzy search command, b/c single Ctrl-R is already mapped to register
-- paste.
vim.api.nvim_set_keymap("c", "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })

-- dotfiles
nnoremap(
  "<leader>vn",
  function()
    my_telescope.edit_neovim()
  end
)

--nnoremap("<leader>vn", "edit_neovim")
nnoremap(
  "<leader>vd",
  function()
    my_telescope.edit_dotfiles()
  end
)

-- SEARCH
-- search word under cursor
nnoremap(
  "<space>tw",
  function()
    my_telescope.grep_string(
      {
        short_path = true,
        word_match = "-w",
        only_sort_text = true,
        layout_strategy = "vertical",
        sorter = sorters.get_fzy_sorter()
      }
    )
  end
)

-- search word from input
nnoremap(
  "<space>ts",
  function()
    my_telescope.grep_prompt()
  end
)

-- search exact match with last search
nnoremap(
  "<space>t/",
  function()
    my_telescope.grep_last_search(
      {
        layout_strategy = "vertical"
      }
    )
  end
)

-- File pickers
-- pick file using git if there is .git other wise use fd
nnoremap(
  "<leader>tf",
  function()
    my_telescope.project_files()
  end
)
nnoremap(
  "<space>te",
  function()
    my_telescope.file_browser()
  end
)
nnoremap(
  "<space>td",
  function()
    my_telescope.fd()
  end
)

--nnoremap(
--  "<space>ts",
--  function()
--    my_telescope.fs()
--  end
--)

nnoremap(
  "<space>tg",
  function()
    my_telescope.multi_rg()
  end
)
nnoremap(
  "<space>tz",
  function()
    my_telescope.search_only_certain_files()
  end
)
-- nnoremap("<space>fo", "oldfiles")
-- nnoremap("<space>pp", "project_search")

-- Vim pickers
nnoremap(
  "<space>tb",
  function()
    my_telescope.buffers()
  end
)

nnoremap(
  "<space>tl",
  function()
    my_telescope.curbuf()
  end
)

nnoremap(
  "<space>th",
  function()
    my_telescope.help_tags()
  end
)
nnoremap(
  "<space>ta",
  function()
    my_telescope.search_all_files()
  end
)
nnoremap(
  "<space>to",
  function()
    my_telescope.vim_options()
  end
)

nnoremap(
  "<leader>tk",
  function()
    require("telescope.builtin").keymaps()
  end
)

nnoremap(
  "<leader>tt",
  function()
    require("telescope.builtin").current_buffer_tags()
  end
)
nnoremap(
  "<leader>tm",
  function()
    require("telescope.builtin").marks()
  end
)
nnoremap(
  "<leader>tc",
  function()
    require("telescope.builtin").commands()
  end
)

nnoremap(
  "<leader>ti",
  function()
    require("telescope.builtin").treesitter()
  end
)

nnoremap(
  "<leader>tr",
  function()
    require("telescope.builtin").registers()
  end
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
