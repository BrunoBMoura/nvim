local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  -- Default behavioural usage and bindings whenever selecting cmp options.
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Enter>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = {
    {name = "nvim_lsp"},
    {name = "luasnip"}
  },
  -- Window configuration, purealy display related.
  window = {
    completion = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:Normal,CursorLine:PmenuSel,Search:None,CmpItemKind:Type,CmpItemAbbrMatch:Identifier",
      minwidth = 60,
    }),
  },
  experimental = {
    ghost_text = false
  }
})

-- Set the default border width as well as its type
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  opts.max_width = opts.max_width or 100
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- Configure mason to download the defined language servers.
mason.setup({
  ui = { border = "rounded" },
  max_concurrent_installers = 4
})

-- Define the desired servers to be installed.
local servers = {
  "bashls",
  "pyright",
  "rust_analyzer",
  "lua_ls",
  -- "clangd"
}

local mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp then
  return
end

mason_lspconfig.setup({
  ensure_installed = servers
})

-- Custom definition of on_attach function
local custom_on_attach = function(_, _)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
  vim.keymap.set("n", "gr", vim.lsp.buf.rename, {})
end

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- Servers individual configuration; if there are any options besides
-- the default ones it should be extended as part of the @opts table.
for _, server in pairs(servers) do
  local opts = {
    on_attach = custom_on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities()
  }

  if server == "lua_ls" then
    local lua_ls_opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "use", "awesome", "client" }
          }
        }
      }
    }
    opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
  end

  lspconfig[server].setup(opts)
end

local copilot_status, copilot = pcall(require, "copilot")
if not copilot_status then
  return
end

copilot.setup()
