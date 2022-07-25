local M = {}

M.map = function(tbl)
  if tbl[3] == nil then
    tbl[3] = {noremap = true, silent = true}
  end
  vim.api.nvim_set_keymap("", tbl[1], tbl[2], tbl[3])
end

M.imap = function(tbl)
  if tbl[3] == nil then
    tbl[3] = {noremap = true, silent = true}
  end
  vim.api.nvim_set_keymap("i", tbl[1], tbl[2], tbl[3])
end

M.nmap = function(tbl)
  if tbl[3] == nil then
    tbl[3] = {noremap = true, silent = true}
  end
  vim.api.nvim_set_keymap("n", tbl[1], tbl[2], tbl[3])
end

M.vmap = function(tbl)
  if tbl[3] == nil then
    tbl[3] = {noremap = true, silent = true}
  end
  vim.api.nvim_set_keymap("v", tbl[1], tbl[2], tbl[3])
end

M.omap = function(tbl)
  if tbl[3] == nil then
    tbl[3] = {noremap = true, silent = true}
  end
  vim.api.nvim_set_keymap("o", tbl[1], tbl[2], tbl[3])
end
return M
