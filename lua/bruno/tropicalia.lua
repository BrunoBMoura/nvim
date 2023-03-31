local M = {}

local function highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local colors = {
  background      = "#1C1C1B",
  visual          = "#303030",
  divisor         = "#262626",
  khaki           = "#C3AA97",
  string          = "#84B2AC",
  cyan            = "#99A59D",
  grey            = "#585858",
  aqua            = "#8CCBAB",
  green           = "#BDBB89",
  blue            = "#4B878E",
  red             = "#D75F5F",
  orange          = "#D89879",
  purple          = "#998AA5",
  yellow          = "#DBB278",
  pink            = "#DF7C7C",
  black           = "#171717",
  white           = "#DDD8B8"
}

local code_syntax = {
  Comment      = {fg = colors.grey,   bg = colors.background},
  Constant     = {fg = colors.cyan, bg = colors.background},
  String       = {fg = colors.string,   bg = colors.background},
  Character    = {fg = colors.string,   bg = colors.background},
  Number       = {fg = colors.blue},
  Float        = {fg = colors.blue},
  Boolean      = {fg = colors.blue},

  Identifier   = {fg = colors.cyan, bg = colors.background},
  Function     = {fg = colors.green,  bg = colors.background},

  Keyword      = {fg = colors.orange, bg = colors.background},
  Statement    = {fg = colors.orange, bg = colors.background},
  Conditional  = {fg = colors.orange},
  Repeat       = {fg = colors.orange},
  Label        = {fg = colors.cyan},
  Operator     = {fg = colors.white,   bg = colors.background},
  Exception    = {fg = colors.red},

  PreProc      = {fg = colors.purple, bg = colors.background},
  Include      = {fg = colors.blue,   bg = colors.background},
  Define       = {fg = colors.blue,   bg = colors.background},
  PreCondit    = {fg = colors.blue,    bg = colors.background},
  Macro        = {fg = colors.orange, bg = colors.background},

  StorageClass = {fg = colors.pink},
  Type         = {fg = colors.orange, bg = colors.background},
  Structure    = {fg = colors.red,    bg = colors.background},
  Typedef      = {fg = colors.orange, bg = colors.background},

  Special      = {fg = colors.red,      bg = colors.background},
  SpecialChar  = {fg = colors.purple,   bg = colors.background},
  Tag          = {fg = colors.yellow,   bg = colors.background},
  SpecialComment = {fg = colors.purple, bg = colors.background},
  Delimiter    = {fg = colors.khaki,   bg = colors.background},
  Debug        = {fg = colors.red,      bg = colors.background},

  Underlined   = {fg = colors.red, bg = colors.background},
  Ignore       = {fg = colors.green, bg = colors.background},
  Todo         = {fg = colors.red, bg = colors.background, bold = true},
  Error        = {fg = colors.red, bg = colors.background, bold = true}
}

local editor_syntax = {
  Normal       = {fg = colors.white, bg = colors.background},
  ErrorMsg     = {fg = colors.red, bg = colors.background},
  Search       = {fg = colors.red, bg = colors.background},
  IncSearch    = {fg = colors.red, bg = colors.background, reverse = true},
  DiffText     = {fg = colors.yellow, bg = colors.black, bold = true},
  SignColumn   = {fg = colors.orange, bg = colors.background},
  SpellBad     = {fg = colors.white, bg = colors.background, undercurl = true},
  SpellCap     = {fg = colors.white, bg = colors.background},
  SpellRare    = {fg = colors.red, bg = colors.background},
  Pmenu        = {fg = colors.white, bg = colors.black},
  PmenuSel     = {fg = colors.orange, bg = colors.background},
  PmenuThumb   = {fg = colors.red, bg = colors.background},
  PmenuSbar    = {fg = colors.aqua, bg = colors.background},
  MatchParen   = {fg = colors.red},
  CursorLineNr = {fg = colors.orange, bg = colors.background},
  CursorLine   = {bg = colors.divisor},
  TabLineSel   = {fg = colors.orange, bg = colors.background},
  TabLineFill  = {bg = colors.background},
  TabLine      = {bg = colors.divisor},
  Title        = {fg = colors.white, bg = colors.divisor},
  VertSplit    = {fg = colors.divisor, bg = colors.background},
  SpecialKey   = {fg = colors.yellow, bg = colors.background},
  Visual       = {bg = colors.visual},
  LineNr       = {fg = colors.grey, bg = colors.background},
  Directory    = {fg = colors.green},
  FoldColumn   = {fg = colors.yellow, bg = colors.background},
  DiffAdd      = {fg = colors.green, bg = colors.black, bold = true},
  DiffDelete   = {fg = colors.red, bg = colors.black, bold = true},
  DiffChange   = {fg = colors.yellow, bg = colors.black, bold = true},
  Folded       = {fg = colors.grey, bg = colors.background},
  WarningMsg   = {fg = colors.green, bg = colors.background},
}

local meta_syntax = {
  NonText      = {fg = colors.grey},
  Question     = {fg = colors.red, bg = colors.background},
  StatusLineNc = {fg = colors.divisor, bg = colors.background},
  WildMenu     = {fg = colors.grey, bg = colors.background},
  diffAdded    = {fg = colors.orange, bg = colors.background},
  diffCommon   = {fg = colors.green, bg = colors.background},
}

