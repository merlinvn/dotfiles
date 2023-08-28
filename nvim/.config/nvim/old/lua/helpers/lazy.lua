local M = {}

--[[
  Checks if a plugin is available.

  @param plugin (string) - The name of the plugin to check.

  @return (boolean) - Returns true if the plugin is available, otherwise false.
]]
function M.has(plugin)
  -- implementation
  return require("lazy.core.config").plugins[plugin] ~= nil
end

--[[

This function retrieves the options for a given plugin.

Parameters:
- name (string): The name of the plugin.

Return type:
- table: The options for the plugin.

Errors/Exceptions:
- None.

--]]

function M.opts(name)
  local plugin = require("lazy.core.config").plugins[name]

  if not plugin then
    return {}
  end

  local Plugin = require("lazy.core.plugin")
  return Plugin.values(plugin, "opts", false)
end

return M
