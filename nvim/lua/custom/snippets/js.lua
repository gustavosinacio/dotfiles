local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.snippets = ls.snippets or {}
ls.snippets.all = ls.snippets.all or {}

-- Remove existing snippets
local filtered = vim.tbl_filter(function(snippet)
  return snippet.trigger ~= "clg"
end, ls.snippets.all or {})

ls.snippets.all = filtered

ls.add_snippets("all", {
  -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
  s("clg", {
    t("console.log(9821"),
    i(2), -- First placeholder
    t(", "),
    i(1), -- Second placeholder
    t(")"),
    i(0), -- Final cursor position
  }),
}, {
  key = "all",
})
