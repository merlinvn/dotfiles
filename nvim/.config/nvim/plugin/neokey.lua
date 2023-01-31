-- Description: Neokey mode for Vim. This is a plugin that remaps the keys for navigation in Vim.
-- function to toggle neokey mode

local find_function = function(keymap, key)
  for _, v in ipairs(keymap) do
    if v.lhs == key then
      return v
    end
  end
  return nil
end

local H = {}
H.key_db = {}

local store_keys = function()
  if vim.tbl_isempty(H.key_db) == false then
    return
  end
  for _ , pairs in ipairs(H.keymaps) do
    local k = pairs[1]
    -- local v = pairs[2]
    H.key_db[k] = {rhs=k}
    local ctr_k = "<C-" .. string.upper(k) .. ">"
    H.key_db[ctr_k] = find_function(vim.api.nvim_get_keymap("n"), ctr_k)
  end
  -- print(vim.inspect(H.key_db))
end

local map_key = function(from, to)
  -- store the original keymap
  vim.api.nvim_set_keymap("n", from, to, { noremap = true, silent = true })

  -- -- map <C-from> to <C-to>
  if H.key_db["<C-" .. string.upper(from) .. ">"] ~= nil then
    vim.api.nvim_set_keymap("n", "<C-" .. string.upper(from) .. ">", H.key_db["<C-" .. string.upper(from) .. ">"].rhs,
      { noremap = true, silent = true })
  end
  -- vim.api.nvim_set_keymap("n", "<C-" .. string.upper(from) .. ">", H.key_db["<C-" .. string.upper(to) .. ">"].rhs,
  --   { noremap = true, silent = true })
  -- -- map <S-from> to <S-to>
  -- vim.api.nvim_set_keymap("n", string.upper(from), H.key_db[string.upper(to)].rhs, { noremap = true, silent = true })
  -- -- map <A-from> to <A-to>
  -- vim.api.nvim_set_keymap("n", "<M-" .. from .. ">", H.key_db["<M-" .. to .. ">"].rhs, { noremap = true, silent = true })
end

local restore_key = function()
  -- print(vim.inspect(H.key_db))
  for k, v in pairs(H.key_db) do
      vim.api.nvim_set_keymap("n", k, v.rhs, { noremap = true, silent = true })
  end
end

H.keymaps = {
  { "n", "h" },
  { "h", "j" },
  { "u", "k" },
  { "i", "l" },

  { "j", "n" },
  { "k", "u" },
  { "l", "i" },
}

function _G.toggle_neokey()
  if vim.g.neokey == 1 then
    vim.g.neokey = 0
    print("Neokey mode disabled")
    -- reset keymaps
    restore_key()
  else
    vim.g.neokey = 1
    print("Neokey mode enabled")
    store_keys()
    for _, keymap in ipairs(H.keymaps) do
      map_key(keymap[1], keymap[2])
      -- print(vim.inspect(vim.g.key_db["j"]))
    end
    -- print(vim.inspect(H.key_db)
  end
end

-- map <leader>ok to toggle neokey mode
vim.keymap.set("n", "<leader>ok", "<cmd>lua toggle_neokey()<CR>",
  { noremap = true, silent = true, desc = "Toggle Neokey mode" })
