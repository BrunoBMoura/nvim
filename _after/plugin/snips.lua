local ls_status, ls = pcall(require, "luasnip")
if not ls_status then
  return
end

local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
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

local callbacks = {
  c = {
    title_format = function(args, _, _)
      local arg_text = args[1][1]
      local line = {
        init_chars = 10,
        end_chars = 2,
        total = 79,
        arg_len = string.len(arg_text)
      }
      local num_spaces = line.total - line.arg_len - line.init_chars - line.end_chars
      return arg_text .. string.rep(" ", num_spaces)
    end
  }
}

local c = {
  s("struct", fmt(
    [[
    /* {} definition. */
    typedef struct {{
      {}
    }} {};
    ]], {
      rep(1), i(0), i(1)
    })
  ),
  s("func", fmt(
    [[
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    /*  Name: {}*/
    /*                                                                           */
    /*  Purpose:                                                                 */
    /*                                                                           */
    /*                                                                           */
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    void {}(void) {{
        {}
        return;
    }} /* End of {}() */
    ]], {
      f(callbacks.c.title_format, {1}), i(1), i(0), rep(1)
    })
  )
}

local custom_snips = {
  tex = tex, c = c, lua = {}, ruby = {},
}

for filetype, snips in pairs(custom_snips) do
  ls.add_snippets(filetype, snips)
end
