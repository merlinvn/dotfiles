local M = {}

function M.reload_modules()
  -- from ThePrimeagen
  -- Because TJ gave it to me.  Makes me happpy.  Put it next to his other
  -- awesome things.
  local lua_dirs = vim.fn.glob("./lua/*", false, true)
  for _, dir in ipairs(lua_dirs) do
    dir = string.gsub(dir, "./lua/", "")
    require("plenary.reload").reload_module(dir)
  end
end

function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end
return M
