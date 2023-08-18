local M = {}

M.map = function(mode, lhs, rhs, desc, other_opts)
  local opts =
    vim.tbl_extend("keep", other_opts or {}, { silent = true, desc = desc })

  vim.keymap.set(mode, lhs, rhs, opts)
end

M.noremap = function(mode, lhs, rhs, desc, other_opts)
  local opts = vim.tbl_extend("keep", other_opts or {}, { noremap = true })
  M.map(mode, lhs, rhs, desc, opts)
end

M.buf_map = function(mode, lhs, rhs, bufnr, desc, other_opts)
  local opts = vim.tbl_extend("keep", other_opts or {}, { buffer = bufnr })

  M.map(mode, lhs, rhs, desc, opts)
end

M.dap_map = function(mode, lhs, rhs, desc, other_opts)
  M.map(mode, lhs, rhs, desc, other_opts)
end

M.set_leader = function(leaderkey, localleaderkey)
  vim.g.mapleader = leaderkey
  vim.g.maplocalleader = localleaderkey or leaderkey
  M.map({ "n", "v" }, leaderkey, "<nop>")
end

return M
