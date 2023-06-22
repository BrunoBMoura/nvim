require("kanagawa").setup({
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
    return {
      Normal                     = { bg = colors.palette.dragonBlack3 },
      Boolean                    = { bold = false },
      CursorLineNr               = { bold = false },
      MatchParen                 = { bold = false },
      NormalFloat                = { bg = "none" },
      FloatTitle                 = { bg = "none" },
      CursorLine                 = { bg = colors.palette.dragonBlack4 },
      FloatBorder                = { bg = "none", fg = colors.palette.dragonBlack4 },
      WinSeparator               = { fg = colors.palette.dragonBlack4 },
      IndentBlanklineChar        = { fg = colors.palette.dragonBlack4 },
      TelescopeBorder            = { fg = colors.palette.dragonBlack4, bg = colors.palette.dragonBlack3 },
      ["@string.escape"]         = { bold = false },
      ["@keyword.operator"]      = { fg = colors.palette.dragonRed, bold = false },
      ["@constant.builtin"]      = { fg = colors.palette.dragonOrange, italic = false },
      ["@label"]                 = { fg = colors.palette.dragonGray, italic = false },
      ["@comment"]               = { fg = colors.palette.dragonBlack6, italic = false }
    }
  end
})

require("kanagawa").load("dragon")

local kolors = require("kanagawa.colors").setup()

require("user.tabline").setup({
  style =  "surrounded",
  tokens = {
    file_changed = '[+]',
    separators = { '|', '' },
    sub_separators = { '[', ']' }
  },
  colors = {
    icon         = { fg = kolors.palette.dragonOrange, bold = false },
    separator    = { fg = kolors.palette.roninYellow,  bold = true },
    active_tab   = { fg = kolors.palette.fujiWhite,    bold = true },
    inactive_tab = { fg = kolors.palette.fujiGray,     bold = false }
  }
})

require("user.statusline").setup({
  tokens = {
    separators = { '|', '' }
  },
  colors = {
    normal      = { fg = kolors.palette.dragonOrange, bold = true },
    visual      = { fg = kolors.palette.dragonRed,    bold = true },
    insert      = { fg = kolors.palette.dragonGreen,  bold = true },
    select      = { fg = kolors.palette.dragonViolet, bold = true },
    replace     = { fg = kolors.palette.dragonYellow, bold = true },
    quickfix    = { fg = kolors.palette.dragonAsh,    bold = true },
    shell       = { fg = kolors.palette.dragonAqua,   bold = true },
    terminal    = { fg = kolors.palette.dragonBlue,   bold = true },
    confirm     = { fg = kolors.palette.dragonPink,   bold = true },
    file_name   = { fg = kolors.palette.dragonAsh,    bold = true },
    line_filler = { fg = kolors.palette.dragonBlack4 },
  }
})
