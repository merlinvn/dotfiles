local Util = require("lazy.core.util")
local M = {}

-- store local data
local H = {}

---@param silent boolean?
---@param values? {[1]:any, [2]:any}
function M.toggle(option, silent, values)
  if values then
    if vim.opt_local[option]:get() == values[1] then
      vim.opt_local[option] = values[2]
    else
      vim.opt_local[option] = values[1]
    end
    return Util.info(
      "Set " .. option .. " to " .. vim.opt_local[option]:get(),
      { title = "Option" }
    )
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
  if buf_state == nil then
    buf_state = true
  end

  if buf_state then
    vim.diagnostic.disable(buf_id)
  else
    vim.diagnostic.enable(buf_id)
  end

  local new_buf_state = not buf_state
  H.buffer_diagnostic_state[buf_id] = new_buf_state

  return new_buf_state and "  diagnostic" or "nodiagnostic"
end

return M
