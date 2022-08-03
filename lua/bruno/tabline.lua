-- Shamelessly based on luatab https://github.com/alvarosevilla95/luatab.nvim

local M = {}

function M.title(bufnr)
  local file = vim.fn.bufname(bufnr)
  local buftype = vim.fn.getbufvar(bufnr, "&buftype")
  local filetype = vim.fn.getbufvar(bufnr, "&filetype")

  local title = ""
  if buftype == 'help' then
    title = "help:" .. vim.fn.fnamemodify(file, ":t:r")
  elseif buftype == "quickfix" then
    title = "quickfix"
  elseif filetype == "TelescopePrompt" then
    title = "Telescope"
  elseif filetype == "git" then
    title =  "Git"
  elseif filetype == "fugitive" then
    title = "Fugitive"
  elseif buftype == "terminal" then
    local _, mtch = string.match(file, "term:(.*):(%a+)")
    title = mtch ~= nil and mtch or vim.fn.fnamemodify(vim.env.SHELL, ":t")
  elseif file == "" then
    title = "No_name"
  else
    title =  vim.fn.pathshorten(vim.fn.fnamemodify(file, ":p:~:t"))
  end

  return string.format("%s %s", title, vim.fn.WebDevIconsGetFileTypeSymbol())
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
    M.window_count(index) .. M.title(bufnr) .. " " ..
    M.modified(bufnr) .. "%T"

  local hl = (is_selected and "%#TabLineSel#" or "%#TabLine#")
  return string.format("%s[%s]", hl, cell)
end

function M.tabline()
  local line = ""
  for i = 1, vim.fn.tabpagenr("$"), 1 do
      line = line .. M.cell(i)
  end
  line = line .. "%#TabLineFill#%="
  if vim.fn.tabpagenr("$") > 1 then
      line = line .. "%#TabLine#%999XX"
  end
  return line
end

function M.setup()
  vim.opt.tabline = "%!v:lua.require(\"bruno.tabline\").tabline()"
end

return M
