---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = os.getenv("HOME") .. "/.config/awesome/themes/neo/"

-- local naughty = require("naughty")
-- naughty.notify({
--   title = "theme",
--   text = themes_path,
-- })

local theme = {}

theme.font = "JetBrains Mono Nerd Font 8"

theme.colors = {
  dark0_hard = "#1d2021",
  dark0 = "#282828",
  dark0_soft = "#32302f",
  dark1 = "#3c3836",
  dark2 = "#504945",
  dark3 = "#665c54",
  dark4 = "#7c6f64",
  light0_hard = "#f9f5d7",
  light0 = "#fbf1c7",
  light0_soft = "#f2e5bc",
  light1 = "#ebdbb2",
  light2 = "#d5c4a1",
  light3 = "#bdae93",
  light4 = "#a89984",
  bright_red = "#fb4934",
  bright_green = "#b8bb26",
  bright_yellow = "#fabd2f",
  bright_blue = "#83a598",
  bright_purple = "#d3869b",
  bright_aqua = "#8ec07c",
  bright_orange = "#fe8019",
  neutral_red = "#cc241d",
  neutral_green = "#98971a",
  neutral_yellow = "#d79921",
  neutral_blue = "#458588",
  neutral_purple = "#b16286",
  neutral_aqua = "#689d6a",
  neutral_orange = "#d65d0e",
  faded_red = "#9d0006",
  faded_green = "#79740e",
  faded_yellow = "#b57614",
  faded_blue = "#076678",
  faded_purple = "#8f3f71",
  faded_aqua = "#427b58",
  faded_orange = "#af3a03",
  gray = "#928374",
}

theme.bg_normal = theme.colors.dark0
theme.fg_normal = theme.colors.light4
theme.bg_focus = theme.colors.dark4
theme.fg_focus = theme.colors.light0
theme.bg_urgent = theme.colors.neutral_orange
theme.fg_urgent = theme.colors.light0

theme.bg_minimize = theme.colors.dark0
theme.fg_minimize = theme.colors.faded_aqua
theme.bg_systray = theme.bg_normal

theme.tasklist_bg = theme.bg_normal
theme.tasklist_fg_normal = theme.fg_normal
theme.tasklist_bg_focus = theme.colors.dark2
theme.tasklist_fg_focus = theme.fg_focus
theme.tasklist_bg_urgent = theme.colors.neutral_orange
theme.tasklist_fg_urgent = theme.colors.light0

theme.useless_gap = dpi(0)
theme.border_width = dpi(1)
theme.border_normal = theme.colors.dark2
theme.border_focus = theme.colors.bright_green
theme.border_marked = theme.colors.bright_orange

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
-- currently we only show occupied tags, so we don't need to show squares
-- local taglist_square_size = dpi(4)
-- theme.taglist_squares_sel =
--   theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
-- theme.taglist_squares_unsel =
--   theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path
  .. "titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path
  .. "titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path
  .. "titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path
  .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path
  .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path
  .. "titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path
  .. "titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path
  .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path
  .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path
  .. "titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path
  .. "titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path
  .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path
  .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path
  .. "titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path
  .. "titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path
  .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path
  .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path
  .. "titlebar/maximized_focus_active.png"

-- theme.wallpaper = themes_path.."background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "layouts/fairhw.png"
theme.layout_fairv = themes_path .. "layouts/fairvw.png"
theme.layout_floating = themes_path .. "layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "layouts/magnifierw.png"
theme.layout_max = themes_path .. "layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "layouts/tileleftw.png"
theme.layout_tile = themes_path .. "layouts/tilew.png"
theme.layout_tiletop = themes_path .. "layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon =
  theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
