local M = {}

local function highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local colors = {
  background      = "#1C1C1B",
  divisor         = "#262626",
  sand            = "#D7AF87",
  visual          = "#303030",
  grey            = "#585858",
  pastel          = "#C29F9E",
  aqua            = "#87D7AF",
  carbon          = "#9A8E7C",
  green           = "#AFAF87",
  blue            = "#4B878E",
  red             = "#D75F5F",
  orange          = "#E58B69",
  purple          = "#8087AB",
  yellow          = "#DCCB77",
  pink            = "#DF7C7C",
  cyan            = "#84B2AC",
  black           = "#171717",
  white           = "#DDD8B8",
  dark_green      = "#1A1900",
  dark_red        = "#420000",
  dark_orange     = "#461100",
}

local code_syntax = {
  Comment      = {fg = colors.grey,   bg = colors.background},
  Constant     = {fg = colors.pastel, bg = colors.background},
  String       = {fg = colors.cyan,   bg = colors.background},
  Character    = {fg = colors.cyan,   bg = colors.background},
  Number       = {fg = colors.purple},
  Float        = {fg = colors.purple},
  Boolean      = {fg = colors.purple},

  Identifier   = {fg = colors.pastel, bg = colors.background},
  Function     = {fg = colors.green,  bg = colors.background},

  Keyword      = {fg = colors.orange, bg = colors.background},
  Statement    = {fg = colors.orange, bg = colors.background},
  Conditional  = {fg = colors.orange},
  Repeat       = {fg = colors.orange},
  Label        = {fg = colors.pastel},
  Operator     = {fg = colors.aqua,   bg = colors.background},
  Exception    = {fg = colors.red},

  PreProc      = {fg = colors.purple, bg = colors.background},
  Include      = {fg = colors.blue,   bg = colors.background},
  Define       = {fg = colors.blue,   bg = colors.background},
  PreCondit    = {fg = colors.red,    bg = colors.background},
  Macro        = {fg = colors.orange, bg = colors.background},

  StorageClass = {fg = colors.pink},
  Type         = {fg = colors.sand, bg = colors.background},
  Structure    = {fg = colors.red,    bg = colors.background},
  Typedef      = {fg = colors.orange, bg = colors.background},

  Special      = {fg = colors.red,      bg = colors.background},
  SpecialChar  = {fg = colors.purple,   bg = colors.background},
  Tag          = {fg = colors.yellow,   bg = colors.background},
  SpecialComment = {fg = colors.purple, bg = colors.background},
  Delimiter    = {fg = colors.yellow,   bg = colors.background},
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
  DiffText     = {fg = colors.yellow, bg = colors.dark_orange, bold = true},
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
  TabLineFill  = {bg = colors.divisor},
  TabLine      = {bg = colors.divisor},
  Title        = {fg = colors.white, bg = colors.divisor},
  VertSplit    = {fg = colors.divisor, bg = colors.background},
  SpecialKey   = {fg = colors.yellow, bg = colors.background},
  Visual       = {bg = colors.visual},
  LineNr       = {fg = colors.grey, bg = colors.background},
  Directory    = {fg = colors.green},
  FoldColumn   = {fg = colors.yellow, bg = colors.background},
  DiffAdd      = {fg = colors.green, bg = colors.dark_green, bold = true},
  DiffDelete   = {fg = colors.red, bg = colors.dark_red, bold = true},
  DiffChange   = {fg = colors.yellow, bg = colors.dark_orange, bold = true},
  Folded       = {fg = colors.grey, bg = colors.background},
  WarningMsg   = {fg = colors.green, bg = colors.background},
}

local meta_syntax = {
  NonText      = {fg = colors.grey},
  Question     = {fg = colors.red, bg = colors.background},
  StatusLineNc = {fg = colors.divisor, bg = colors.background},
  WildMenu     = {fg = colors.grey, bg = colors.background},
  diffAdded    = {fg = colors.sand, bg = colors.background},
  diffCommon   = {fg = colors.green, bg = colors.background},
}

