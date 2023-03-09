local beautiful = require("beautiful")
local awful = require("awful")
local keymaps = require("keymaps")

local M = {}

M.setup = function()
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
        keys = keymaps.clientkeys,
        buttons = keymaps.clientbuttons,
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
          "feh",
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
      properties = {
        floating = true,
        width = 800,
        height = 600,
        placement = awful.placement.centered,
      },
    },

    -- open client on specific screen and tag
    {
      rule_any = {
        class = { "calibre" },
      },
      properties = { tag = "1" },
    },
    {
      rule_any = {
        class = { "Alacritty" },
      },
      properties = { tag = "2" },
    },
    {
      rule_any = {
        class = { "browser" },
      },
      properties = { tag = "3" },
    },
    {
      rule_any = {
        class = {
          "Nautilus",
          "Files",
          "Pcmanfm",
        },
      },
      properties = { tag = "5" },
    },
    {
      rule_any = {
        class = {
          "discord",
          "Telegram",
          "Slack",
          "Signal",
          "zoom",
        },
      },
      properties = { tag = "8" },
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.

    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
  }
end
return M
