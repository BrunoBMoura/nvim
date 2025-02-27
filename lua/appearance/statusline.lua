local helpers = {}

-- Concatenates all of the values in the @table into a single string.
function helpers.format_table(table)
  local str = ""
  for _, value in pairs(table) do
    str = str .. value
  end
  return str
end

-- Returns the @text surrounded by the separators in the @separators table.
function helpers.contour(text, separators)
  return separators[1] .. text .. separators[#separators]
end

-- Transforms a highlight name into a useful highlight string.
function helpers.highlightfy(str)
  return helpers.format_table({ '%', '#', str, '#' })
end

-- Defines all of the highlight groups to their configuration values.
function helpers.set_config_highlights(highlights, colors)
  for name, hl_string in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl_string, colors[name])
  end
end

-- Defines all of the highlight groups to link the @default group when
-- there is no configuration.
function helpers.set_non_config_highlights(highlights, default_group)
  for _, hl_string in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl_string, { link = default_group })
  end
end

-- Returns the default value of the tokens configuration entry.
function helpers.get_non_config_tokens()
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
  line_filler = "StatusLineFiller",
  versioning  = "StatusLineVersioning",
  file_type   = "StatusLineFileType",
  line_number = "StatusLineLineNumber"
}

M._data.modes = {
  ["n"]   = { text = "Normal",         color = helpers.highlightfy(M._data.highlights.normal) },
  ["niI"] = { text = "Normal",         color = helpers.highlightfy(M._data.highlights.normal) },
  ["niR"] = { text = "Normal",         color = helpers.highlightfy(M._data.highlights.normal) },
  ["niV"] = { text = "Normal",         color = helpers.highlightfy(M._data.highlights.normal) },
  ["no"]  = { text = "Normal",         color = helpers.highlightfy(M._data.highlights.normal) },
  ["i"]   = { text = "Insert",         color = helpers.highlightfy(M._data.highlights.insert) },
  ["ic"]  = { text = "Insert",         color = helpers.highlightfy(M._data.highlights.insert) },
  ["ix"]  = { text = "Insert",         color = helpers.highlightfy(M._data.highlights.insert) },
  ["t"]   = { text = "Terminal",       color = helpers.highlightfy(M._data.highlights.terminal) },
  ["nt"]  = { text = "Terminal",       color = helpers.highlightfy(M._data.highlights.terminal) },
  ["v"]   = { text = "Visual",         color = helpers.highlightfy(M._data.highlights.visual) },
  ["V"]   = { text = "Visual_line",    color = helpers.highlightfy(M._data.highlights.visual) },
  ["Vs"]  = { text = "Visual_line",    color = helpers.highlightfy(M._data.highlights.visual) },
  [""]  = { text = "Visual_block",   color = helpers.highlightfy(M._data.highlights.visual) },
  ["R"]   = { text = "Replace",        color = helpers.highlightfy(M._data.highlights.replace) },
  ["Rv"]  = { text = "Visual_replace", color = helpers.highlightfy(M._data.highlights.replace) },
  ["s"]   = { text = "Select",         color = helpers.highlightfy(M._data.highlights.select) },
  ["S"]   = { text = "Select_line",    color = helpers.highlightfy(M._data.highlights.select) },
  [""]  = { text = "Select_block",   color = helpers.highlightfy(M._data.highlights.select) },
  ["c"]   = { text = "Command",        color = helpers.highlightfy(M._data.highlights.shell) },
  ["cv"]  = { text = "Vim_ex",         color = helpers.highlightfy(M._data.highlights.shell) },
  ["ce"]  = { text = "Ex",             color = helpers.highlightfy(M._data.highlights.shell) },
  ["!"]   = { text = "Shell",          color = helpers.highlightfy(M._data.highlights.shell) },
  ["r"]   = { text = "Prompt",         color = helpers.highlightfy(M._data.highlights.confirm) },
  ["rm"]  = { text = "More",           color = helpers.highlightfy(M._data.highlights.confirm) },
  ["r?"]  = { text = "Confirm",        color = helpers.highlightfy(M._data.highlights.confirm) },
  ["qf"]  = { text = "Quickfix_list",  color = helpers.highlightfy(M._data.highlights.quickfix) },
  ["_g"]  = { text = "_None",          color = helpers.highlightfy(M._data.highlights.versioning) },
  ["_t"]  = { text = "_None",          color = helpers.highlightfy(M._data.highlights.file_type) },
  ["_l"]  = { text = "_None",          color = helpers.highlightfy(M._data.highlights.line_number) },
}

-- Access the current mode if the @override argument is nil.
function M.mode(override)
  local current_mode = vim.api.nvim_get_mode().mode
  local entry = override and M._data.modes[override] or M._data.modes[current_mode]
  return helpers.format_table({
    entry.color, helpers.contour(entry.text, M._data.tokens.separators)
  })
