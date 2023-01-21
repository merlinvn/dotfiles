local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet

ls.add_snippets("lua", {
  s("ignore", {
    t("--stylua: ignore"),
  }),
  s("require", {
    t("local "),
    i(1, "name"),
    t(" = require('"),
    i(2, "path"),
    t("')"),
  }),
})

-- return {
--   ignore = "--stylua: ignore",
--
--   lf = {
--     desc = "table function",
--     "local ",
--     i(1),
--     " = function(",
--     i(2),
--     ")",
--     newline "  ",
--     i(0),
--     newline "end",
--   },
--
--   -- TODO: I don't know how I would like to set this one up.
--   f = fmt("function({})\n  {}\nend", { i(1), i(0) }),
--
--   test = { "mirrored: ", i(1), " // ", same(1), " | ", i(0) },
--
--   req = fmt([[local {} = require("{}")]], {
--     d(2, require_var, { 1 }),
--     i(1),
--   }),
--
--   treq = fmt([[local {} = require("telescope.{}")]], {
--     d(2, require_var, { 1 }),
--     i(1),
--   }),
--
--   -- test = { "local ", i(1), ' = require("', f(function(args)
--   --   table.insert(RESULT, args[1])
--   --   return { "hi" }
--   -- end, { 1 }), '")', i(0) },
--
--   -- test = { i(1), " // ", d(2, function(args)
--   --   return snippet_from_nodes(nil, { str "hello" })
--   -- end, { 1 }), i(0) },
-- }
