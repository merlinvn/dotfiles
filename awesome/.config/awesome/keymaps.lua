local awful = require("awful")
local gears = require("gears")
local lain = require("lain")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local gmath = require("gears.math")
local volume_widget = require("awesome-wm-widgets.pactl-widget.volume")
local brightness_widget =
  require("awesome-wm-widgets.brightness-widget.brightness")
local menus = require("menus")
local logout_popup =
  require("awesome-wm-widgets.logout-popup-widget.logout-popup")

-- local naughty = require("naughty")

local move_speed = 15
local M = {}

local function focus_bydirection(dir)
  return function()
    local floating_count = 0
    local maximized_count = 0
    -- Get the current tag
    local current_tag = awful.screen.focused().selected_tag
    local current_layout = current_tag.layout.name

    -- Get all clients in the current tag
    local clients = current_tag:clients()

    for _, c in ipairs(clients) do
      if c.floating then
        floating_count = floating_count + 1
      end
      if c.maximized then
        maximized_count = maximized_count + 1
      end
    end

    -- naughty.notify({
    --   text = "floating_count: "
    --     .. floating_count
    --     .. " maximized_count: "
    --     .. maximized_count
    --     .. " layout: "
    --     .. current_layout,
    -- })

    if
      floating_count == 0
      and maximized_count == 0
      and current_layout == "tile"
    then
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

local function focus_byidx(relative_idx)
  return function()
    --   awful.client.focus.history.previous()
    awful.client.focus.byidx(relative_idx)
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

M.launcher = gears.table.join(
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

  -- usefull apps
  awful.key({ modkey }, "F1", function()
    awful.spawn.with_shell("brave")
  end, { description = "show the menubar", group = "launcher" }),
  awful.key({ modkey }, "F2", function()
    awful.spawn.with_shell("pcmanfm")
  end, { description = "show the menubar", group = "launcher" }),
  awful.key({ modkey }, "F5", function()
    awful.spawn.with_shell(
      "flameshot gui -r -c -p ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H:%M:%S).png"
    )
  end, { description = "show the menubar", group = "launcher" })
)
M.system = gears.table.join(

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

  awful.key({ modkey }, "0", function()
    volume_widget:toggle()
    -- awful.spawn.with_shell("pactl set-sink-mute @DEFAULT_SINK@ toggle")
  end, { description = "mute / unmute", group = "system" }),

  awful.key({ modkey }, "equal", function()
    volume_widget:inc()
    -- awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ +10%")
  end, { description = "volume up", group = "system" }),

  awful.key({ modkey }, "minus", function()
    volume_widget:dec()
    -- awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ +10%")
  end, { description = "volume down", group = "system" }),

  awful.key({}, "XF86AudioMute", function()
    volume_widget:toggle()
    -- awful.spawn.with_shell("pactl set-sink-mute @DEFAULT_SINK@ toggle")
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
    -- volume_widget:toggle()
    awful.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle")
  end, { description = "mute / unmute", group = "system" })
)

M.awesome = gears.table.join(
  awful.key(
    { modkey, "Shift" },
    "r",
    awesome.restart,
    { description = "reload awesome", group = "awesome" }
  ),

  -- logout popup
  awful.key({ modkey, "Shift" }, "x", function()
    logout_popup.launch({
      phrases = {
        "Time to say goodbye?",
      },
      logout = "Logout",
      restart = "Restart",
      shutdown = "Shutdown",
    })
  end, { description = "show logout screen", group = "awesome" }),

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
    menus.mymainmenu:show()
  end, { description = "show main menu", group = "awesome" })
)

M.navigation = gears.table.join(
  -- tags
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
  )
)

M.tag_num = (function()
  local keys = {}

  -- Bind all key numbers to tags.
  -- Be careful: we use keycodes to make it work on any keyboard layout.
  -- This should map on the top row of your keyboard, usually 1 to 9.
  for i = 1, 9 do
    keys = gears.table.join(
      keys,
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
      end, {
        description = "move focused client to tag #" .. i,
        group = "tag",
      }),
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

  return keys
end)()

M.layout = gears.table.join(
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

M.clientkeys = gears.table.join(
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

  awful.key({ modkey }, "y", function(c)
    c.sticky = not c.sticky
  end, { description = "toggle sticky (show on all tags)", group = "client" }),

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

M.clientbuttons = gears.table.join(
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

M.setup = function()
  local globalkeys = gears.table.join(
    -- app launcher
    M.launcher,
    -- system
    M.system,
    -- awesome related
    M.awesome,
    -- navigation
    M.navigation,
    -- tag number
    M.tag_num,
    -- layout related
    M.layout
  )

  -- Set keys
  root.keys(globalkeys)
end

return M
