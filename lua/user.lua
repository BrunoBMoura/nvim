 -- User configuration data.
USER = {
  leader_key = " ",
  lsp = {
    servers = {
      "bashls",
      "pyright",
      "rust_analyzer",
      "lua_ls",
      -- "clangd"
    },
    settings = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "awesome", "client" }
            }
          }
        }
      }
    }
  },
  ident_marker = function(indent_size)
    local char = "│"
    local spaces = string.rep(" ", indent_size - 1)
    return char .. spaces
  end
}
