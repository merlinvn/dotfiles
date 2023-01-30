local Util = require("lazy.core.util")
local M = {}

-- store local data
local H = {}

M.root_patterns = { ".git", "lua" }

function M.has(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end

-- returns the root directory based on:
-- * lsp workspace folders
-- * lsp root_dir
-- * root pattern of filename of the current buffer
-- * root pattern of cwd
---@return string
function M.get_root()
  ---@type string?
  local path = vim.loop.cwd()
  path = path ~= "" and vim.loop.fs_realpath(path) or nil
  ---@type string[]
  local roots = {}
  if path then
    for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      local workspace = client.config.workspace_folders
      local paths = workspace and vim.tbl_map(function(ws)
        return vim.uri_to_fname(ws.uri)
      end, workspace) or client.config.root_dir and { client.config.root_dir } or {}
      for _, p in ipairs(paths) do
        local r = vim.loop.fs_realpath(p)
        if path:find(r, 1, true) then
          roots[#roots + 1] = r
        end
      end
    end
  end
  table.sort(roots, function(a, b)
    return #a > #b
  end)
  ---@type string?
  local root = roots[1]
  if not root then
    path = path and vim.fs.dirname(path) or vim.loop.cwd()
    ---@type string?
    root = vim.fs.find(M.root_patterns, { path = path, upward = true })[1]
    root = root and vim.fs.dirname(root) or vim.loop.cwd()
  end
  ---@cast root string
  return root
end

---@param silent boolean?
---@param values? {[1]:any, [2]:any}
function M.toggle(option, silent, values)
  if values then
    if vim.opt_local[option]:get() == values[1] then
      vim.opt_local[option] = values[2]
    else
      vim.opt_local[option] = values[1]
    end
    return Util.info("Set " .. option .. " to " .. vim.opt_local[option]:get(), { title = "Option" })
  end
  vim.opt_local[option] = not vim.opt_local[option]:get()
  if not silent then
    if vim.opt_local[option]:get() then
      Util.info("Enabled " .. option, { title = "Option" })
    else
      Util.warn("Disabled " .. option, { title = "Option" })
    end
  end
end

local enabled = true
function M.toggle_diagnostics()
  enabled = not enabled
  if enabled then
    vim.diagnostic.enable()
    Util.info("Enabled diagnostics", { title = "Diagnostics" })
  else
    vim.diagnostic.disable()
    Util.warn("Disabled diagnostics", { title = "Diagnostics" })
  end
end

-- Diagnostic state per buffer
H.buffer_diagnostic_state = {}

function M.toggle_diagnostic()
  local buf_id = vim.api.nvim_get_current_buf()
  local buf_state = H.buffer_diagnostic_state[buf_id]
  if buf_state == nil then buf_state = true end

  if buf_state then
    vim.diagnostic.disable(buf_id)
  else
    vim.diagnostic.enable(buf_id)
  end

  local new_buf_state = not buf_state
  H.buffer_diagnostic_state[buf_id] = new_buf_state

  return new_buf_state and '  diagnostic' or 'nodiagnostic'
end

function M.lsp_on_attach(_, bufnr)
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
  end
  local imap = function(keys, func, desc)
    vim.keymap.set('i', keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
  end
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  nmap('gD', vim.lsp.buf.declaration, "Go to declaration")
  nmap('K', vim.lsp.buf.hover, "Show hover")
  -- nmap('K', rt.hover_actions.hover_actions, "Show hover")
  nmap('gs', vim.lsp.buf.signature_help, "Show signature help")
  nmap('<leader>cr', vim.lsp.buf.rename, "[C]ode [R]ename")
  nmap('<leader>ca', vim.lsp.buf.code_action, "[C]ode [a]ction")
  -- nmap('<leader>ca', rt.code_action_group.code_action_group, "[C]ode [a]ction")
  nmap('<leader>cf', function() vim.lsp.buf.format { async = true, timeout_ms = 5000 } end, "Format buffer")
  vim.keymap.set("v", '<leader>cf', function() vim.lsp.buf.rangeFormatting { async = true, timeout_ms = 5000 } end,
    { buffer = bufnr, noremap = true, silent = true, desc = "Format range" })
  -- nmap('<leader>f', function() vim.lsp.buf.format { async = true, timeout_ms = 5000 } end, "Format buffer")
  nmap('<C-f>', function() vim.lsp.buf.format { async = true, timeout_ms = 5000 } end, "Format buffer")
  imap('<C-f>', function() vim.lsp.buf.format { async = true, timeout_ms = 5000 } end, "Format buffer")
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
