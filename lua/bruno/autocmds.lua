local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local bruno_group = augroup("Bruno", {})

autocmd(
  "BufWritePre",
  {group = bruno_group, pattern = "*", command = "%s/\\s\\+$//e"}
)

local lang_meta_op = {
  c      = {format = "clang-format"},
  rust   = {format = "rustfmt", build = "cargo build", exec = "cargo run"},
  ruby   = {small_indent = true},
  lua    = {small_indent = true},
  python = {exec = "python"},
  text   = {cross_format = "ruby"}
}

for lang, data in pairs(lang_meta_op) do
  if data.format ~= nil then
    autocmd(
      "FileType",
      {command = "nnoremap <leader><leader>f :!" .. data.format .. " % <CR>", pattern = lang}
    )
  end
  if data.small_indent ~= nil then
    autocmd(
      "FileType",
      {command = "setlocal shiftwidth=2 tabstop=2", pattern = lang}
    )
  end
  if data.exec then
    autocmd(
      "FileType",
      {command = "nnoremap <leader><leader>e :vsplit <CR>:ter " .. data.exec .. " % <CR>", pattern = lang}
    )
  end
  --[[ if data.cross_format then
    autocmd(
      "BufEnter",
      {command = "setlocal syntax=" .. data.cross_format, pattern = lang}
    )
  end ]]
end
