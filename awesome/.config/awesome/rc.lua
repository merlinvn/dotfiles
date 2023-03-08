-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local gmath = require("gears.math")
require("awful.autofocus")
local lain = require("lain")
local theme = require("default.theme")

-- Widget and layout library
local wibox = require("wibox")
local batteryarc_widget =
  require("awesome-wm-widgets.batteryarc-widget.batteryarc")
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")
local brightness_widget =
  require("awesome-wm-widgets.brightness-widget.brightness")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
HOME = os.getenv("HOME")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors,
  })
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
    -- Make sure we don't go into an endless error loop
    if in_error then
      return
    end
    in_error = true

    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err),
    })
    in_error = false
  end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(HOME .. "/.config/awesome/default/theme.lua")
-- beautiful.init(HOME .. "/.config/awesome/themes/copland/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- disable snap by mouse
awful.mouse.snap.edge_enabled = false

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
altkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.floating,
  -- awful.layout.suit.tile.left,
  -- awful.layout.suit.tile.bottom,
  -- awful.layout.suit.tile.top,
  -- awful.layout.suit.fair,
  -- awful.layout.suit.fair.horizontal,
  -- awful.layout.suit.spiral,
  -- awful.layout.suit.spiral.dwindle,
  awful.layout.suit.max,
  -- awful.layout.suit.max.fullscreen,
  awful.layout.suit.magnifier,
  -- awful.layout.suit.corner.nw,
  -- awful.layout.suit.corner.ne,
  -- awful.layout.suit.corner.sw,
  -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
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

mymainmenu = awful.menu({
  items = {
    { "awesome", myawesomemenu, beautiful.awesome_icon },
    { "open terminal", terminal },
  },
})

mylauncher =
  awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar
-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

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
  awful.tag(
    { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
    s,
    awful.layout.layouts[1]
  )

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

  -- local cpu = lain.widget.cpu({
  --   settings = function()
  --     widget:set_markup("  " .. string.format("%2.0f%% ", cpu_now.usage))
  --   end,
  -- })

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist({
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
  })

  -- Create the wibox
  local sys_tray = wibox.widget.systray({})
  sys_tray:set_base_size(18)
  -- beautiful.systray_icon_spacing = 5

  s.my_statusbar = awful.wibar({ position = "top", screen = s, height = 24 })

  local seperator = wibox.widget({
    -- shape = gears.shape["circle"],
    orientation = "vertical",
    widget = wibox.widget.separator,
    forced_width = 10,
  })

  -- Add widgets to the wibox
  s.my_statusbar:setup({
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      mylauncher,
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
        color = "#434c5e",
      }),
      seperator,
      ram_widget({}),
      seperator,
      brightness_widget({
        type = "icon_and_text",
        program = "brightnessctl",
        step = 5,
        timeout = 10,
      }),
      seperator,
      volume_widget({
        step = 5,
        device = "default",
      }),
      seperator,
      sys_tray,
      seperator,
      batteryarc_widget({
        show_current_level = true,
        arc_thickness = 1,
      }),
      seperator,
      mytextclock,
      s.mylayoutbox,
    },
  })
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(
  gears.table.join(
    awful.button({}, 3, function()
      mymainmenu:toggle()
    end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
  )
)
-- }}}

