local M = {}
local modes = {
  ["n"]   = {text = "Normal",         color = "%#StatusLineNormalColor#"},
  ["niI"] = {text = "Normal",         color = "%#StatusLineNormalColor#"},
  ["niR"] = {text = "Normal",         color = "%#StatusLineNormalColor#"},
  ["niV"] = {text = "Normal",         color = "%#StatusLineNormalColor#"},
  ["no"]  = {text = "Normal",         color = "%#StatusLineNormalColor#"},
  ["i"]   = {text = "Insert",         color = "%#StatusLineInsertColor#"},
  ["ic"]  = {text = "Insert",         color = "%#StatusLineInsertColor#"},
  ["ix"]  = {text = "Insert",         color = "%#StatusLineInsertColor#"},
  ["t"]   = {text = "Terminal",       color = "%#StatusLineTerminalColor#"},
  ["nt"]  = {text = "Terminal",       color = "%#StatusLineTerminalColor#"},
  ["v"]   = {text = "Visual",         color = "%#StatusLineVisualColor#"},
  ["V"]   = {text = "Visual_line",    color = "%#StatusLineVisualColor#"},
  ["Vs"]  = {text = "Visual_line",    color = "%#StatusLineVisualColor#"},
  [""]  = {text = "Visual_block",   color = "%#StatusLineVisualColor#"},
  ["R"]   = {text = "Replace",        color = "%#StatusLineReplaceColor#"},
  ["Rv"]  = {text = "Visual_replace", color = "%#StatusLineReplaceColor#"},
  ["s"]   = {text = "Select",         color = "%#StatusLineSelectColor#"},
  ["S"]   = {text = "Select_line",    color = "%#StatusLineSelectColor#"},
  [""]  = {text = "Select_block",   color = "%#StatusLineSelectColor#"},
  ["c"]   = {text = "Command",        color = "%#StatusLineShellColor#"},
  ["cv"]  = {text = "Vim_ex",         color = "%#StatusLineShellColor#"},
  ["ce"]  = {text = "Ex",             color = "%#StatusLineShellColor#"},
  ["r"]   = {text = "Prompt",         color = "%#StatusLineConfirmColor#"},
  ["rm"]  = {text = "More",           color = "%#StatusLineConfirmColor#"},
  ["r?"]  = {text = "Confirm",        color = "%#StatusLineConfirmColor#"},
  ["!"]   = {text = "Shell",          color = "%#StatusLineShellColor#"},
  ["qf"]  = {text = "Quickfix_list",  color = "%#StatusLineQfColor#"}
}

function M.mode()
  local current_mode = vim.api.nvim_get_mode().mode
  local entry = modes[current_mode]
  return string.format("%s[%s]", entry.color, entry.text)
end

function M.file_path()
  local file_path = ""
  local icon = " "
  local file_name = vim.fn.expand("%") == "" and "No_file" or vim.fn.expand("%:T")

  if file_name == "No_file" then
    file_path = string.format("[%s]", file_name)
  else
    local has_devicons, devicons = pcall(require, "nvim-web-devicons")
    if has_devicons then
      local file_icon = devicons.get_icon(file_name)
      icon = file_icon ~= nil and "" .. file_icon or ""
    end
    file_path = string.format("[%s %s ]", file_name, icon)
  end

  return file_path
end

--[[ function M.env_info()
  return string.format("%s[%s]", modes["qf"].color, vim.fn.bufnr())
end
 ]]

function M.file_metadata()
  local branch = ""
  if vim.fn.loaded_fugitive then
    branch = vim.fn.FugitiveHead() == "" and "No_git" or vim.fn.FugitiveHead()
  end
  local encoding = string.format("%s", vim.bo.fileencoding)
  local type = string.format("%s", vim.bo.filetype)
  local line_info = vim.bo.filetype ~= "alpha" and "%l/%L:%c" or ""
  return string.format(
    "%s[%s]%s[%s:%s]%s[%s]",
    modes["c"].color, branch,
    modes["v"].color, encoding, type,
    modes["t"].color, line_info
  )
end

function M.refresh()
  -- Return a string containing the line information with all of its
  -- fields properly concatenated.
  return
    -- Vim mode.
    M.mode() ..
    -- Current file path.
    "%#StatusLineFileName#" ..
    M.file_path() ..
    -- Filler until right side.
    "%#StatusLineFiller#" ..
    "%=" ..
    -- Current file metadata (git branch, file type and line numbers).
    M.file_metadata()
end

function M.setup(config)
  -- Invert foreground and background colors.
  if config.invert then
    for idx, color in pairs(config.colors) do
      local temp = color.fg
      color.fg = color.bg
      color.bg = temp
    end
  end

  -- Set the custom highlight groups to the config arguments.
  vim.api.nvim_set_hl(0, "StatusLineNormalColor",  config.colors.normal)
  vim.api.nvim_set_hl(0, "StatusLineVisualColor",  config.colors.visual)
  vim.api.nvim_set_hl(0, "StatusLineInsertColor",  config.colors.insert)
  vim.api.nvim_set_hl(0, "StatusLineSelectColor",  config.colors.select)
  vim.api.nvim_set_hl(0, "StatusLineReplaceColor", config.colors.replace)
  vim.api.nvim_set_hl(0, "StatusLineQfColor",      config.colors.quickfix)
  vim.api.nvim_set_hl(0, "StatusLineShellColor",   config.colors.shell)
  vim.api.nvim_set_hl(0, "StatusLineTerminalColor", config.colors.terminal)
  vim.api.nvim_set_hl(0, "StatusLineConfirmColor", config.colors.confirm)
  vim.api.nvim_set_hl(0, "StatusLineFileName",     config.colors.file_name)
  vim.api.nvim_set_hl(0, "StatusLineFiller",       config.colors.line_filler)

  -- Finally, set the opt.statusline variable.
  vim.opt.statusline = "%!v:lua.require(\"bruno.statusline\").refresh()"
end

return M