local plugin_syntax = {
  -- TreeSitter
  ["@symbol"]           = {fg = colors.pastel, bg = colors.brackground},
  ["@variable"]         = {fg = colors.white,  bg = colors.brackground},
  ["@variable.builtin"] = {fg = colors.aqua,   bg = colors.brackground},
  ["@function"]         = {fg = colors.green,  bg = colors.brackground},
  ["@function.call"]    = {fg = colors.green,  bg = colors.brackground},
  ["@function.builtin"] = {fg = colors.green,  bg = colors.brackground},
  ["@function.macro"]   = {fg = colors.orange, bg = colors.brackground},
  ["@method"]           = {fg = colors.green,  bg = colors.brackground},
  ["@method.call"]      = {fg = colors.green,  bg = colors.brackground},
  ["@keyword"]          = {fg = colors.orange, bg = colors.brackground},
  ["@keyword.function"] = {fg = colors.orange, bg = colors.brackground},
  ["@keyword.operator"] = {fg = colors.aqua,   bg = colors.brackground},
  ["@keyword.return"]   = {fg = colors.red,    bg = colors.brackground},
  ["@constant"]         = {fg = colors.pastel, bg = colors.brackground},
  ["@constant.macro"]   = {fg = colors.orange, bg = colors.brackground},
  ["@constant.builtin"] = {fg = colors.purple, bg = colors.brackground},
  ["@comment"]          = {fg = colors.grey,   bg = colors.brackground},
  ["@string"]           = {fg = colors.cyan,   bg = colors.brackground},
  ["@string.regex"]     = {fg = colors.purple, bg = colors.brackground},
  ["@string.escape"]    = {fg = colors.purple, bg = colors.brackground},
  ["@string.special"]   = {fg = colors.purple, bg = colors.brackground},
  ["@constructor"]      = {fg = colors.blue,   bg = colors.brackground},
  ["@parameter"]        = {fg = colors.pastel, bg = colors.brackground},
  ["@field"]            = {fg = colors.pastel, bg = colors.brackground},
  ["@operator"]         = {fg = colors.aqua,   bg = colors.brackground},
  ["@property"]         = {fg = colors.pastel, bg = colors.brackground},
  ["@macro"]            = {fg = colors.orange, bg = colors.brackground},
  ["@preproc"]          = {fg = colors.red,    bg = colors.brackground},
  ["@define"]           = {fg = colors.blue,   bg = colors.brackground},
  ["@include"]          = {fg = colors.blue,   bg = colors.brackground},
  ["@debug"]            = {fg = colors.aqua,   bg = colors.brackground},
  ["@namespace"]        = {fg = colors.white,  bg = colors.brackground},
  ["@tag"]              = {fg = colors.aqua,   bg = colors.brackground},
  ["@tag.delimiter"]    = {fg = colors.aqua,   bg = colors.brackground},
  ["@tag.attribute"]    = {fg = colors.aqua,   bg = colors.brackground},
  ["@punctuation.delimiter"] = {fg = colors.carbon, bg = colors.brackground},
  ["@punctuation.bracket"]   = {fg = colors.carbon, bg = colors.brackground},
  ["@punctuation.special"]   = {fg = colors.red, bg = colors.brackground},
  ["@type"]             = {fg = colors.sand,   bg = colors.brackground},
  ["@type.builtin"]     = {fg = colors.sand,   bg = colors.brackground},
  ["@type.definition"]  = {fg = colors.red,     bg = colors.brackground},
  ["@type.qualifier"]   = {fg = colors.red,      bg = colors.brackground},

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

  -- DevIcon
  DevIconPy  = {fg = colors.yellow},
  DevIconRs  = {fg = colors.orange},
  DevIconC   = {fg = colors.blue},
  DevIconCpp = {fg = colors.cyan},
  DevIconLua = {fg = colors.blue},
  DevIconRb  = {fg = colors.red},
  DevIconTxt = {fg = colors.green},
  DevIconMd  = {fg = colors.carbon},
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