end

-- Access the current file path and its icon.
function M.file_path()
  -- Access raw file path.
  local file_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
  local icon = " "
  -- If the devicons plugin is installed, use it to get the file icon
  -- of the current file if it exists.
  if M._required.devicons then
    icon = M._required.devicons.get_icon(file_path) or " "
  end
  -- Finally, reformat the file path and return it.
  file_path = helpers.contour(
    helpers.format_table({ file_path, " ", icon, " " }),
    M._data.tokens.separators
  )

  return helpers.format_table({
    helpers.highlightfy(M._data.highlights.file_name), file_path
  })
end

-- Access the current file metadata; encoding and type.
function M.file_metadata()
  local encoding = vim.bo.fileencoding
  local type = vim.bo.filetype
  local line_info = vim.bo.filetype ~= "alpha" and "%l/%L:%c" or ""

  return helpers.format_table({
    M._data.modes["_t"].color, helpers.contour(helpers.format_table({ encoding, ":", type }), M._data.tokens.separators),
    M._data.modes["_l"].color, helpers.contour(line_info, M._data.tokens.separators)
  })
end

-- Access the current git branch.
function M.git_info()
  local icon = " "
  local branch = ""
  if vim.fn.loaded_fugitive then
    branch = vim.fn.FugitiveHead() == "" and "No_git" or vim.fn.FugitiveHead()
  end

  branch = helpers.format_table({ branch, " ", icon})

  -- Access the current file changes; stored in a buffer-local variable.
  local changes = vim.b.git_changes or ""
  if changes ~= "" then
    changes = helpers.contour(changes, { '(', ') ' })
  end

  return helpers.format_table({
    M._data.modes["_g"].color, helpers.contour(branch, M._data.tokens.separators),
    changes
  })
end

-- Simple wrapper to highlight the line filler on statusline.
function M.highlighted_line_filler()
  return helpers.format_table({
    helpers.highlightfy(M._data.highlights.line_filler), "%="
  })
end

-- Checks wether the current opened view is a list.
function M.is_list()
  return vim.bo.filetype == "qf" and true or false
end

-- Returns the number of elements in the quickfix list.
function M.list_info()
  local num_elements = vim.fn.len(vim.fn.getqflist())
  local message = helpers.format_table({ "with (", num_elements, ") elements" })
  return helpers.format_table({
    helpers.highlightfy(M._data.highlights.file_name), message
  })
end

-- Called upon statusline updates.
function M.refresh()
  -- Return a string containing the line M._data information with all of its
  -- fields properly concatenated.
  local is_list = M.is_list()
  local mode = is_list and M.mode("qf") or M.mode()
  local path = is_list and M.list_info() or M.file_path()

  return helpers.format_table({
    mode,
    M.highlighted_line_filler(),
    path,
    M.highlighted_line_filler(),
    M.git_info(),
    M.file_metadata()
  })
end

-- Evaluates the @config parameters.
function M.eval_config(config)
  if config.tokens then
    M._data.tokens = config.tokens
  else
    M._data.tokens = helpers.get_non_config_tokens()
  end

  if config.colors then
    helpers.set_config_highlights(M._data.highlights, config.colors)
  else
    helpers.set_non_config_highlights(M._data.highlights, "Normal")
  end

  M._required = {}

  local ok, devicons = pcall(require, "nvim-web-devicons")
  if ok then
    M._required.devicons = devicons
  end
end

function M.metadata_setup()
  local function update_git_changes()
    local buf = vim.api.nvim_get_current_buf()
    local filepath = vim.fn.expand('%:p') -- Get full path of the current file

    if vim.fn.empty(filepath) == 1 then
      vim.b.git_changes = "" -- Clear git info if no file
      return
    end

    -- Run git diff to get additions and deletions
    local result = vim.fn.systemlist("git diff --numstat -- " .. vim.fn.shellescape(filepath))

    if #result == 0 then
      vim.b.git_changes = "" -- No changes
      return
    end

    -- Extract additions and deletions
    local additions, deletions = result[1]:match("(%d+)%s+(%d+)")
    local formated = ""

    if additions then
      formated = formated .. "+" .. additions
    end

    if deletions then
      formated = formated .. " ~" .. deletions
    end

    -- Store in buffer-local variable
    vim.b.git_changes = formated
  end

  vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "TextChanged"}, {
    pattern = "*",
    callback = update_git_changes,
  })
end

-- Sets up the statusline with the given @config, containing the tokens and colors.
function M.setup(config)

  M.metadata_setup()

  M.eval_config(config)
  -- Disable the creation of an automatic quickfixlist due to custom treatments.
  vim.g.qf_disable_statusline = true

  -- And finally, set the statusline to use the here defined procedures.
  vim.opt.statusline = "%!v:lua.require(\"appearance.statusline\").refresh()"
end

return M
