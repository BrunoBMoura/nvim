local M = {}

local utils = {}

-- Returns the @text surrounded by the separators in the @separators table.
function utils.contour(text, separators)
  return separators[1] .. text .. separators[#separators]
end

-- Transforms a highlight name into a useful highlight string.
function utils.highlightfy(str)
  return string.format("%s%s%s%s", '%', '#', str, '#')
end

-- Defines all of the highlight groups to their configuration values.
function utils.set_config_highlights(highlights, colors)
  for name, hl_string in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl_string, colors[name])
  end
end

-- Defines all of the highlight groups to link the @default group when
-- there is no configuration.
function utils.set_non_config_highlights(highlights, default_group)
  for name, hl_string in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl_string, {link = default_group})
  end
end

-- Returns the default value of the tokens configuration entry.
function utils.get_non_config_tokens()
  return {
      separators = {'', ''}
  }
end

-- Local information used for the final configuration.
local info = {}

info.highlights = {
  normal      = "StatusLineNormalColor",
  visual      = "StatusLineVisualColor",
  insert      = "StatusLineInsertColor",
  select      = "StatusLineSelectColor",
  replace     = "StatusLineReplaceColor",
  quickfix    = "StatusLineQfColor",
  shell       = "StatusLineShellColor",
  terminal    = "StatusLineTerminalColor",
  confirm     = "StatusLineConfirmColor",
  file_name   = "StatusLineFileName",
  line_filler = "StatusLineFiller"
}

info.modes = {
  ["n"]   = {text = "Normal",         color = utils.highlightfy(info.highlights.normal)},
  ["niI"] = {text = "Normal",         color = utils.highlightfy(info.highlights.normal)},
  ["niR"] = {text = "Normal",         color = utils.highlightfy(info.highlights.normal)},
  ["niV"] = {text = "Normal",         color = utils.highlightfy(info.highlights.normal)},
  ["no"]  = {text = "Normal",         color = utils.highlightfy(info.highlights.normal)},
  ["i"]   = {text = "Insert",         color = utils.highlightfy(info.highlights.insert)},
  ["ic"]  = {text = "Insert",         color = utils.highlightfy(info.highlights.insert)},
  ["ix"]  = {text = "Insert",         color = utils.highlightfy(info.highlights.insert)},
  ["t"]   = {text = "Terminal",       color = utils.highlightfy(info.highlights.terminal)},
  ["nt"]  = {text = "Terminal",       color = utils.highlightfy(info.highlights.terminal)},
  ["v"]   = {text = "Visual",         color = utils.highlightfy(info.highlights.visual)},
  ["V"]   = {text = "Visual_line",    color = utils.highlightfy(info.highlights.visual)},
  ["Vs"]  = {text = "Visual_line",    color = utils.highlightfy(info.highlights.visual)},
  [""]  = {text = "Visual_block",   color = utils.highlightfy(info.highlights.visual)},
  ["R"]   = {text = "Replace",        color = utils.highlightfy(info.highlights.replace)},
  ["Rv"]  = {text = "Visual_replace", color = utils.highlightfy(info.highlights.replace)},
  ["s"]   = {text = "Select",         color = utils.highlightfy(info.highlights.select)},
  ["S"]   = {text = "Select_line",    color = utils.highlightfy(info.highlights.select)},
  [""]  = {text = "Select_block",   color = utils.highlightfy(info.highlights.select)},
  ["c"]   = {text = "Command",        color = utils.highlightfy(info.highlights.shell)},
  ["cv"]  = {text = "Vim_ex",         color = utils.highlightfy(info.highlights.shell)},
  ["ce"]  = {text = "Ex",             color = utils.highlightfy(info.highlights.shell)},
  ["!"]   = {text = "Shell",          color = utils.highlightfy(info.highlights.shell)},
  ["r"]   = {text = "Prompt",         color = utils.highlightfy(info.highlights.confirm)},
  ["rm"]  = {text = "More",           color = utils.highlightfy(info.highlights.confirm)},
  ["r?"]  = {text = "Confirm",        color = utils.highlightfy(info.highlights.confirm)},
  ["qf"]  = {text = "Quickfix_list",  color = utils.highlightfy(info.highlights.quickfix)}
}

function M.mode()
  local current_mode = vim.api.nvim_get_mode().mode
  local entry = info.modes[current_mode]
  return string.format("%s%s", entry.color, utils.contour(entry.text, info.tokens.separators))
end

function M.file_path()
  local file_path = ""
  local icon = " "
  local file_name = vim.fn.expand("%") == "" and "No_file" or vim.fn.expand("%:T")

  if file_name == "No_file" then
    file_path = utils.contour(file_name, info.tokens.separators)
  else
    local has_devicons, devicons = pcall(require, "nvim-web-devicons")
    if has_devicons then
      local file_icon = devicons.get_icon(file_name)
      icon = file_icon ~= nil and "" .. file_icon or ""
    end
    file_path = utils.contour(string.format("%s %s ", file_name, icon), info.tokens.separators)
  end

  return file_path
end

function M.file_metadata()
  local branch = ""
  if vim.fn.loaded_fugitive then
    branch = vim.fn.FugitiveHead() == "" and "No_git" or vim.fn.FugitiveHead()
  end
  local encoding = string.format("%s", vim.bo.fileencoding)
  local type = string.format("%s", vim.bo.filetype)
  local line_info = vim.bo.filetype ~= "alpha" and "%l/%L:%c" or ""
  return string.format(
    "%s%s%s%s%s%s",
    info.modes["c"].color, utils.contour(branch, info.tokens.separators),
    info.modes["v"].color, utils.contour(string.format("%s:%s", encoding, type), info.tokens.separators),
    info.modes["t"].color, utils.contour(line_info, info.tokens.separators)
  )
end

function M.refresh()
  -- Return a string containing the line information with all of its
  -- fields properly concatenated.
  return
    -- Vim mode.
    M.mode() ..
    -- Current file path.
    utils.highlightfy(info.highlights.file_name) ..
    M.file_path() ..
    -- Filler until right side.
    utils.highlightfy(info.highlights.line_filler) ..
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

  if config.tokens then
    info.tokens = config.tokens
  else
    info.tokens = utils.get_non_config_tokens()
  end

  if config.colors then
    utils.set_config_highlights(info.highlights, config.colors)
  else
    utils.set_non_config_highlights(info.highlights, "Normal")
  end

  -- Finally, set the opt.statusline variable.
  vim.opt.statusline = "%!v:lua.require(\"bruno.statusline\").refresh()"
end

return M
