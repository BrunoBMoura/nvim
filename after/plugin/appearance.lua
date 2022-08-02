vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.showtabline = 3
vim.opt.background = "dark"
vim.opt.list = true
vim.opt.fillchars = {stl = "―", fold = "۰", diff = "·"}
vim.opt.listchars = {tab = "»·", trail = "·", eol = "¬"}

local function iterate_and_hl(tbl)
  for group, opts in pairs(tbl) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

local napolitan = require("bruno.napolitan").setup()

-- StatusLine group colors
local mode_group_colors = {
  StatusLineNormalColor = {fg = napolitan.colors.orange, bg = napolitan.colors.none},
  StatusLineVisualColor = {fg = napolitan.colors.pink, bg = napolitan.colors.none},
  StatusLineInsertColor = {fg = napolitan.colors.green, bg = napolitan.colors.none},
  StatusLineSelectColor = {fg = napolitan.colors.cyan, bg = napolitan.colors.none},
  StatusLineReplaceColor = {fg = napolitan.colors.yellow, bg = napolitan.colors.none},
  StatusLineShellColor = {fg = napolitan.colors.aqua, bg = napolitan.colors.none},
  StatusLineTerminalColor = {fg = napolitan.colors.blue, bg = napolitan.colors.none},
}

local modes = {
  ["n"]  = {text = "Normal", color = "%#StatusLineNormalColor#"},
  ["no"] = {text = "Normal", color = "%#StatusLineNormalColor#"},
  ["v"]  = {text = "Visual", color = "%#StatusLineVisualColor#"},
  ["V"]  = {text = "Visual_line", color = "%#StatusLineVisualColor#"},
  [""] = {text = "Visual_block", color = "%#StatusLineVisualColor#"},
  ["s"]  = {text = "Select", color = "%#StatusLineSelectColor#"},
  ["S"]  = {text = "Select_line", color = "%#StatusLineSelectColor#"},
  [""] = {text = "Select_block", color = "%#StatusLineSelectColor#"},
  ["i"]  = {text = "Insert", color = "%#StatusLineInsertColor#"},
  ["ic"] = {text = "Insert", color = "%#StatusLineInsertColor#"},
  ["R"]  = {text = "Replace", color = "%#StatusLineReplaceColor#"},
  ["Rv"] = {text = "Visual_replace", color = "%#StatusLineReplaceColor#"},
  ["c"]  = {text = "Command", color = "%#StatusLineShellColor#"},
  ["cv"] = {text = "Vim_ex", color = "%#StatusLineShellColor#"},
  ["ce"] = {text = "Ex", color = "%#StatusLineShellColor#"},
  ["r"]  = {text = "Prompt", color = "%#StatusLineShellColor#"},
  ["rm"] = {text = "Moar", color = "%#StatusLineShellColor#"},
  ["r?"] = {text = "Confirm", color = "%#StatusLineShellColor#"},
  ["!"]  = {text = "Shell", color = "%#StatusLineShellColor#"},
  ["t"]  = {text = "Terminal", color = "%#StatusLineTerminalColor#"},
}

iterate_and_hl(napolitan.colorscheme)
iterate_and_hl(mode_group_colors)

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format("%s[%s]", modes[current_mode].color, modes[current_mode].text)
end

local function file_path()
  local path = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if path == "" or path == "." then
    return path
  end
  local fname = vim.fn.expand "%:f"
  if fname == "" then
    path = path .. "/" .. "None"
  end
  return "["..vim.fn.WebDevIconsGetFileTypeSymbol() .. " " .. path .. "/" .. fname .. "]"
end

local function file_metadata()
  local branch = vim.fn.FugitiveHead()
  if branch == "" then
    branch = "No_git"
  end
  local filetype = string.format("%s", vim.bo.filetype)
  local lineinfo = ""
  if vim.bo.filetype ~= "alpha" then
    lineinfo = "%l/%L:%c"
  end
  return string.format(
    "%s[%s]%s[%s]%s[%s]",
    modes["c"].color, branch,
    modes["v"].color, filetype,
    modes["t"].color, lineinfo
  )
end

Statusline = {}
Statusline.refresh = function()
  return table.concat({
    mode(),
    "%#String#",
    file_path(),
    "%#LineNR#",
    "%=",
    file_metadata(),
  }, "")
end

local autocmd = vim.api.nvim_create_autocmd

autocmd({"WinEnter,BufEnter,WinLeave,BufLeave"}, {
  command = "setlocal statusline=%!v:lua.Statusline.refresh()",
})

