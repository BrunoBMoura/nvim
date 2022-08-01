vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.showtabline = 3
vim.opt.background = "dark"
vim.opt.list = true
vim.opt.fillchars = {
  stl = "―",
  fold = "۰",
  diff = "·"
}

vim.opt.listchars = {
  tab = "»·",
  trail = "·",
  eol = "¬"
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local napolitan_colors = {
  snip_background = "#121212", -- 233
  background      = "#1C1C1C", -- 234
  divisor         = "#262626", -- 235
  delimiter       = "#d7af87", -- 180
  grey            = "#585858", -- 240
  dark_grey       = "#D7AF87", -- 181
  visual          = "#303030", -- 236
  string          = "#AFD7AF", -- 151
  aqua            = "#5FD7AF", -- 079
  green           = "#AFAF87", -- 144
  blue            = "#5F87AF", -- 067
  red             = "#870000", -- 088
  orange          = "#D7875F", -- 173
  purple          = "#8787AF", -- 103
  pink            = "#D75F5F", -- 167
  yellow          = "#FFAF5F", -- 215
  cyan            = "#AFD7D7", -- 152
  black           = "#121212", -- 233
  white           = "#FFFFD7", -- 230
  none            = "NONE",
}

-- Default UI
hl("Normal", {fg = napolitan_colors.white, bg = napolitan_colors.none})
hl("Error", {fg = napolitan_colors.red, bg = napolitan_colors.none})
hl("ErrorMsg", {fg = napolitan_colors.red, bg = napolitan_colors.none})
hl("Search", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("IncSearch", {fg = napolitan_colors.pink, bg = napolitan_colors.none, reverse = true})
hl("DiffChange", {fg = napolitan_colors.orange, bg = napolitan_colors.none, reverse = true})
hl("DiffText", {fg = napolitan_colors.orange, bg = napolitan_colors.none})
hl("SignColumn", {fg = napolitan_colors.orange, bg = napolitan_colors.none})
hl("SpellBad", {fg = napolitan_colors.white, bg = napolitan_colors.none, undercurl = true})
hl("SpellCap", {fg = napolitan_colors.white, bg = napolitan_colors.none})
hl("SpellRare", {fg = napolitan_colors.red, bg = napolitan_colors.none})
hl("WildMenu", {fg = napolitan_colors.black, bg = napolitan_colors.none})
hl("Pmenu", {fg = napolitan_colors.orange, bg = napolitan_colors.snip_background})
hl("PmenuThumb", {fg = napolitan_colors.divisor, bg = napolitan_colors.none})
hl("MatchParen", {fg = napolitan_colors.pink, bg = napolitan_colors.none, bold = true})
hl("NonText", {fg = napolitan_colors.grey, bg = napolitan_colors.none})
hl("StatusLine", {fg = napolitan_colors.divisor, bg = napolitan_colors.none})
hl("CursorLineNr", {fg = napolitan_colors.orange, bg = napolitan_colors.none})
hl("CursorLine", {fg = napolitan_colors.none, bg = napolitan_colors.divisor})
hl("TabLineSel", {fg = napolitan_colors.orange, bg = napolitan_colors.none})
hl("TabLineFill", {fg = napolitan_colors.none, bg = napolitan_colors.divisor})
hl("TabLine", {fg = napolitan_colors.none, bg = napolitan_colors.divisor})
hl("Title", {fg = napolitan_colors.white, bg = napolitan_colors.divisor})
hl("VertSplit", {fg = napolitan_colors.divisor, bg = napolitan_colors.none})
hl("StatusLine", {fg = napolitan_colors.divisor, bg = napolitan_colors.none})
hl("StatusLineNc", {fg = napolitan_colors.divisor, bg = napolitan_colors.none})
hl("SpecialKey", {fg = napolitan_colors.yellow, bg = napolitan_colors.none})
hl("Visual", {fg = napolitan_colors.none, bg = napolitan_colors.visual})
hl("LineNr", {fg = napolitan_colors.grey, bg = napolitan_colors.none})
hl("MsgArea", {fg = napolitan_colors.white, bg = napolitan_colors.none})
-- Syntax
hl("StorageClass", {fg = napolitan_colors.green, bg = napolitan_colors.none})
hl("Keyword", {fg = napolitan_colors.orange, bg = napolitan_colors.none})
hl("Comment", {fg = napolitan_colors.grey, bg = napolitan_colors.none})
hl("Constant", {fg = napolitan_colors.dark_grey, bg = napolitan_colors.none})
hl("String", {fg = napolitan_colors.string, bg = napolitan_colors.none})
hl("Number", {fg = napolitan_colors.purple, bg = napolitan_colors.none})
hl("Float", {fg = napolitan_colors.purple, bg = napolitan_colors.none})
hl("Character", {fg = napolitan_colors.cyan, bg = napolitan_colors.none})
hl("Boolean", {fg = napolitan_colors.purple, bg = napolitan_colors.none})
hl("Identifier", {fg = napolitan_colors.dark_grey, bg = napolitan_colors.none})
hl("Function", {fg = napolitan_colors.green, bg = napolitan_colors.none})
hl("Statement", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("Conditional", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("Repeat", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("Label", {fg = napolitan_colors.dark_grey, bg = napolitan_colors.none})
hl("Operator", {fg = napolitan_colors.aqua, bg = napolitan_colors.none})
hl("Exception", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("Type", {fg = napolitan_colors.yellow, bg = napolitan_colors.none})
hl("Structure", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("Typedef", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("PreProc", {fg = napolitan_colors.purple, bg = napolitan_colors.none})
hl("Include", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("Define", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("PreCondit", {fg = napolitan_colors.blue, bg = napolitan_colors.none})
hl("Macro", {fg = napolitan_colors.aqua, bg = napolitan_colors.none})
hl("Special", {fg = napolitan_colors.aqua, bg = napolitan_colors.none})
hl("SpecialChar", {fg = napolitan_colors.purple, bg = napolitan_colors.none})
hl("Tag", {fg = napolitan_colors.yellow, bg = napolitan_colors.none})
hl("Delimiter", {fg = napolitan_colors.delimiter, bg = napolitan_colors.none})
hl("SpecialComment", {fg = napolitan_colors.purple, bg = napolitan_colors.none})
hl("Debug", {fg = napolitan_colors.red, bg = napolitan_colors.none})
hl("Underlined", {fg = napolitan_colors.red, bg = napolitan_colors.none})
hl("Ignore", {fg = napolitan_colors.green, bg = napolitan_colors.none})
hl("Error", {fg = napolitan_colors.red, bg = napolitan_colors.none})
hl("Todo", {fg = napolitan_colors.red, bg = napolitan_colors.none})
hl("Conceal", {fg = napolitan_colors.red, bg = napolitan_colors.none})
hl("Directory", {fg = napolitan_colors.green, bg = napolitan_colors.none})
hl("FoldColumn", {fg = napolitan_colors.yellow, bg = napolitan_colors.none})
hl("ModeMsg", {fg = napolitan_colors.white, bg = napolitan_colors.none})
hl("MoreMsg", {fg = napolitan_colors.white, bg = napolitan_colors.none})
hl("Question", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("DiffAdd", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("diffAdded", {fg = napolitan_colors.red, bg = napolitan_colors.none})
hl("diffCommon", {fg = napolitan_colors.green, bg = napolitan_colors.none})
hl("Folded", {fg = napolitan_colors.purple, bg = napolitan_colors.none})
hl("WarningMsg", {fg = napolitan_colors.green, bg = napolitan_colors.none})

-- Cmp
hl("CmpItemMenuDefault", {fg = napolitan_colors.orange, bg = napolitan_colors.snip_background})
hl("CmpItemAbbrDefault", {fg = napolitan_colors.white, bg = napolitan_colors.snip_background})
hl("CmpItemAbbrMatch", {fg = napolitan_colors.white, bg = napolitan_colors.snip_background, bold = true})
hl("CmpItemKindDefault", {fg = napolitan_colors.pink, bg = napolitan_colors.snip_background})

-- Gitgutter
hl("GitGutterDelete", {fg = napolitan_colors.pink, bg = napolitan_colors.background})
hl("GitGutterAdd", {fg = napolitan_colors.green, bg = napolitan_colors.background})
hl("GitGutterChange", {fg = napolitan_colors.yellow, bg = napolitan_colors.background})

-- TreeSitter
hl("TreesitterContext", {fg = napolitan_colors.white, bg = napolitan_colors.background})
hl("TreesitterContextLineNumber", {fg = napolitan_colors.orange, bg = napolitan_colors.none})

-- Python
hl("pythonTSConstBuiltin", {fg = napolitan_colors.purple, bg = napolitan_colors.none})
hl("pythonTSFuncBuiltin", {fg = napolitan_colors.green, bg = napolitan_colors.none})
hl("pythonTSKeywordOperator", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("pythonTSConstructor", {fg = napolitan_colors.yellow, bg = napolitan_colors.none})

-- Lua
hl("luaTSOperator", {fg = napolitan_colors.aqua, bg = napolitan_colors.none})
hl("luaTSConstructor", {fg = napolitan_colors.delimiter, bg = napolitan_colors.none})
hl("luaTSKeywordOperator", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("luaTSKeyword", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("luaTSFuncBuiltin", {fg = napolitan_colors.pink, bg = napolitan_colors.none})

-- Rust
hl("rustTSConstBuiltin", {fg = napolitan_colors.orange, bg = napolitan_colors.none})
hl("rustTSFuncMacro", {fg = napolitan_colors.pink, bg = napolitan_colors.none})
hl("rustTSNamespace", {fg = napolitan_colors.white, bg = napolitan_colors.none})
