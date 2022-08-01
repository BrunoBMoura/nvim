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

local napolitan_colors = {
  snip_background = "#121212", -- 233
  background      = "#1C1C1C", -- 234
  divisor         = "#262626", -- 235
  delimiter       = "#d7af87", -- 180
  grey            = "#585858", -- 240
  dark_grey       = "#D7AFAF", -- 181
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

local napolitan_colorscheme = {
  -- Default UI
  Normal = {fg = napolitan_colors.white, bg = napolitan_colors.none},
  Error = {fg = napolitan_colors.red, bg = napolitan_colors.none},
  ErrorMsg = {fg = napolitan_colors.red, bg = napolitan_colors.none},
  Search = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  IncSearch = {fg = napolitan_colors.pink, bg = napolitan_colors.none, reverse = true},
  DiffChange = {fg = napolitan_colors.orange, bg = napolitan_colors.none, reverse = true},
  DiffText = {fg = napolitan_colors.orange, bg = napolitan_colors.none},
  SignColumn = {fg = napolitan_colors.orange, bg = napolitan_colors.none},
  SpellBad = {fg = napolitan_colors.white, bg = napolitan_colors.none, undercurl = true},
  SpellCap = {fg = napolitan_colors.white, bg = napolitan_colors.none},
  SpellRare = {fg = napolitan_colors.red, bg = napolitan_colors.none},
  WildMenu = {fg = napolitan_colors.black, bg = napolitan_colors.none},
  Pmenu = {fg = napolitan_colors.orange, bg = napolitan_colors.snip_background},
  PmenuThumb = {fg = napolitan_colors.divisor, bg = napolitan_colors.none},
  MatchParen = {fg = napolitan_colors.pink, bg = napolitan_colors.none, bold = true},
  NonText = {fg = napolitan_colors.grey, bg = napolitan_colors.none},
  StatusLine = {fg = napolitan_colors.divisor, bg = napolitan_colors.none},
  CursorLineNr = {fg = napolitan_colors.orange, bg = napolitan_colors.none},
  CursorLine = {fg = napolitan_colors.none, bg = napolitan_colors.divisor},
  TabLineSel = {fg = napolitan_colors.orange, bg = napolitan_colors.none},
  TabLineFill = {fg = napolitan_colors.none, bg = napolitan_colors.divisor},
  TabLine = {fg = napolitan_colors.none, bg = napolitan_colors.divisor},
  Title = {fg = napolitan_colors.white, bg = napolitan_colors.divisor},
  VertSplit = {fg = napolitan_colors.divisor, bg = napolitan_colors.none},
  StatusLineNc = {fg = napolitan_colors.divisor, bg = napolitan_colors.none},
  SpecialKey = {fg = napolitan_colors.yellow, bg = napolitan_colors.none},
  Visual = {fg = napolitan_colors.none, bg = napolitan_colors.visual},
  LineNr = {fg = napolitan_colors.grey, bg = napolitan_colors.none},
  MsgArea = {fg = napolitan_colors.white, bg = napolitan_colors.none},

  -- Syntax
  StorageClass = {fg = napolitan_colors.green, bg = napolitan_colors.none},
  Keyword = {fg = napolitan_colors.orange, bg = napolitan_colors.none},
  Comment = {fg = napolitan_colors.grey, bg = napolitan_colors.none},
  Constant = {fg = napolitan_colors.dark_grey, bg = napolitan_colors.none},
  String = {fg = napolitan_colors.string, bg = napolitan_colors.none},
  Number = {fg = napolitan_colors.purple, bg = napolitan_colors.none},
  Float = {fg = napolitan_colors.purple, bg = napolitan_colors.none},
  Character = {fg = napolitan_colors.cyan, bg = napolitan_colors.none},
  Boolean = {fg = napolitan_colors.purple, bg = napolitan_colors.none},
  Identifier = {fg = napolitan_colors.dark_grey, bg = napolitan_colors.none},
  Function = {fg = napolitan_colors.green, bg = napolitan_colors.none},
  Statement = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  Conditional = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  Repeat = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  Label = {fg = napolitan_colors.dark_grey, bg = napolitan_colors.none},
  Operator = {fg = napolitan_colors.aqua, bg = napolitan_colors.none},
  Exception = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  Type = {fg = napolitan_colors.yellow, bg = napolitan_colors.none},
  Structure = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  Typedef = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  PreProc = {fg = napolitan_colors.purple, bg = napolitan_colors.none},
  Include = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  Define = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  PreCondit = {fg = napolitan_colors.blue, bg = napolitan_colors.none},
  Macro = {fg = napolitan_colors.aqua, bg = napolitan_colors.none},
  Special = {fg = napolitan_colors.aqua, bg = napolitan_colors.none},
  SpecialChar = {fg = napolitan_colors.purple, bg = napolitan_colors.none},
  Tag = {fg = napolitan_colors.yellow, bg = napolitan_colors.none},
  Delimiter = {fg = napolitan_colors.delimiter, bg = napolitan_colors.none},
  SpecialComment = {fg = napolitan_colors.purple, bg = napolitan_colors.none},
  Debug = {fg = napolitan_colors.red, bg = napolitan_colors.none},
  Underlined = {fg = napolitan_colors.red, bg = napolitan_colors.none},
  Ignore = {fg = napolitan_colors.green, bg = napolitan_colors.none},
  Todo = {fg = napolitan_colors.red, bg = napolitan_colors.none},
  Conceal = {fg = napolitan_colors.red, bg = napolitan_colors.none},
  Directory = {fg = napolitan_colors.green, bg = napolitan_colors.none},
  FoldColumn = {fg = napolitan_colors.yellow, bg = napolitan_colors.none},
  ModeMsg = {fg = napolitan_colors.white, bg = napolitan_colors.none},
  MoreMsg = {fg = napolitan_colors.white, bg = napolitan_colors.none},
  Question = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  DiffAdd = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  diffAdded = {fg = napolitan_colors.red, bg = napolitan_colors.none},
  diffCommon = {fg = napolitan_colors.green, bg = napolitan_colors.none},
  Folded = {fg = napolitan_colors.purple, bg = napolitan_colors.none},
  WarningMsg = {fg = napolitan_colors.green, bg = napolitan_colors.none},

  -- Cmp
  CmpItemMenuDefault = {fg = napolitan_colors.orange, bg = napolitan_colors.snip_background},
  CmpItemAbbrDefault = {fg = napolitan_colors.white, bg = napolitan_colors.snip_background},
  CmpItemAbbrMatch = {fg = napolitan_colors.white, bg = napolitan_colors.snip_background, bold = true},
  CmpItemKindDefault = {fg = napolitan_colors.pink, bg = napolitan_colors.snip_background},

  -- LSP diagnostics
  DiagnosticError = {fg = napolitan_colors.red, bg = napolitan_colors.background},
  DiagnosticInfo = {fg = napolitan_colors.blue, bg = napolitan_colors.background},
  DiagnosticWarn = {fg = napolitan_colors.yellow, bg = napolitan_colors.background},
  GitGutterDelete = {fg = napolitan_colors.pink, bg = napolitan_colors.background},
  GitGutterAdd = {fg = napolitan_colors.green, bg = napolitan_colors.background},
  GitGutterChange = {fg = napolitan_colors.yellow, bg = napolitan_colors.background},

  -- TreeSitter Context
  TreesitterContext = {fg = napolitan_colors.white, bg = napolitan_colors.background},
  TreesitterContextLineNumber = {fg = napolitan_colors.orange, bg = napolitan_colors.none},

  -- NvimTree
  NvimTreeStatusLine = {fg = napolitan_colors.background, bg = napolitan_colors.background},
  NvimTreeStatusLineNc = {fg = napolitan_colors.background, bg = napolitan_colors.background},

  -- Python syntax
  pythonTSConstBuiltin = {fg = napolitan_colors.purple, bg = napolitan_colors.none},
  pythonTSFuncBuiltin = {fg = napolitan_colors.green, bg = napolitan_colors.none},
  pythonTSKeywordOperator = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  pythonTSConstructor = {fg = napolitan_colors.yellow, bg = napolitan_colors.none},

  -- Lua syntax
  luaTSOperator = {fg = napolitan_colors.aqua, bg = napolitan_colors.none},
  luaTSConstructor = {fg = napolitan_colors.delimiter, bg = napolitan_colors.none},
  luaTSKeywordOperator = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  luaTSKeyword = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  luaTSFuncBuiltin = {fg = napolitan_colors.pink, bg = napolitan_colors.none},

  -- Rust syntax
  rustTSFuncMacro = {fg = napolitan_colors.pink, bg = napolitan_colors.none},
  rustTSNamespace = {fg = napolitan_colors.white, bg = napolitan_colors.none},
}

for group, opts in pairs(napolitan_colorscheme) do
  vim.api.nvim_set_hl(0, group, opts)
end

