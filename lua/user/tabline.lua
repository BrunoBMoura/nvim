-- Shamelessly based on luatab https://github.com/alvarosevilla95/luatab.nvim
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
    file_changed = '+',
    separators = {'', ''},
    sub_separators = {'(', ')'}
  }
end

local M = {}

M._data = {}

M._data.tokens = {}

M._data.highlights = {
  icon         = "TabLineIconColor",
  separator    = "TabLineSeparator",
  active_tab   = "TabLineActiveTab",
  inactive_tab = "TabLineInactiveTab"
}

M._data.colors = {
  icon         = utils.highlightfy(M._data.highlights.icon),
  separator    = utils.highlightfy(M._data.highlights.separator),
  active_tab   = utils.highlightfy(M._data.highlights.active_tab),
  inactive_tab = utils.highlightfy(M._data.highlights.inactive_tab)
}

function M.title(bufnr, is_selected)
  -- Access current buffer information.
  local file = vim.fn.bufname(bufnr)
  local buftype = vim.fn.getbufvar(bufnr, "&buftype")
  local filetype = vim.fn.getbufvar(bufnr, "&filetype")

  -- Set both tables with possible buffer and file types for its
  -- respective return strings.
  local buftypes = {
    ['help']     = "Help:" .. vim.fn.fnamemodify(file, ":t:r"),
    ['quickfix'] = "Quickfix",
    ['terminal'] = vim.fn.fnamemodify(vim.env.SHELL, ":t")
  }
  local filetypes = {
    ["git"]             = "Git",
    ["fugitive"]        = "Fugitive",
    ["TelescopePrompt"] = "Telescope"
  }

  -- Then, lazyly check those tables if buffer variables are empty.
  local title = ""
  if file == "" and buftype == "" and filetype == "" then
    title = "No_name"
  else
    title = buftypes[buftype]
    if title == nil then
      title = filetypes[filetype]
      if title == nil then
        title = vim.fn.pathshorten(vim.fn.fnamemodify(file, ":p:~:t"))
      end
    end
  end

  -- Try to access the file icon if 'nvim-web-devicons' is installed.
  local icon = ""
  local ok, devicons = pcall(require, "nvim-web-devicons")
  if ok then
    local file_icon = devicons.get_icon(file, vim.fn.expand('#' .. bufnr .. ':e'))
    icon = file_icon ~= nil and file_icon or icon
  end

  -- And finally, ensure a proper highlighting if the current cell is selected.
  return is_selected
    and string.format("%s%s%s %s", M._data.colors.active_tab, title, M._data.colors.icon, icon)
    or string.format("%s%s %s", M._data.colors.inactive_tab, title, icon)
end

function M.modified(bufnr)
  return vim.fn.getbufvar(bufnr, "&modified") == 1 and string.format("%s ", M._data.tokens.file_changed) or ""
end

function M.window_count(index)
  local nwins = 0
  local ok, wins = pcall(vim.api.nvim_tabpage_list_wins, index)
  if ok then
    for _ in pairs(wins) do nwins = nwins + 1 end
  end
  return nwins > 1 and string.format("%s ", utils.contour(nwins, M._data.tokens.sub_separators)) or ""
  -- return nwins > 1 and "(" .. nwins .. ") " or ""
end

-- Builds a cell of the current index tabe.
function M.cell(index, is_selected)
  local buflist = vim.fn.tabpagebuflist(index)
  local winnr = vim.fn.tabpagewinnr(index)
  local bufnr = buflist[winnr]

  return string.format(
    "%s%s%s %s%s %s%s", "%", index, "T",
    M.window_count(index), M.title(bufnr, is_selected), M.modified(bufnr), "%T"
  )
end

-- Evaluates the configuration style.
function M.eval_style(index, cell, is_selected)
  local styles = {
    ["surrounded"] = function(index, cell, is_selected)
      if is_selected then
        local text = string.format("%s%s%s", M._data.colors.active_tab, cell, M._data.colors.separator)
        local cell_content = utils.contour(text, M._data.tokens.separators)
        return string.format("%s%s", M._data.colors.separator, cell_content)
      else
        cell_content = utils.contour(cell, M._data.tokens.separators)
        return string.format("%s%s", M._data.colors.inactive_tab, cell_content)
      end
    end
  }
  return styles[M._data.style](index, cell, is_selected)
end

-- Builds the tabline to be written to the window.
function M.tabline()
  -- Start building the tabline.
  local line = ""
  for index = 1, vim.fn.tabpagenr("$"), 1 do
    -- Check if the current cell is selected.
    local is_selected = vim.fn.tabpagenr() == index
    -- Then, access its content.
    local cell = M.cell(index , is_selected)
    -- Eval the current @style and add the cell to the tabline.
    cell = M.eval_style(index , cell, is_selected)
    line = line .. cell
  end
  -- Finally, return the built line plus the @inactive_tab color for the rest
  -- of the window.
  return line .. M._data.colors.inactive_tab
end

-- Evaluates the @config parameters.
function M.eval_config(config)
  -- Lazy configuration parameter.
  if config.invert then
    for idx, color in pairs(config.colors) do
      local temp = color.fg
      color.fg = color.bg
      color.bg = temp
    end
  end

  if config.tokens then
    M._data.tokens = config.tokens
  else
    M._data.tokens = utils.get_non_config_tokens()
  end

  if config.style then
    M._data.style = config.style
  else
    M._data.style = "surrounded"
  end

  if config.colors then
    utils.set_config_highlights(M._data.highlights, config.colors)
  else
    utils.set_non_config_highlights(M._data.highlights, "String")
  end
end

function M.setup(config)
  M.eval_config(config)
  vim.opt.tabline = "%!v:lua.require(\"user.tabline\").tabline()"
end

return M
