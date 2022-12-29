local M = {}

local function highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local colors = {
  background      = "#1A1A1A",
  divisor         = "#262626",
  delimiter       = "#D7AF87",
  grey            = "#585858",
  pastel          = "#D7AFAF",
  visual          = "#303030",
  aqua            = "#87D7AF",
  green           = "#AFAF87",
  blue            = "#5F87AF",
  red             = "#870000",
  orange          = "#E8946A",
  purple          = "#8787AF",
  magenta         = "#D75F5F",
  yellow          = "#F3E295",
  pink            = "#DF7C7C",
  cyan            = "#BCDCC9",
  black           = "#121212",
  white           = "#FFFFD7",
  dark_green      = "#1A1900",
  dark_magenta    = "#420000",
  dark_orange     = "#461100",
  none            = "none"
}

local colorscheme = {
  ["@symbol"]           = {fg = colors.pastel, bg = colors.none},
  ["@variable"]         = {fg = colors.white, bg = colors.none},
  ["@variable.builtin"] = {fg = colors.aqua, bg = colors.none},

  ["@function"]         = {fg = colors.green, bg = colors.none},
  ["@function.call"]    = {fg = colors.green, bg = colors.none},
  ["@function.builtin"] = {fg = colors.green, bg = colors.none},
  ["@function.macro"]   = {fg = colors.pastel, bg = colors.none},

  ["@method"]           = {fg = colors.green, bg = colors.none},
  ["@method.call"]      = {fg = colors.green, bg = colors.none},

  ["@keyword"]          = {fg = colors.magenta, bg = colors.none},
  ["@keyword.function"] = {fg = colors.magenta, bg = colors.none},
  ["@keyword.operator"] = {fg = colors.aqua, bg = colors.none},
  ["@keyword.return"]   = {fg = colors.magenta, bg = colors.none},

  ["@constant"]         = {fg = colors.pastel, bg = colors.none},
  ["@constant.macro"]   = {fg = colors.magenta, bg = colors.none},
  ["@constant.builtin"] = {fg = colors.yellow, bg = colors.none},

  ["@comment"]          = {fg = colors.grey, bg = colors.none},
  ["@string"]           = {fg = colors.cyan, bg = colors.none},
  ["@string.regex"]     = {fg = colors.purple, bg = colors.none},
  ["@string.escape"]    = {fg = colors.purple, bg = colors.none},
  ["@string.special"]   = {fg = colors.purple, bg = colors.none},

  ["@constructor"]      = {fg = colors.yellow, bg = colors.none},
  ["@parameter"]        = {fg = colors.pastel, bg = colors.none},
  ["@field"]            = {fg = colors.pastel, bg = colors.none},

  ["@operator"]         = {fg = colors.aqua, bg = colors.none},
  ["@property"]         = {fg = colors.pastel, bg = colors.none},

  ["@macro"]            = {fg = colors.orange, bg = colors.none},
  ["@preproc"]          = {fg = colors.magenta, bg = colors.none},
  ["@define"]           = {fg = colors.magenta, bg = colors.none},
  ["@include"]          = {fg = colors.magenta, bg = colors.none},
  ["@debug"]            = {fg = colors.aqua, bg = colors.none},
  ["@namespace"]        = {fg = colors.pastel, bg = colors.none},

  ["@tag"]              = {fg = colors.aqua, bg = colors.none},
  ["@tag.delimiter"]    = {fg = colors.aqua, bg = colors.none},
  ["@tag.attribute"]    = {fg = colors.aqua, bg = colors.none},

  ["@punctuation.delimiter"] = {fg = colors.orange, bg = colors.none},
  ["@punctuation.bracket"]   = {fg = colors.orange, bg = colors.none},
  ["@punctuation.special"]   = {fg = colors.orange, bg = colors.none},

  ["@type"]             = {fg = colors.yellow, bg = colors.none},
  ["@type.builtin"]     = {fg = colors.yellow, bg = colors.none},
  ["@type.definition"]  = {fg = colors.pink, bg = colors.none},
  ["@type.qualifier"]   = {fg = colors.magenta, bg = colors.none},

  -- Default UI
  Normal       = {fg = colors.white, bg = colors.none},
  Error        = {fg = colors.red, bg = colors.none},
  ErrorMsg     = {fg = colors.red, bg = colors.none},
  Search       = {fg = colors.magenta, bg = colors.none},
  IncSearch    = {fg = colors.magenta, bg = colors.none, reverse = true},
  DiffText     = {fg = colors.yellow, bg = colors.dark_orange, bold = true},
  SignColumn   = {fg = colors.orange, bg = colors.none},
  SpellBad     = {fg = colors.white, bg = colors.none, undercurl = true},
  SpellCap     = {fg = colors.white, bg = colors.none},
  SpellRare    = {fg = colors.red, bg = colors.none},
  WildMenu     = {fg = colors.grey, bg = colors.none},
  Pmenu        = {fg = colors.white, bg = colors.black},
  PmenuSel     = {fg = colors.orange, bg = colors.none},
  PmenuThumb   = {fg = colors.magenta, bg = colors.none},
  PmenuSbar    = {fg = colors.aqua, bg = colors.none},
  MatchParen   = {fg = colors.magenta, bg = colors.none},
  NonText      = {fg = colors.grey, bg = colors.none},
  CursorLineNr = {fg = colors.pink, bg = colors.none},
  CursorLine   = {fg = colors.none, bg = colors.divisor},
  TabLineSel   = {fg = colors.pink, bg = colors.none},
  TabLineFill  = {fg = colors.none, bg = colors.divisor},
  TabLine      = {fg = colors.none, bg = colors.divisor},
  Title        = {fg = colors.white, bg = colors.divisor},
  VertSplit    = {fg = colors.divisor, bg = colors.none},
  StatusLineNc = {fg = colors.divisor, bg = colors.none},
  SpecialKey   = {fg = colors.yellow, bg = colors.none},
  Visual       = {fg = colors.none, bg = colors.visual},
  LineNr       = {fg = colors.grey, bg = colors.none},
  MsgArea      = {fg = colors.white, bg = colors.none},

  -- Syntax
  StorageClass = {fg = colors.pink, bg = colors.none},
  Keyword      = {fg = colors.pink, bg = colors.none},
  Comment      = {fg = colors.grey, bg = colors.none},
  Constant     = {fg = colors.pastel, bg = colors.none},
  String       = {fg = colors.cyan, bg = colors.none},
  Number       = {fg = colors.purple, bg = colors.none},
  Float        = {fg = colors.purple, bg = colors.none},
  Character    = {fg = colors.cyan, bg = colors.none},
  Boolean      = {fg = colors.purple, bg = colors.none},
  Identifier   = {fg = colors.pastel, bg = colors.none},
  Function     = {fg = colors.green, bg = colors.none},
  Statement    = {fg = colors.magenta, bg = colors.none},
  Conditional  = {fg = colors.magenta, bg = colors.none},
  Repeat       = {fg = colors.magenta, bg = colors.none},
  Label        = {fg = colors.pastel, bg = colors.none},
  Operator     = {fg = colors.aqua, bg = colors.none},
  Exception    = {fg = colors.magenta, bg = colors.none},
  Type         = {fg = colors.yellow, bg = colors.none},
  Structure    = {fg = colors.magenta, bg = colors.none},
  Typedef      = {fg = colors.magenta, bg = colors.none},
  PreProc      = {fg = colors.purple, bg = colors.none},
  Include      = {fg = colors.magenta, bg = colors.none},
  Define       = {fg = colors.magenta, bg = colors.none},
  PreCondit    = {fg = colors.blue, bg = colors.none},
  Macro        = {fg = colors.blue, bg = colors.none},
  Special      = {fg = colors.magenta, bg = colors.none},
  SpecialChar  = {fg = colors.purple, bg = colors.none},
  Tag          = {fg = colors.yellow, bg = colors.none},
  Delimiter    = {fg = colors.orange, bg = colors.none},
  SpecialComment = {fg = colors.purple, bg = colors.none},
  Debug          = {fg = colors.red, bg = colors.none},
  Underlined     = {fg = colors.red, bg = colors.none},
  Ignore         = {fg = colors.green, bg = colors.none},
  Todo           = {fg = colors.red, bg = colors.none},
  Conceal        = {fg = colors.red, bg = colors.none},
  Directory      = {fg = colors.green, bg = colors.none},
  FoldColumn     = {fg = colors.yellow, bg = colors.none},
  ModeMsg        = {fg = colors.white, bg = colors.none},
  MoreMsg        = {fg = colors.white, bg = colors.none},
  Question       = {fg = colors.magenta, bg = colors.none},
  DiffAdd        = {fg = colors.green, bg = colors.dark_green, bold = true},
  DiffDelete     = {fg = colors.magenta, bg = colors.dark_magenta, bold = true},
  DiffChange     = {fg = colors.yellow, bg = colors.dark_orange, bold = true},
  diffAdded      = {fg = colors.delimiter, bg = colors.none},
  diffCommon     = {fg = colors.green, bg = colors.none},
  Folded         = {fg = colors.grey, bg = colors.none},
  WarningMsg     = {fg = colors.green, bg = colors.none},

  -- Cmp
  CmpItemMenuDefault = {fg = colors.magenta, bg = colors.black},
  CmpItemAbbrDefault = {fg = colors.white, bg = colors.black},
  CmpItemAbbrMatch   = {fg = colors.white, bg = colors.black, bold = true},
  CmpItemKindDefault = {fg = colors.magenta, bg = colors.black},

  -- LSP diagnostics
  DiagnosticError = {fg = colors.red, bg = colors.background},
  DiagnosticInfo  = {fg = colors.blue, bg = colors.background},
  DiagnosticWarn  = {fg = colors.yellow, bg = colors.background},

  -- Git gutter
  GitGutterDelete = {fg = colors.magenta, bg = colors.background},
  GitGutterAdd    = {fg = colors.green, bg = colors.background},
  GitGutterChange = {fg = colors.yellow, bg = colors.background},

  -- TreeSitter Context
  TreesitterContext           = {fg = colors.white, bg = colors.background},
  TreesitterContextLineNumber = {fg = colors.pink, bg = colors.none},

  -- NvimTree
  NvimTreeStatusLine   = {fg = colors.background, bg = colors.background},
  NvimTreeStatusLineNc = {fg = colors.background, bg = colors.background},
  NvimTreeIndentMarker = {fg = colors.visual, bg = colors.none},
}

function M.setup()
  for group, opts in pairs(colorscheme) do
    highlight(group, opts)
  end
end

function M.get_colors()
  return colors
end

return M
