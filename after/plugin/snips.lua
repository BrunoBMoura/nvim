local ls_status, ls = pcall(require, "luasnip")
if not ls_status then
  return
end

local s = ls.snippet
local i = ls.insert_node
local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt
local rep = extras.rep

local tex = {
  -- begin/end block
  s("beg", fmt(
    [[
    \begin{{{}}}
        {}
    \end{{{}}}
    ]], {
      i(1), i(0), rep(1)
    })
  ),
  -- items
  s("item", fmt([[\item {} ]], {i(1)})),
  s("item", fmt([[\item \textbf{{{}}} ]], {i(1)})),
  s("item", fmt([[\item \emph{{{}}} ]], {i(1)})),
  s("item", fmt([[\item \textbf{{\emph{{{}}}}} ]], {i(1)})),
}

local c = {
  s("struct", fmt(
    [[
    /* {} definition. */
    typedef struct {{
      {}
    }} {};
    ]], {rep(1), i(0), i(1)})
  ),
}

local custom_snips = {
  tex = tex, c = c, lua = {}, ruby = {},
}

for filetype, snips in pairs(custom_snips) do
  ls.add_snippets(filetype, snips)
end
