local naughty = require("naughty")
local wibox = require("wibox")
local awful = require("awful")

local focused_screen_widget = wibox.widget({
  markup = " : " .. tostring(awful.screen.focused().index),
  align = "center",
  valign = "center",
  widget = wibox.widget.textbox,
})

function update_focused_screen_widget()
  -- naughty.notify({
  --   title = "SCR: " .. tostring(awful.screen.focused().index),
  --   text = "SCR: " .. tostring(awful.screen.focused().index),
  -- })
  focused_screen_widget.text = " : "
    .. tostring(awful.screen.focused().index)
end

client.connect_signal("focus", update_focused_screen_widget)
client.connect_signal("unfocus", update_focused_screen_widget)

return focused_screen_widget
