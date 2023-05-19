scheme = require("user.tropicalia")
scheme.setup()
local pallet = scheme.pallet()

require("user.tabline").setup({
  style =  "surrounded",
  tokens = {
    file_changed = '[+]',
    separators = {'|', ''},
    sub_separators = {'[', ']'}
  },
  colors = {
    icon         = {fg = pallet.orange, bg = pallet.night_sky, bold = false},
    separator    = {fg = pallet.orange, bg = pallet.night_sky, bold = true},
    active_tab   = {fg = pallet.white,  bg = pallet.night_sky, bold = true},
    inactive_tab = {fg = pallet.cloudy,  bg = pallet.night_sky, bold = false}
  }
})

require("user.statusline").setup({
  tokens = {
    separators = {'|', ''}
  },
  colors = {
    normal      = {fg = pallet.orange, bg = pallet.night_sky, bold = true},
    visual      = {fg = pallet.red,    bg = pallet.night_sky, bold = true},
    insert      = {fg = pallet.green,  bg = pallet.night_sky, bold = true},
    select      = {fg = pallet.cyan,   bg = pallet.night_sky, bold = true},
    replace     = {fg = pallet.yellow, bg = pallet.night_sky, bold = true},
    quickfix    = {fg = pallet.purple, bg = pallet.night_sky, bold = true},
    shell       = {fg = pallet.aqua,   bg = pallet.night_sky, bold = true},
    terminal    = {fg = pallet.blue,   bg = pallet.night_sky, bold = true},
    confirm     = {fg = pallet.pink,   bg = pallet.night_sky, bold = true},
    file_name   = {fg = pallet.cyan,   bg = pallet.night_sky, bold = true},
    line_filler = {fg = pallet.rainy,  bg = pallet.night_sky},
  }
})
