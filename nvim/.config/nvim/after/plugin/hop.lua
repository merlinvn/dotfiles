local status, hop = pcall(require, "hop")
if (not status) then return end

local c = require("colorbuddy.color").colors
local Group = require("colorbuddy.group").Group
local s = require("colorbuddy.style").styles

Group.new("HopNextKey", c.orange, nil, s.bold)
Group.new("HopNextKey1", c.cyan:light(), nil, s.bold)
Group.new("HopNextKey2", c.green:light(), nil, s.bold)

hop.setup { keys = "arsgmeioqwfpbjluyzxcdvkhtn" }
