local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")
local brightness_widget =
  require("awesome-wm-widgets.brightness-widget.brightness")
local volume_widget = require("awesome-wm-widgets.pactl-widget.volume")
local batteryarc_widget =
  require("awesome-wm-widgets.batteryarc-widget.batteryarc")
local logout_menu_widget =
  require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")

local menus = require("menus")

local M = {}

M.setup = function()
  -- Keyboard map indicator and switcher
  local mykeyboardlayout = awful.widget.keyboardlayout()
  -- Create a textclock widget
  local mytextclock = wibox.widget.textclock()

  -- Create a wibox for each screen and add it
  local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t)
      t:view_only()
    end),
    awful.button({ modkey }, 1, function(t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
      if client.focus then
        client.focus:toggle_tag(t)
      end
    end),
    awful.button({}, 4, function(t)
      awful.tag.viewnext(t.screen)
    end),
    awful.button({}, 5, function(t)
      awful.tag.viewprev(t.screen)
    end)
  )

  local tasklist_buttons = gears.table.join(
    -- left click
    awful.button({}, 1, function(c)
      if c == client.focus then
      -- c.minimized = true
      else
        c:emit_signal("request::activate", "tasklist", { raise = true })
      end
    end),
    -- right click show all clients
    awful.button({}, 3, function()
      awful.menu.client_list({ theme = { width = 250 } })
    end)

    -- -- scroll up
    -- awful.button({}, 4, function()
    --   awful.client.focus.byidx(1)
    -- end),
    -- -- scroll down
    -- awful.button({}, 5, function()
    --   awful.client.focus.byidx(-1)
    -- end)
  )

  local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
      local wallpaper = beautiful.wallpaper
      -- If wallpaper is a function, call it with the screen
      if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
      end
      gears.wallpaper.maximized(wallpaper, s, true)
    end
  end

  -- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
  screen.connect_signal("property::geometry", set_wallpaper)

  -- awful.screen.connect_for_each_screen(function(s)
  --   t.at_screen_connect(s)
  -- end)

  awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    local tags = awful.tag(
      { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
      s,
      { awful.layout.layouts[1] }
    )

    tags[8].layout = awful.layout.suit.max

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)

    s.mylayoutbox:buttons(gears.table.join(
      awful.button({}, 1, function()
        awful.layout.inc(1)
      end),
      awful.button({}, 3, function()
        awful.layout.inc(-1)
      end),
      awful.button({}, 4, function()
        awful.layout.inc(1)
      end),
      awful.button({}, 5, function()
        awful.layout.inc(-1)
      end)
    ))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist({
      screen = s,
      filter = awful.widget.taglist.filter.noempty,
      buttons = taglist_buttons,
    })

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist({
      screen = s,
      filter = awful.widget.tasklist.filter.currenttags,
      buttons = tasklist_buttons,
      style = {
        -- shape_border_width = 1,
        -- shape_border_color = "#777777",
        -- shape = gears.shape.rounded_rect,
      },
      layout = {
        spacing = 5,
        max_widget_size = awful.screen.focused().workarea.width * 0.10,
        layout = wibox.layout.flex.horizontal,
      },
      widget_template = {
        {
          {
            {
              {
                id = "icon_role",
                widget = wibox.widget.imagebox,
              },
              margins = 2,
              widget = wibox.container.margin,
            },
            {
              {
                id = "text_role",
                widget = wibox.widget.textbox,
              },
              left = 3,
              widget = wibox.container.margin,
            },
            layout = wibox.layout.fixed.horizontal,
          },
          left = 10,
          right = 10,
          widget = wibox.container.margin,
        },
        id = "background_role",
        widget = wibox.container.background,
      },
    })

    -- Create the wibox
    local sys_tray = wibox.widget.systray({})
    sys_tray:set_base_size(20)
    -- beautiful.systray_icon_spacing = 1

    s.my_statusbar = awful.wibar({ position = "top", screen = s, height = 24 })

    local seperator = wibox.widget({
      -- shape = gears.shape["circle"],
      orientation = "vertical",
      widget = wibox.widget.separator,
      color = beautiful.colors.dark4,
      forced_width = 10,
    })

    local cw = calendar_widget({
      theme = "nord",
      placement = "top_right",
      start_sunday = true,
      --mouse support
      previous_month_button = 1,
      next_month_button = 3,
    })

    mytextclock:connect_signal("button::press", function(_, _, _, button)
      if button == 1 then
        cw.toggle()
      end
    end)

    -- Add widgets to the wibox
    s.my_statusbar:setup({
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        logout_menu_widget(),
        seperator,
        -- menus.mylauncher,
        s.mytaglist,
        s.mypromptbox,
        seperator,
      },
      s.mytasklist, -- Middle widget
      shape = gears.shape[s],
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        -- mykeyboardlayout,
        seperator,
        cpu_widget({
          width = 50,
          step_width = 2,
          step_spacing = 0,
          color = beautiful.colors.neutral_blue,
        }),
        seperator,
        ram_widget({
          color_free = beautiful.colors.light2,
          color_used = beautiful.colors.neutral_orange,
          color_buf = beautiful.colors.neutral_yellow,
        }),
        seperator,
        brightness_widget({
          type = "icon_and_text",
          program = "brightnessctl",
          step = 5,
          timeout = 10,
        }),
        seperator,
        volume_widget({
          -- step = 5,
          -- device = "default",
          -- widget_type = "vertical_bar",
          -- shape = "rounded_bar",
          -- main_color = beautiful.colors.light2,
          -- mute_color = beautiful.colors.neutral_red,
          -- bg_color = beautiful.colors.dark3,
        }),
        seperator,
        sys_tray,
        seperator,
        batteryarc_widget({
          font = "JetBrains Mono Nerd Font 6",
          show_current_level = true,
          arc_thickness = 2,
          charging_color = beautiful.colors.neutral_green,
          low_level_color = beautiful.colors.neutral_red,
          medium_level_color = beautiful.colors.neutral_yellow,
          bg_color = beautiful.colors.dark0,
          main_color = beautiful.colors.light2,
          show_notification_mode = "on_click",
        }),
        seperator,
        mytextclock,
        s.mylayoutbox,
      },
    })
  end)
end

return M
