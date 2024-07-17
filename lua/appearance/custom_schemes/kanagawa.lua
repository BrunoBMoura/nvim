local kanagawa_status, kanagawa = pcall(require, "kanagawa")
if not kanagawa_status then
  return {}
end

kanagawa.setup({
  -- Remove bold and/or italic tokens and remove background from
  -- from ui edges.
  keywordStyle   = { italic = false, bold = false },
  statementStyle = { italic = false, bold = false },
  commentStyle   = { italic = false, bold = false },
  constantStyle  = { italic = false, bold = false },
  colors = {
    theme = {
      dragon = {
        ui = {
          bg_gutter = "none",
        }
      }
    }
  },
  overrides = function(colors)
    -- Basically turn the background darker, correct border colors, remove unused italics
    -- and add some custom configurations
    local main_color = colors.palette.dragonRed
    return {
      CursorLineNr               = { bold = false },
      MatchParen                 = { bold = false },
      NormalFloat                = { bg = "none" },
      FloatTitle                 = { bg = "none" },
      Keyword                    = { fg = main_color },
      Normal                     = { bg = colors.palette.dragonBlack3 },
      Boolean                    = { bold = false, fg = colors.palette.dragonPink },
      CursorLine                 = { bg = colors.palette.dragonBlack4 },
      Constant                   = { fg = colors.palette.dragonPink },
      FloatBorder                = { bg = "none", fg = colors.palette.dragonBlack4 },
      WinSeparator               = { fg = colors.palette.dragonBlack4 },
      TelescopeBorder            = { fg = colors.palette.dragonBlack4, bg = colors.palette.dragonBlack3 },
      IblIndent                  = { fg = colors.palette.dragonBlack4 },
      NvimTreeIndentMarker       = { fg = colors.palette.dragonBlack6 },
      -- Type                       = { fg = colors.palette.dragonOrange },
      -- Type                       = { link = "Special" },
      -- Function                   = { fg = colors.palette.dragonAqua },
      ["@variable.builtin"]      = { italic = false },
      ["@label"]                 = { fg = colors.palette.dragonYellow },
      ["@variable.parameter"]    = { fg = colors.palette.dragonGray2 },
      ["@symbol"]                = { fg = colors.palette.dragonGray2 },
      ["@string.escape"]         = { bold = false },
      ["@keyword.operator"]      = { fg = main_color, bold = false },
      ["@keyword.return"]        = { fg = main_color, bold = false },
      ["@comment"]               = { fg = colors.palette.dragonBlack6, italic = false }
    }
  end
})

require("kanagawa").load("dragon")
local kolors = require("kanagawa.colors").setup()

-- Both tabline and statusline colors are only defined if a colorscheme is loaded,
-- in this case, kanagawa.
local tabline_colors = {
  icon         = { fg = kolors.palette.dragonOrange, bold = false },
  separator    = { fg = kolors.palette.roninYellow,  bold = true },
  active_tab   = { fg = kolors.palette.fujiWhite,    bold = true },
  inactive_tab = { fg = kolors.palette.fujiGray,     bold = false }
}

local custom_bg = kolors.palette.fujiGray
local custom_fg = kolors.palette.dragonBlack4

local statusline_colors = {
  normal      = { fg = kolors.palette.dragonOrange, bold = true },
  visual      = { fg = kolors.palette.dragonRed,    bold = true },
  insert      = { fg = custom_fg, bg = custom_bg,   bold = true },
  select      = { fg = kolors.palette.dragonViolet, bold = true },
  replace     = { fg = kolors.palette.dragonYellow, bold = true },
  quickfix    = { fg = kolors.palette.dragonOrange, bold = true },
  shell       = { fg = kolors.palette.dragonAqua,   bold = true },
  terminal    = { fg = kolors.palette.dragonBlue,   bold = true },
  confirm     = { fg = kolors.palette.dragonPink,   bold = true },
  file_name   = { fg = custom_fg,                   bg = custom_bg },
  line_filler = { fg = kolors.palette.fujiGray,     bg = custom_bg },
  versioning  = { bg = kolors.palette.dragonAqua,   fg = custom_fg },
  file_type   = { bg = kolors.palette.dragonRed,    fg = custom_fg },
  line_number = { bg = kolors.palette.dragonViolet, fg = custom_fg }
}

return {
  tabline_colors = tabline_colors,
  statusline_colors = statusline_colors
}
