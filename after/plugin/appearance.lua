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
    -- Basically turn the background darker, docrrect border colors and remove unnused italics
    return {
      Normal                = { bg = colors.palette.dragonBlack2 },
      NormalFloat           = { bg = "none" },
      FloatTitle            = { bg = "none" },
      FloatBorder           = { bg = "none", fg = colors.palette.dragonBlack4 },
      WinSeparator          = { fg = colors.palette.dragonBlack4 },
      Boolean               = { fg = colors.palette.dragonOrange, italic = false , bold = false },
      ["@keyword"]          = { fg = colors.palette.dragonOrange, italic = false },
      ["@keyword.operator"] = { fg = colors.palette.dragonRed, bold = false },
      ["@constant.builtin"] = { fg = colors.palette.dragonYellow, italic = false },
      IndentBlanklineChar   = { fg = colors.palette.dragonBlack4 },
      TelescopeBorder       = { fg = colors.palette.dragonBlack4, bg = colors.palette.dragonBlack2 },
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
    separator    = { fg = kolors.palette.dragonOrange, bold = true },
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

