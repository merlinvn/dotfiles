-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
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
beautiful.init(HOME .. "/.config/awesome/neo/theme.lua")
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

-- Set the notification timeout to 2 seconds
naughty.config.defaults.timeout = 2
-- }}}

-- {{{ Menu
local menus = require("menus")
-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar

local wibar = require("wibar")
wibar.setup()

-- }}}

-- {{{ Mouse bindings
root.buttons(
  gears.table.join(
    awful.button({}, 3, function()
      menus.mymainmenu:toggle()
    end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
  )
)
-- }}}

-- {{{ Key bindings
local keymaps = require("keymaps")
keymaps.setup()
-- }}}

-- {{{ Rules
local rules = require("rules")
rules.setup()
-- }}}

-- {{{ Signals
local signals = require("signals")
signals.setup()
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
    "picom --config " .. HOME .. "/.config/picom/picom.conf",
    "feh --bg-scale --randomize " .. HOME .. "/wallpapers/*",
  }
  for _, cmd in ipairs(cmds) do
    awful.spawn.with_shell(cmd)
  end
end

-- }}}
