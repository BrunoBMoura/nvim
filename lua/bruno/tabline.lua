-- Shamelessly based on luatab https://github.com/alvarosevilla95/luatab.nvim

local M = {}

local info = {
  colors = {
    icon         = "%#TabLineIconColor#",
    separator    = "%#TabLineSeparator#",
    active_tab   = "%#TabLineActiveTab#",
    inactive_tab = "%#TabLineInactiveTab#"
  }
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
    -- and string.format("%s %s%s%s", title, "%#String#", icon, "%#TabLineSel#")
    -- and string.format("%s %s%s%s", title, info.colors.title, icon, "%#TabLineSel#")
    and string.format("%s %s%s %s", info.colors.active_tab, title, info.colors.icon, icon)
    or string.format("%s%s %s", info.colors.inactive_tab, title, icon)
end

function M.modified(bufnr)
  return vim.fn.getbufvar(bufnr, "&modified") == 1 and "[+] " or ""
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

function M.cell(index)
  local is_selected = vim.fn.tabpagenr() == index
  local buflist = vim.fn.tabpagebuflist(index)
  local winnr = vim.fn.tabpagewinnr(index)
  local bufnr = buflist[winnr]

  -- Concatenate all the data
  local cell =  "%" .. index .. "T" .. " " ..
    M.window_count(index) .. M.title(bufnr, is_selected) .. " " ..
    M.modified(bufnr) .. "%T"

  if is_selected then
    return string.format(
      "%s[%s%s%s]",
      info.colors.separator,
      info.colors.active_tab,
      cell,
      info.colors.separator
    )
  else
    return string.format("%s[%s]", info.colors.inactive_tab, cell)
  end
end

function M.tabline()
  local line = ""
  for i = 1, vim.fn.tabpagenr("$"), 1 do
      line = line .. M.cell(i)
  end
  line = line .. "%#TabLineFill#%="
  if vim.fn.tabpagenr("$") > 1 then
      -- line = line .. "%#TabLine#%999XX"
      line = line .. info.colors.inactive_tab
  end
  return line
end

function M.setup(config)

  if config.invert then
    for idx, color in pairs(config.colors) do
      local temp = color.fg
      color.fg = color.bg
      color.bg = temp
    end
  end

  if config.colors then
    vim.api.nvim_set_hl(0, "TabLineIconColor",   config.colors.icon)
    vim.api.nvim_set_hl(0, "TabLineSeparator",   config.colors.separator)
    vim.api.nvim_set_hl(0, "TabLineActiveTab",   config.colors.active_tab)
    vim.api.nvim_set_hl(0, "TabLineInactiveTab", config.colors.inactive_tab)
  end

  vim.opt.tabline = "%!v:lua.require(\"bruno.tabline\").tabline()"
end

return M
