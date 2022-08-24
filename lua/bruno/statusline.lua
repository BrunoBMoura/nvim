local M = {}

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
  ["nt"]  = {text = "Terminal", color = "%#StatusLineTerminalColor#"}
}

function M.mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format("%s[%s]", modes[current_mode].color, modes[current_mode].text)
end

function M.file_path()
  local file_name = vim.fn.expand("%:f")
  if file_name == "" then
    file_name = "No_file"
  end
  return string.format("[%s %s ]", file_name, vim.fn.WebDevIconsGetFileTypeSymbol())
end

function M.file_metadata()
  local branch = vim.fn.FugitiveHead()
  if branch == "" then
    branch = "No_git"
  end
  local encoding = string.format("%s", vim.bo.fileencoding)
  local type = string.format("%s", vim.bo.filetype)
  local lineinfo = ""
  if vim.bo.filetype ~= "alpha" then
    lineinfo = "%l/%L:%c"
  end
  return string.format(
    "%s[%s]%s[%s:%s]%s[%s]",
    modes["c"].color, branch,
    modes["v"].color, encoding, type,
    modes["t"].color, lineinfo
  )
end

function M.refresh()
  return M.mode() ..
    "%#String#"   ..
    M.file_path() ..
    "%#LineNR#"   ..
    "%="          ..
    M.file_metadata()
end

function M.setup()
  vim.opt.statusline = "%!v:lua.require(\"bruno.statusline\").refresh()"
end

return M
