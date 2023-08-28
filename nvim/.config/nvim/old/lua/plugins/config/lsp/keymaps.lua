local M = {}

local buf_map = require("helpers.keys").buf_map

function M.on_attach_rust(client, bufnr)
  local nmap = function(keys, func, desc)
    buf_map("n", keys, func, bufnr, desc, { noremap = true })
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
  local format = function()
    require("plugins.config.lsp.format").format({})
  end
  -- Mappings.
  local nmap = function(keys, func, desc)
    buf_map("n", keys, func, bufnr, desc, { noremap = true })
  end
  local imap = function(keys, func, desc)
    buf_map("i", keys, func, bufnr, desc, { noremap = true })
  end

  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  -- using trouble instead
  -- nmap("gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", "Definitions")
  -- vim.keymap.set('n', 'go', vim.diagnostic.open_float,
  --   { noremap = true, silent = true, desc = 'Open diagnostics float' }

  -- use [d and ]d to navigate diagnostics in the mini.bracketed
  -- nmap("gp", vim.diagnostic.goto_prev, "Go to previous diagnostic")
  -- nmap("gn", vim.diagnostic.goto_next, "Go to next diagnostic")

  nmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
  nmap("<leader>cr", vim.lsp.buf.rename, "Code rename")

  nmap("K", vim.lsp.buf.hover, "Show hover")
  nmap("gK", vim.lsp.buf.signature_help, "Show signature help")
  imap("<C-K>", vim.lsp.buf.signature_help, "Show signature help")

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

  -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  nmap("gD", vim.lsp.buf.declaration, "Go to declaration")

  nmap("<leader>cf", format, "Format buffer")
  nmap("<leader>ff", format, "Format buffer")

  buf_map("v", "<leader>cf", format, bufnr, "Format range", { noremap = true })

  buf_map("v", "<leader>ff", format, bufnr, "Format range", { noremap = true })

  -- imap("<C-f>", format, "Format buffer")
  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(
    bufnr,
    "Format",
    format,
    { desc = "Format current buffer with LSP" }
  )
end

return M
