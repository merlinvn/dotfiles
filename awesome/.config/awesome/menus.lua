local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local M = {}

-- Create a launcher widget and a main menu
M.myawesomemenu = {
  {
    "hotkeys",
    function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end,
  },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  {
    "quit",
    function()
      awesome.quit()
    end,
  },
}

M.mymainmenu = awful.menu({
  items = {
    { "awesome", M.myawesomemenu, beautiful.awesome_icon },
    { "open terminal", terminal },
  },
})

M.mylauncher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = M.mymainmenu,
})

return M