local plugin_syntax = {
  -- TreeSitter
  ["@symbol"]                = {fg = colors.cyan, bg = colors.brackground},
  ["@variable"]              = {fg = colors.white,  bg = colors.brackground},
  ["@variable.builtin"]      = {fg = colors.aqua,   bg = colors.brackground},
  ["@function"]              = {fg = colors.green,  bg = colors.brackground},
  ["@function.call"]         = {fg = colors.green,  bg = colors.brackground},
  ["@function.builtin"]      = {fg = colors.green,  bg = colors.brackground},
  ["@function.macro"]        = {fg = colors.green, bg = colors.brackground},
  ["@method"]                = {fg = colors.green,  bg = colors.brackground},
  ["@method.call"]           = {fg = colors.green,  bg = colors.brackground},
  ["@keyword"]               = {fg = colors.orange, bg = colors.brackground},
  ["@keyword.function"]      = {fg = colors.orange, bg = colors.brackground},
  ["@keyword.operator"]      = {fg = colors.orange,   bg = colors.brackground},
  ["@keyword.return"]        = {fg = colors.pink,    bg = colors.brackground},
  ["@constant"]              = {fg = colors.cyan, bg = colors.brackground},
  ["@constant.macro"]        = {fg = colors.cyan, bg = colors.brackground},
  ["@constant.builtin"]      = {fg = colors.blue, bg = colors.brackground},
  ["@comment"]               = {fg = colors.grey,   bg = colors.brackground},
  ["@string"]                = {fg = colors.string,   bg = colors.brackground},
  ["@string.regex"]          = {fg = colors.purple, bg = colors.brackground},
  ["@string.escape"]         = {fg = colors.purple, bg = colors.brackground},
  ["@string.special"]        = {fg = colors.purple, bg = colors.brackground},
  ["@constructor"]           = {fg = colors.blue,   bg = colors.brackground},
  ["@parameter"]             = {fg = colors.cyan, bg = colors.brackground},
  ["@field"]                 = {fg = colors.cyan, bg = colors.brackground},
  ["@operator"]              = {fg = colors.khaki,   bg = colors.brackground},
  ["@property"]              = {fg = colors.cyan, bg = colors.brackground},
  ["@macro"]                 = {fg = colors.orange, bg = colors.brackground},
  ["@preproc"]               = {fg = colors.blue,    bg = colors.brackground},
  ["@define"]                = {fg = colors.blue,   bg = colors.brackground},
  ["@include"]               = {fg = colors.blue,   bg = colors.brackground},
  ["@debug"]                 = {fg = colors.aqua,   bg = colors.brackground},
  ["@namespace"]             = {fg = colors.white,  bg = colors.brackground},
  ["@tag"]                   = {fg = colors.aqua,   bg = colors.brackground},
  ["@tag.delimiter"]         = {fg = colors.aqua,   bg = colors.brackground},
  ["@tag.attribute"]         = {fg = colors.aqua,   bg = colors.brackground},
  ["@punctuation.delimiter"] = {fg = colors.khaki, bg = colors.brackground},
  ["@punctuation.bracket"]   = {fg = colors.khaki, bg = colors.brackground},
  ["@punctuation.special"]   = {fg = colors.green,    bg = colors.brackground},
  ["@type"]                  = {fg = colors.yellow,   bg = colors.brackground},
  ["@type.builtin"]          = {fg = colors.orange,   bg = colors.brackground},
  ["@type.definition"]       = {fg = colors.yellow,    bg = colors.brackground},
  ["@type.qualifier"]        = {fg = colors.yellow,    bg = colors.brackground},

  -- Cmp
  CmpItemMenuDefault = {fg = colors.red, bg = colors.black},
  CmpItemAbbrDefault = {fg = colors.white, bg = colors.black},
  CmpItemAbbrMatch   = {fg = colors.white, bg = colors.black, bold = true},
  CmpItemKindDefault = {fg = colors.red, bg = colors.black},

  -- LSP diagnostics
  DiagnosticError = {fg = colors.red, bg = colors.background},
  DiagnosticInfo  = {fg = colors.blue, bg = colors.background},
  DiagnosticWarn  = {fg = colors.yellow, bg = colors.background},

  -- Git gutter
  GitGutterDelete = {fg = colors.red, bg = colors.background},
  GitGutterAdd    = {fg = colors.green, bg = colors.background},
  GitGutterChange = {fg = colors.yellow, bg = colors.background},

  -- TreeSitter Context
  TreesitterContext           = {fg = colors.white, bg = colors.background},
  TreesitterContextLineNumber = {fg = colors.orange, bg = colors.brackground},

  -- NvimTree
  NvimTreeStatusLine       = {fg = colors.background, bg = colors.background},
  NvimTreeStatusLineNc     = {fg = colors.background, bg = colors.background},
  NvimTreeIndentMarker     = {fg = colors.visual, bg = colors.brackground},
  NvimTreeWindowPicker     = {fg = colors.white, bg = colors.blue},
  NvimTreeOpenedFolderIcon = {fg = colors.purple},
  NvimTreeClosedFolderIcon = {fg = colors.purple},

  -- Indent-blank-line
  IndentBlankLineChar               = {fg = colors.divisor},
  IndentBlankLineSpaceChar          = {fg = colors.divisor},
  IndentBlankLineSpaceCharBlankLine = {fg = colors.divisor},

  -- DevIcon
  DevIconPy  = {fg = colors.yellow},
  DevIconRs  = {fg = colors.orange},
  DevIconC   = {fg = colors.blue},
  DevIconCpp = {fg = colors.string},
  DevIconLua = {fg = colors.blue},
  DevIconRb  = {fg = colors.red},
  DevIconTxt = {fg = colors.green},
  DevIconMd  = {fg = colors.khaki},
  DevIconH   = {fg = colors.purple}
}

function M.setup()

  for group, opts in pairs(code_syntax) do
    highlight(group, opts)
  end

  for group, opts in pairs(plugin_syntax) do
    highlight(group, opts)
  end

  for group, opts in pairs(editor_syntax) do
    highlight(group, opts)
  end

  for group, opts in pairs(meta_syntax) do
    highlight(group, opts)
  end

end

function M.get_colors()
  return colors
end

return M
