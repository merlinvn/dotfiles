local Util = require("merlinvn.util")
local M = {}

local nmap_buf = function(keys, func, desc, bufnr)
  vim.keymap.set(
    "n",
    keys,
    func,
    { buffer = bufnr, noremap = true, silent = true, desc = desc }
  )
end
local imap_buf = function(keys, func, desc, bufnr)
  vim.keymap.set(
    "i",
    keys,
    func,
    { buffer = bufnr, noremap = true, silent = true, desc = desc }
  )
end

function M.on_attach_rust(client, bufnr)
  M.on_attach(client, bufnr)

  local nmap = function(keys, func, desc)
    nmap_buf(keys, func, desc, bufnr)
  end

  -- local imap = function(keys, func, desc)
  --   imap_buf(keys, func, desc, bufnr)
  -- end

  nmap("<F5>", function()
    vim.cmd("w")
    require("toggleterm").exec("cargo run")
  end, "Run")
end

function M.on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local nmap = function(keys, func, desc)
    nmap_buf(keys, func, desc, bufnr)
  end
  local imap = function(keys, func, desc)
    imap_buf(keys, func, desc, bufnr)
  end
  -- Mappings.

  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  -- vim.keymap.set('n', 'go', vim.diagnostic.open_float,
  --   { noremap = true, silent = true, desc = 'Open diagnostics float' }
  if Util.has("lspsaga.nvim") then
    -- Go to definition
    -- nmap("gd", "<cmd>Lspsaga goto_definition<CR>", "Definitions")
    -- Diagnostics
    nmap(
      "[d",
      "<cmd>Lspsaga diagnostic_jump_prev<CR>",
      "Go to previous diagnostic"
    )
    nmap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Go to next diagnostic")
    -- Show buffer diagnostics
    -- nmap("<leader>cd", "<cmd>Lspsaga show_buf_diagnostics<CR>", "Show buffer diagnostics")

    -- Code actions
    nmap("<leader>ca", "<cmd>Lspsaga code_action<CR>")
    nmap("<leader>cr", "<cmd>Lspsaga rename<CR>", "[C]ode [R]ename")
    -- Rename all occurrences of the hovered word for the selected files
    -- currently has bugs cannot exit rename mode
    nmap(
      "<leader>cR",
      "<cmd>Lspsaga rename ++project<CR>",
      "[C]ode [R]ename all"
    )
    -- Toggle outline
    nmap("<leader>ct", "<cmd>Lspsaga outline<CR>", "Toggle outline")
    nmap("K", "<cmd>Lspsaga hover_doc<CR>", "Show hover")

    -- Call hierarchy
    nmap("<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
    nmap("<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
  else
    -- nmap("gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", "Definitions")

    nmap("gp", vim.diagnostic.goto_prev, "Go to previous diagnostic")
    nmap("gn", vim.diagnostic.goto_next, "Go to next diagnostic")

    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [a]ction")
    nmap("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")

    nmap("K", vim.lsp.buf.hover, "Show hover")
    nmap("gk", vim.lsp.buf.signature_help, "Show signature help")
    imap("<C-K>", vim.lsp.buf.signature_help, "Show signature help")
  end

  nmap(
    "<leader>cd",
    "<cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<CR>",
    "Document diagnostics"
  )

  nmap(
    "gd",
    "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>",
    "Definitions"
  )
  nmap(
    "gI",
    "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>",
    "Implementations"
  )
  nmap(
    "gr",
    "<cmd>lua require('telescope.builtin').lsp_references()<CR>",
    "References"
  )
  -- nmap("gt", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>")

  nmap(
    "<leader>cs",
    "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
    "Document symbols"
  )
  nmap(
    "<leader>cS",
    "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>",
    "Workspace symbols"
  )
  nmap(
    "<leader>cD",
    "<cmd>lua require('telescope.builtin').diagnostics()<CR>",
    "Workspace diagnostics"
  )

  -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  nmap("gD", vim.lsp.buf.declaration, "Go to declaration")

  nmap(
    "<leader>cf",
    "<cmd>lua require('plugins.lsp.format').format()<CR>",
    "Format buffer"
  )

  vim.keymap.set("v", "<leader>cf", function()
    vim.lsp.buf.rangeFormatting({ async = true, timeout_ms = 5000 })
  end, {
    buffer = bufnr,
    noremap = true,
    silent = true,
    desc = "Format range",
  })

  imap("<C-f>", function()
    vim.lsp.buf.format()
  end, "Format buffer")
  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })

  -- nmap(
  --   "<leader>wa",
  --   vim.lsp.buf.add_workspace_folder,
  --   "[W]orkspace [A]dd Folder"
  -- )
  -- nmap(
  --   "<leader>wr",
  --   vim.lsp.buf.remove_workspace_folder,
  --   "[W]orkspace [R]emove Folder"
  -- )
  -- nmap("<leader>wf", function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, "[W]orkspace list [F]olders")
end

return M
