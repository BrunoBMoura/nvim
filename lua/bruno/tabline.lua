-- Shamelessly based on luatab https://github.com/alvarosevilla95/luatab.nvim
local M = {}

M.style_functions = {}

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
      separators = {'', ''}
  }
end

-- Local information used for the final configuration.
local info = {}

info.tokens = {}

info.highlights = {
  icon         = "TabLineIconColor",
  separator    = "TabLineSeparator",
  active_tab   = "TabLineActiveTab",
  inactive_tab = "TabLineInactiveTab"
}

info.colors = {
  icon         = utils.highlightfy(info.highlights.icon),
  separator    = utils.highlightfy(info.highlights.separator),
  active_tab   = utils.highlightfy(info.highlights.active_tab),
  inactive_tab = utils.highlightfy(info.highlights.inactive_tab)
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
  local has_devicons, devicons = pcall(require, "nvim-web-devicons")
  if has_devicons then
    local file_icon = devicons.get_icon(file, vim.fn.expand('#' .. bufnr .. ':e'))
    icon = file_icon ~= nil and file_icon or icon
  end

  -- And finally, ensure a proper highlighting if the current cell is selected.
  return is_selected
    and string.format("%s%s%s %s", info.colors.active_tab, title, info.colors.icon, icon)
    or string.format("%s%s %s", info.colors.inactive_tab, title, icon)
end

function M.modified(bufnr)
  return vim.fn.getbufvar(bufnr, "&modified") == 1 and string.format("%s ", info.tokens.file_changed) or ""
end

function M.window_count(index)
  local nwins = 0
  local success, wins = pcall(vim.api.nvim_tabpage_list_wins, index)
  if success then
    for _ in pairs(wins) do
      nwins = nwins + 1
    end
  end
  return nwins > 1 and "(" .. nwins .. ") " or ""
end

function M.cell(index, is_selected)
  local buflist = vim.fn.tabpagebuflist(index)
  local winnr = vim.fn.tabpagewinnr(index)
  local bufnr = buflist[winnr]

  return string.format(
    "%s%s%s %s%s %s%s", "%", index, "T",
    M.window_count(index), M.title(bufnr, is_selected), M.modified(bufnr), "%T"
  )
end

function M.eval_style(index, cell, is_selected)
  local styles = {
    ["surrounded"] = function(index, cell, is_selected)
      if is_selected then
        local text = string.format(
          "%s%s%s", info.colors.active_tab, cell, info.colors.separator
        )
        local cell_content = utils.contour(text, info.tokens.separators)
        return string.format("%s%s", info.colors.separator, cell_content)
      else
        cell_content = utils.contour(cell, info.tokens.separators)
        return string.format("%s%s", info.colors.inactive_tab, cell_content)
      end
    end
  }
  return styles[info.style](index, cell, is_selected)
end

function M.tabline()
  local line = ""
  for index = 1, vim.fn.tabpagenr("$"), 1 do
    local is_selected = vim.fn.tabpagenr() == index
    local cell = M.cell(index , is_selected)
    cell = M.eval_style(index , cell, is_selected)
    line = line .. cell
  end
  line = line .. "%#TabLineFill#%="
  if vim.fn.tabpagenr("$") > 1 then
      line = line .. info.colors.inactive_tab
  end
  return line
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

  if config.style then
    info.style = config.style
  else
    info.style = "surrounded"
  end

  if config.colors then
    utils.set_config_highlights(info.highlights, config.colors)
  else
    utils.set_non_config_highlights(info.highlights, "String")
  end

  vim.opt.tabline = "%!v:lua.require(\"bruno.tabline\").tabline()"
end

return M
