local tabline_colors = nil
local statusline_colors = nil

-- local colorscheme = require("user.custom_schemes.kanagawa")
local colorscheme = require("user.custom_schemes.material")
tabline_colors = colorscheme.tabline_colors
statusline_colors = colorscheme.statusline_colors

require("user.tabline").setup({
  style =  "surrounded",
  tokens = {
    file_changed = '[+]',
    separators = { '|', '' },
    sub_separators = { '[', ']' }
  },
  colors = tabline_colors
})

require("user.statusline").setup({
  tokens = {
    separators = { '|', '' }
  },
  colors = statusline_colors
})
