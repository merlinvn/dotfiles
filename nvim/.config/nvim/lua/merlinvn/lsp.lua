local M = {}

local nmap_buf = function(keys, func, desc, bufnr)
  vim.keymap.set('n', keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
end
local imap_buf = function(keys, func, desc, bufnr)
  vim.keymap.set('i', keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
end

function M.lsp_on_attach_rust(_, bufnr)
  M.lsp_on_attach(_, bufnr)

  local nmap = function(keys, func, desc)
    nmap_buf(keys, func, desc, bufnr)
  end
  local imap = function(keys, func, desc)
    imap_buf(keys, func, desc, bufnr)
  end

  nmap("<F5>",
    function()
      vim.cmd("w")
      require('toggleterm').exec("cargo run")
    end,
    "Run")
end

function M.lsp_on_attach(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local nmap = function(keys, func, desc)
    nmap_buf(keys, func, desc, bufnr)
  end
  local imap = function(keys, func, desc)
    imap_buf(keys, func, desc, bufnr)
  end
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  nmap('gD', vim.lsp.buf.declaration, "Go to declaration")
  nmap('K', vim.lsp.buf.hover, "Show hover")
  -- nmap('K', rt.hover_actions.hover_actions, "Show hover")
  nmap('gk', vim.lsp.buf.signature_help, "Show signature help")
  imap('<C-K>', vim.lsp.buf.signature_help, "Show signature help")
  nmap('<leader>cr', vim.lsp.buf.rename, "[C]ode [R]ename")
  nmap('<leader>ca', vim.lsp.buf.code_action, "[C]ode [a]ction")
  -- nmap('<leader>ca', rt.code_action_group.code_action_group, "[C]ode [a]ction")
  nmap('<leader>cf', function() vim.lsp.buf.format { async = true, timeout_ms = 5000 } end, "Format buffer")
  vim.keymap.set("v", '<leader>cf', function() vim.lsp.buf.rangeFormatting { async = true, timeout_ms = 5000 } end,
    { buffer = bufnr, noremap = true, silent = true, desc = "Format range" })
  -- nmap('<leader>f', function() vim.lsp.buf.format { async = true, timeout_ms = 5000 } end, "Format buffer")
  nmap('<C-f>', function() vim.lsp.buf.format() end, "Format buffer")
  imap('<C-f>', function() vim.lsp.buf.format() end, "Format buffer")
  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

end

return M;
