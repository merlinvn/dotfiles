local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local M = {}

-- No border for maximized clients
local border_adjust = function(c)
  if c.maximized then -- no borders if only 1 client visible
    c.border_width = 0
  elseif #awful.screen.focused().clients > 1 then
    c.border_width = beautiful.border_width
    c.border_color = beautiful.border_focus
  end
end
local create_titlebar = function(c)
  -- buttons for the titlebar
  local buttons = gears.table.join(
    awful.button({}, 1, function()
      c:emit_signal("request::activate", "titlebar", { raise = true })
      awful.mouse.client.move(c)
    end),
    awful.button({}, 3, function()
      c:emit_signal("request::activate", "titlebar", { raise = true })
      awful.mouse.client.resize(c)
    end)
  )

  awful.titlebar(c):setup({
    { -- Left
      awful.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout = wibox.layout.fixed.horizontal,
    },
    { -- Middle
      { -- Title
        align = "center",
        widget = awful.titlebar.widget.titlewidget(c),
      },
      buttons = buttons,
      layout = wibox.layout.flex.horizontal,
    },
    { -- Right
      awful.titlebar.widget.floatingbutton(c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.stickybutton(c),
      awful.titlebar.widget.ontopbutton(c),
      awful.titlebar.widget.closebutton(c),
      layout = wibox.layout.fixed.horizontal(),
    },
    layout = wibox.layout.align.horizontal,
  })
end

-- Toggle titlebar on or off depending on show_title is true of false. Creates titlebar if it doesn't exist
local setTitlebar = function(client, show_title)
  if show_title then
    if client.titlebar == nil then
      client:emit_signal("request::titlebars", "rules", {})
    end
    awful.titlebar.show(client)
  else
    awful.titlebar.hide(client)
  end
end
M.setup = function()
  -- Signal function to execute when a new client appears.
  client.connect_signal("manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if
      awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position
    then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
    end
  end)

  -- Add a titlebar if titlebars_enabled is set to true in the rules.
  client.connect_signal("request::titlebars", create_titlebar)

  -- Enable sloppy focus, so that focus follows mouse, commented out to disable
  client.connect_signal("mouse::enter", function(c)
    -- c:emit_signal("request::activate", "mouse_enter", { raise = true })
  end)

  client.connect_signal("focus", border_adjust)
  client.connect_signal("property::maximized", border_adjust)
  client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
  end)

  -- trigger when client is changed to floating or tiled
  client.connect_signal("property::floating", function(c)
    setTitlebar(
      c,
      c.floating or c.first_tag and c.first_tag.layout.name == "floating"
    )
    if c.floating then
      local screen = awful.screen.focused()
      c.width = screen.geometry.width * 0.7
      c.height = screen.geometry.height * 0.8
      awful.placement.centered(c)
    end
  end)
end

return M
