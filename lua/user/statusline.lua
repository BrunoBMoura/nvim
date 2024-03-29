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
  for _, hl_string in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl_string, {link = default_group})
  end
end

-- Returns the default value of the tokens configuration entry.
function utils.get_non_config_tokens()
  return {
    separators = {'', ''}
  }
end

local M = {}

M._data = {}

M._data.highlights = {
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

M._data.modes = {
  ["n"]   = { text = "Normal",         color = utils.highlightfy(M._data.highlights.normal) },
  ["niI"] = { text = "Normal",         color = utils.highlightfy(M._data.highlights.normal) },
  ["niR"] = { text = "Normal",         color = utils.highlightfy(M._data.highlights.normal) },
  ["niV"] = { text = "Normal",         color = utils.highlightfy(M._data.highlights.normal) },
  ["no"]  = { text = "Normal",         color = utils.highlightfy(M._data.highlights.normal) },
  ["i"]   = { text = "Insert",         color = utils.highlightfy(M._data.highlights.insert) },
  ["ic"]  = { text = "Insert",         color = utils.highlightfy(M._data.highlights.insert) },
  ["ix"]  = { text = "Insert",         color = utils.highlightfy(M._data.highlights.insert) },
  ["t"]   = { text = "Terminal",       color = utils.highlightfy(M._data.highlights.terminal) },
  ["nt"]  = { text = "Terminal",       color = utils.highlightfy(M._data.highlights.terminal) },
  ["v"]   = { text = "Visual",         color = utils.highlightfy(M._data.highlights.visual) },
  ["V"]   = { text = "Visual_line",    color = utils.highlightfy(M._data.highlights.visual) },
  ["Vs"]  = { text = "Visual_line",    color = utils.highlightfy(M._data.highlights.visual) },
  [""]  = { text = "Visual_block",   color = utils.highlightfy(M._data.highlights.visual) },
  ["R"]   = { text = "Replace",        color = utils.highlightfy(M._data.highlights.replace) },
  ["Rv"]  = { text = "Visual_replace", color = utils.highlightfy(M._data.highlights.replace) },
  ["s"]   = { text = "Select",         color = utils.highlightfy(M._data.highlights.select) },
  ["S"]   = { text = "Select_line",    color = utils.highlightfy(M._data.highlights.select) },
  [""]  = { text = "Select_block",   color = utils.highlightfy(M._data.highlights.select) },
  ["c"]   = { text = "Command",        color = utils.highlightfy(M._data.highlights.shell) },
  ["cv"]  = { text = "Vim_ex",         color = utils.highlightfy(M._data.highlights.shell) },
  ["ce"]  = { text = "Ex",             color = utils.highlightfy(M._data.highlights.shell) },
  ["!"]   = { text = "Shell",          color = utils.highlightfy(M._data.highlights.shell) },
  ["r"]   = { text = "Prompt",         color = utils.highlightfy(M._data.highlights.confirm) },
  ["rm"]  = { text = "More",           color = utils.highlightfy(M._data.highlights.confirm) },
  ["r?"]  = { text = "Confirm",        color = utils.highlightfy(M._data.highlights.confirm) },
  ["qf"]  = { text = "Quickfix_list",  color = utils.highlightfy(M._data.highlights.quickfix) }
}

-- Access the current mode if the @override argument is nil.
function M.mode(override)
  local current_mode = vim.api.nvim_get_mode().mode
  local entry = override == nil and M._data.modes[current_mode] or M._data.modes[override]
  return string.format("%s%s", entry.color, utils.contour(entry.text, M._data.tokens.separators))
end

function M.file_path()
  local relative_path = function()
    return vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
  end

  local file_path = ""
  local icon = " "
  local file_name = vim.fn.expand("%") == "" and "No_file" or relative_path()

  if file_name == "No_file" then
    file_path = utils.contour(file_name, M._data.tokens.separators)
  else
    local ok, devicons = pcall(require, "nvim-web-devicons")
    if ok then
      local file_icon = devicons.get_icon(file_name)
      icon = file_icon ~= nil and "" .. file_icon or ""
    end
    file_path = utils.contour(string.format("%s %s ", file_name, icon), M._data.tokens.separators)
  end

  return string.format(
    "%s%s", utils.highlightfy(M._data.highlights.file_name), file_path
  )
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
    M._data.modes["c"].color, utils.contour(branch, M._data.tokens.separators),
    M._data.modes["v"].color, utils.contour(string.format("%s:%s", encoding, type), M._data.tokens.separators),
    M._data.modes["t"].color, utils.contour(line_info, M._data.tokens.separators)
  )
end

-- Simple wrapper to highlight the line filler on statusline.
function M.highlighted_line_filler()
  return string.format(
    "%s%s", utils.highlightfy(M._data.highlights.line_filler), "%="
  )
end

-- Checks wether the current opened view is a list.
function M.is_list()
  local file_type = string.format("%s", vim.bo.filetype)
  return file_type == "qf" and true or false
end

-- Called upon statusline updates..
function M.refresh()
  -- Return a string containing the line M._data information with all of its
  -- fields properly concatenated;
  local is_list = M.is_list()
  local mode = is_list and M.mode("qf") or M.mode()
  local path = is_list and "" or M.file_path()
  return string.format(
    "%s%s%s%s", mode, path, M.highlighted_line_filler(), M.file_metadata()
  )
end

-- Evaluates the @config parameters.
function M.eval_config(config)
  if config.tokens then
    M._data.tokens = config.tokens
  else
    M._data.tokens = utils.get_non_config_tokens()
  end

  if config.colors then
    utils.set_config_highlights(M._data.highlights, config.colors)
  else
    utils.set_non_config_highlights(M._data.highlights, "Normal")
  end
end

function M.setup(config)
  M.eval_config(config)
  -- Disable the creation of an automatic quickfixlist due to custom treatments.
  vim.g.qf_disable_statusline = true
  -- And finally, set the statusline to use the here defined procedures.
  vim.opt.statusline = "%!v:lua.require(\"user.statusline\").refresh()"
end

return M
