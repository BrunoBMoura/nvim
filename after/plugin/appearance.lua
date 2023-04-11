require("bruno.tabline").setup()
require("bruno.tropicalia").setup()

local pallet = require("bruno.tropicalia").pallet()
require("bruno.statusline").setup({
  invert = false,
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
