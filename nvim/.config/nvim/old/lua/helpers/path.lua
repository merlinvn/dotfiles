local M = {}

local is_windows = vim.loop.os_uname().version:match("Windows")
local path_separator = is_windows and "\\" or "/"

M.path = {
  exists = function(filename)
    local stat = vim.loop.fs_stat(filename)
    return stat ~= nil
  end,
  join = function(...)
    return table
      .concat(vim.tbl_flatten({ ... }), path_separator)
      :gsub(path_separator .. "+", path_separator)
  end,
}

M.root_patterns = { ".git", "lua" }

--- Retrieves the root directory associated with the current buffer or workspace.

---@return string? The root directory path as a string, or nil if no root directory is found.
function M.get_root()
  ---@type string?
  local path = vim.api.nvim_buf_get_name(0)
  path = path ~= "" and vim.loop.fs_realpath(path) or nil

  ---@type string[]
  local roots = {}

  if path then
    -- Iterate over active LSP clients for the current buffer.
    for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      local workspace = client.config.workspace_folders
      local paths = workspace
          and vim.tbl_map(function(ws)
            return vim.uri_to_fname(ws.uri)
          end, workspace)
        or client.config.root_dir and { client.config.root_dir }
        or {}

      -- Check if the current buffer's path is within the LSP client's workspace or root_dir.
      for _, p in ipairs(paths) do
        local r = vim.loop.fs_realpath(p)
        if path:find(r, 1, true) then
          roots[#roots + 1] = r
        end
      end
    end
  end

  -- Sort the discovered roots by path length in descending order.
  table.sort(roots, function(a, b)
    return #a > #b
  end)

  ---@type string?
  local root = roots[1]

  if not root then
    -- If no root is found, attempt to find a root using predefined patterns.
    path = path and vim.fs.dirname(path) or vim.loop.cwd()
    ---@type string?
    root = vim.fs.find(M.root_patterns, { path = path, upward = true })[1]
    root = root and vim.fs.dirname(root) or vim.loop.cwd()
  end

  ---@cast root string
  return root
end

M.root_has_file = function(...)
  local root = M.get_root()

  local patterns = vim.tbl_flatten({ ... })
  for _, name in ipairs(patterns) do
    if M.path.exists(M.path.join(root, name)) then
      return true
    end
  end
  return false
end

M.root_has_file_matches = function(pattern)
  local root = M.get_root()
  local handle = vim.loop.fs_scandir(root)
  local entry = vim.loop.fs_scandir_next(handle)

  while entry do
    if entry:match(pattern) then
      return true
    end

    entry = vim.loop.fs_scandir_next(handle)
  end

  return false
end

return M