-- {{{ Key bindings

local function move_to_previous_tag()
  return function()
    local c = client.focus
    if not c then
      return
    end
    local t = c.screen.selected_tag
    local tags = c.screen.tags
    local idx = t.index
    local newtag = tags[gmath.cycle(#tags, idx - 1)]
    c:move_to_tag(newtag)
    awful.tag.viewprev()
  end
end

local function move_to_next_tag()
  return function()
    local c = client.focus
    if not c then
      return
    end
    local t = c.screen.selected_tag
    local tags = c.screen.tags
    local idx = t.index
    local newtag = tags[gmath.cycle(#tags, idx + 1)]
    c:move_to_tag(newtag)
    awful.tag.viewnext()
  end
end

local function focus_bydirection(dir)
  return function()
    -- if current layout is tile, then use the default focus_bydirection
    if awful.screen.focused().selected_tag.layout.name == "tile" then
      awful.client.focus.global_bydirection(dir)
    else
      if dir == "up" or dir == "left" then
        awful.client.focus.byidx(-1)
      elseif dir == "down" or dir == "right" then
        awful.client.focus.byidx(1)
      end
    end
    if client.focus then
      client.focus:raise()
    end
  end
end

local function swap_bydirection(dir)
  if not client.focus then
    return
  end
  if awful.screen.focused().selected_tag.layout.name == "tile" then
    awful.client.swap.global_bydirection(dir)
  else
    if dir == "up" or dir == "left" then
      awful.client.swap.byidx(-1)
    elseif dir == "down" or dir == "right" then
      awful.client.swap.byidx(1)
    end
  end
end

local function focus_byidx(relative_idx)
  return function()
    --   awful.client.focus.history.previous()
    awful.client.focus.byidx(relative_idx)
    if client.focus then
      client.focus:raise()
    end
  end
end

globalkeys = gears.table.join(
  -- app launcher
  -- Standard program
  awful.key({ modkey }, "Return", function()
    awful.spawn(terminal)
  end, { description = "open a terminal", group = "launcher" }),

  awful.key({ modkey, "Shift" }, "Return", function()
    awful.spawn("rofi -show combi")
  end, { description = "app launcher", group = "launcher" }),

  awful.key({ modkey, "Shift" }, "w", function()
    awful.spawn("rofi -show window")
  end, { description = "windows selector", group = "launcher" }),

  -- Prompt
  awful.key({ modkey }, "r", function()
    awful.screen.focused().mypromptbox:run()
  end, { description = "run prompt", group = "launcher" }),
  -- Menubar
  awful.key({ modkey }, "p", function()
    menubar.show()
  end, { description = "show the menubar", group = "launcher" }),

  -- awful.key({ modkey }, "d", function()
  --   awful.spawn("dmenu_run")
  -- end, { description = "run prompt", group = "launcher" }),

  -- system
  awful.key({ modkey, altkey }, "x", function()
    awful.spawn.with_shell("warpd --hint2")
  end, { description = "mouse hint2", group = "system" }),

  awful.key({ modkey, altkey }, "c", function()
    awful.spawn.with_shell("warpd --normal")
  end, { description = "mouse normal", group = "system" }),

  awful.key({ modkey, altkey }, "g", function()
    awful.spawn.with_shell("warpd --grid")
  end, { description = "mouse grid", group = "system" }),

  awful.key({ modkey, altkey }, "s", function()
    awful.spawn.with_shell("warpd --screen --oneshot")
  end, { description = "screen select", group = "system" }),

  awful.key({ modkey }, "bracketleft", function()
    brightness_widget:dec()
  end, { description = "brightness -", group = "system" }),

  awful.key({ modkey }, "bracketright", function()
    brightness_widget:inc()
  end, { description = "brightness +", group = "system" }),

  awful.key({}, "XF86AudioMute", function()
    awful.spawn.with_shell("pactl set-sink-mute @DEFAULT_SINK@ toggle")
  end, { description = "mute / unmute", group = "system" }),

  awful.key({}, "XF86AudioRaiseVolume", function()
    volume_widget:inc()
    -- awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ +10%")
  end, { description = "volume up", group = "system" }),

  awful.key({}, "XF86AudioLowerVolume", function()
    volume_widget:dec()
    -- awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ -10%")
  end, { description = "volume down", group = "system" }),

  awful.key({}, "XF86AudioMicMute", function()
    volume_widget:toggle()
    -- awful.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle")
  end, { description = "mute / unmute", group = "system" }),

  -- awesome related
  awful.key(
    { modkey, "Shift" },
    "r",
    awesome.restart,
    { description = "reload awesome", group = "awesome" }
  ),
  awful.key(
    { modkey, "Shift" },
    "x",
    awesome.quit,
    { description = "quit awesome", group = "awesome" }
  ),
  awful.key({ modkey }, "x", function()
    awful.prompt.run({
      prompt = "Run Lua code: ",
      textbox = awful.screen.focused().mypromptbox.widget,
      exe_callback = awful.util.eval,
      history_path = awful.util.get_cache_dir() .. "/history_eval",
    })
  end, { description = "lua execute prompt", group = "awesome" }),

  awful.key(
    { modkey },
    "s",
    hotkeys_popup.show_help,
    { description = "show help", group = "awesome" }
  ),
  awful.key({ modkey }, "w", function()
    mymainmenu:show()
  end, { description = "show main menu", group = "awesome" }),

  -- tags navigation
  awful.key(
    { modkey },
    "j",
    function()
      lain.util.tag_view_nonempty(-1)
    end,
    -- awful.tag.viewprev,
    { description = "view previous", group = "tag" }
  ),
  awful.key(
    { modkey },
    "k",
    function()
      lain.util.tag_view_nonempty(1)
    end,
    -- awful.tag.viewnext,
    { description = "view next", group = "tag" }
  ),
  -- move client to next / previous tag
  awful.key(
    { modkey, "Shift" },
    "j",
    move_to_previous_tag(),
    { description = "move client to previous", group = "tag" }
  ),

  awful.key(
    { modkey, "Shift" },
    "k",
    move_to_next_tag(),
    { description = "move client to next", group = "tag" }
  ),

  awful.key(
    { modkey },
    "Tab",
    awful.tag.history.restore,
    { description = "go back forth tag", group = "tag" }
  ),

  -- client navigation
  awful.key(
    { altkey },
    "Tab",
    focus_byidx(1),
    { description = "go next client", group = "client" }
  ),

  awful.key(
    { altkey, "Shift" },
    "Tab",
    focus_byidx(-1),
    { description = "go previous client", group = "client" }
  ),

  awful.key(
    { modkey },
    "Up",
    focus_bydirection("up"),
    { description = "focus up", group = "client" }
  ),

  awful.key(
    { modkey },
    "Down",
    focus_bydirection("down"),
    { description = "focus down", group = "client" }
  ),

  awful.key(
    { modkey },
    "Left",
    focus_bydirection("left"),
    { description = "focus left", group = "client" }
  ),

  awful.key(
    { modkey },
    "Right",
    focus_bydirection("right"),
    { description = "focus right", group = "client" }
  ),

  -- screen navigation
  awful.key({ modkey }, "l", function()
    awful.screen.focus_relative(1)
  end, { description = "focus the next screen", group = "screen" }),
  awful.key({ modkey }, "h", function()
    awful.screen.focus_relative(-1)
  end, { description = "focus the previous screen", group = "screen" }),

  -- urgent client
  awful.key(
    { modkey },
    "u",
    awful.client.urgent.jumpto,
    { description = "jump to urgent client", group = "client" }
  ),

  --

  awful.key({ modkey }, "space", function()
    awful.layout.inc(1)
  end, { description = "select next", group = "layout" }),
  awful.key({ modkey, "Shift" }, "space", function()
    awful.layout.inc(-1)
  end, { description = "select previous", group = "layout" }),

  awful.key({ modkey, "Control" }, "n", function()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
      c:emit_signal("request::activate", "key.unminimize", { raise = true })
    end
  end, { description = "restore minimized", group = "client" })
)

local move_speed = 15
clientkeys = gears.table.join(
  awful.key({ modkey }, "f", function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
  end, { description = "toggle fullscreen", group = "client" }),
  awful.key({ modkey, "Shift" }, "q", function(c)
    c:kill()
  end, { description = "close", group = "client" }),
  awful.key(
    { modkey, "Shift" },
    "f",
    awful.client.floating.toggle,
    { description = "toggle floating", group = "client" }
  ),
  awful.key({ modkey, "Control" }, "Return", function(c)
    c:swap(awful.client.getmaster())
  end, { description = "move to master", group = "client" }),

  -- move around
  awful.key({ modkey, "Shift" }, "Down", function(c)
    if c.floating then
      c:relative_move(0, move_speed, 0, 0)
    else
      swap_bydirection("down")
    end
  end, { description = "move down", group = "client" }),
  awful.key({ modkey, "Shift" }, "Up", function(c)
    if c.floating then
      c:relative_move(0, -move_speed, 0, 0)
    else
      swap_bydirection("up")
    end
  end, { description = "move up", group = "client" }),
  awful.key({ modkey, "Shift" }, "Left", function(c)
    if c.floating then
      c:relative_move(-move_speed, 0, 0, 0)
    else
      swap_bydirection("left")
      -- awful.client.swap.global_bydirection("left")
    end
  end, { description = "move left", group = "client" }),
  awful.key({ modkey, "Shift" }, "Right", function(c)
    if c.floating then
      c:relative_move(move_speed, 0, 0, 0)
    else
      swap_bydirection("right")
      -- awful.client.swap.global_bydirection("right")
    end
  end, { description = "move right", group = "client" }),

  awful.key({ modkey, "Shift" }, "l", function(c)
    c:move_to_screen()
  end, { description = "move to next screen", group = "client" }),
  awful.key({ modkey, "Shift" }, "h", function(c)
    c:move_to_screen(c.screen.index - 1)
  end, { description = "move to previous screen", group = "client" }),

  -- resize
  awful.key({ modkey, "Control" }, "Down", function(c)
    if c.floating then
      c:relative_move(0, 0, 0, move_speed)
    else
      awful.client.incwfact(-0.05)
    end
  end, { description = "resize -", group = "client" }),
  awful.key({ modkey, "Control" }, "Up", function(c)
    if c.floating then
      c:relative_move(0, 0, 0, -move_speed)
    else
      awful.client.incwfact(0.05)
    end
  end, { description = "resize +", group = "client" }),
  awful.key({ modkey, "Control" }, "Left", function(c)
    if c.floating then
      c:relative_move(0, 0, -move_speed, 0)
    else
      awful.tag.incmwfact(-0.05)
    end
  end, { description = "resize -", group = "client" }),
  awful.key({ modkey, "Control" }, "Right", function(c)
    if c.floating then
      c:relative_move(0, 0, move_speed, 0)
    else
      awful.tag.incmwfact(0.05)
    end
  end, { description = "resize +", group = "client" }),

  --
  awful.key({ modkey, "Control" }, "Return", function(c)
    c:swap(awful.client.getmaster())
  end, { description = "move to master", group = "client" }),
  -- awful.key({ modkey }, "o", function(c)
  --   c:move_to_screen()
  -- end, { description = "move to screen", group = "client" }),
  awful.key({ modkey }, "t", function(c)
    c.ontop = not c.ontop
  end, { description = "toggle keep on top", group = "client" }),
  awful.key({ modkey }, "n", function(c)
    -- The client currently has the input focus, so it cannot be
    -- minimized, since minimized clients can't have the focus.
    c.minimized = true
  end, { description = "minimize", group = "client" }),
  awful.key({ modkey }, "m", function(c)
    c.maximized = not c.maximized
    c:raise()
  end, { description = "(un)maximize", group = "client" }),
  awful.key({ modkey, "Control" }, "m", function(c)
    c.maximized_vertical = not c.maximized_vertical
    c:raise()
  end, { description = "(un)maximize vertically", group = "client" }),
  awful.key({ modkey, "Shift" }, "m", function(c)
    c.maximized_horizontal = not c.maximized_horizontal
    c:raise()
  end, { description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys = gears.table.join(
    globalkeys,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        tag:view_only()
      end
    end, { description = "view tag #" .. i, group = "tag" }),
    -- Toggle tag display.
    awful.key({ modkey, "Control" }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end, { description = "toggle tag #" .. i, group = "tag" }),
    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end, { description = "move focused client to tag #" .. i, group = "tag" }),
    -- Toggle tag on focused client.
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end, {
      description = "toggle focused client on tag #" .. i,
      group = "tag",
    })
  )
end

clientbuttons = gears.table.join(
  awful.button({}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
  end),
  awful.button({ modkey }, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.move(c)
  end),
  awful.button({ modkey }, 3, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.resize(c)
  end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
      size_hints_honor = false,
    },
  },

  -- No titlebars to normal
  {
    rule_any = { type = { "normal" } },
    properties = { titlebars_enabled = false },
  },
  -- Add titlebars to dialogs
  {
    rule_any = {
      type = { "dialog" },
    },
    properties = { titlebars_enabled = true },
  },
  -- Set applications to be maximized at startup.
  --
  -- find class or role via xprop command

  {
    rule = { class = "Gimp*", role = "gimp-image-window" },
    properties = { maximized = true },
  },

  { rule = { class = "inkscape" }, properties = { maximized = true } },

  { rule = { class = "Vlc" }, properties = { maximized = true } },

  {
    rule = { class = "VirtualBox Manager" },
    properties = { maximized = true },
  },

  {
    rule = { class = "VirtualBox Machine" },
    properties = { maximized = true },
  },

  -- Floating clients.
  {
    rule_any = {
      instance = {
        "DTA", -- Firefox addon DownThemAll.
        "copyq", -- Includes session name in class.
        "pinentry",
      },
      class = {
        "Arandr",
        "Blueberry",
        "Galculator",
        "Gnome-font-viewer",
        "Gpick",
        "Imagewriter",
        "Font-manager",
        "Kruler",
        "MessageWin", -- kalarm.
        "Oblogout",
        "Peek",
        "Skype",
        "System-config-printer.py",
        "Sxiv",
        "Unetbootin.elf",
        "Wpa_gui",
        "pinentry",
        "veromix",
        "xtightvncviewer",
        "Blueman-manager",
        "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
      },

      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        "Event Tester", -- xev.
      },
      role = {
        "AlarmWindow", -- Thunderbird's calendar.
        "ConfigManager", -- Thunderbird's about:config.
        "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
        "Preferences",
        "setup",
      },
    },
    properties = { floating = true },
  },

  -- Set Firefox to always map on the tag named "2" on screen 1.
  -- { rule = { class = "Firefox" },
  --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
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
client.connect_signal("request::titlebars", function(c)
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
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
  c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus", function(c)
  c.border_color = beautiful.border_normal
end)

-- Toggle titlebar on or off depending on show_title is true of false. Creates titlebar if it doesn't exist
local function setTitlebar(client, show_title)
  if show_title then
    if client.titlebar == nil then
      client:emit_signal("request::titlebars", "rules", {})
    end
    awful.titlebar.show(client)
  else
    awful.titlebar.hide(client)
  end
end

client.connect_signal("property::floating", function(c)
  setTitlebar(
    c,
    c.floating or c.first_tag and c.first_tag.layout.name == "floating"
  )
end)
-- }}}

-- {{{ Autostart
-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
  for _, cmd in ipairs(cmd_arr) do
    awful.spawn.with_shell(
      string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd)
    )
  end
end

run_once({ "unclutter -root" }) -- comma-separated entries

-- run commands everytime Aweasome is reloaded
do
  local cmds = {
    "brightnessctl set 50%",
    "nm-applet",
    "blueman-applet",
    "flameshot",
    "killall picom && picom --config " .. HOME .. "/.config/picom/picom.conf",
    "feh --bg-scale --randomize " .. HOME .. "/wallpapers/*",
  }
  for _, cmd in ipairs(cmds) do
    awful.spawn.with_shell(cmd)
  end
end

-- }}}
