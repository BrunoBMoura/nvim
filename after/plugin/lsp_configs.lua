local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Enter>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    {name = "nvim_lsp"},
    {name = "luasnip"}
  },
  window = {
    completion = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:Normal,CursorLine:PmenuSel,Search:None,CmpItemKind:Type,CmpItemAbbrMatch:Identifier",
      minwidth = 60,
    }),
  },
  completion = {
    autocomplete = false
  },
  experimental = {
    ghost_text = false
  }
})

local lang_servers = {
  "bashls",
  "pyright",
  "rust_analyzer",
  -- "sumneko_lua",
  -- "lua_ls",
}

for _, name in pairs(lang_servers) do
  local found, server = require("nvim-lsp-installer").get_server(name)
  if found and not server:is_installed() then
    print("Installing [" .. name .. "]")
    server:install()
  end
end

local setup_server = {
  sumneko_lua = function(opts)
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = {
            "vim", "use"
          }
        }
      }
    }
  end,
}

require("nvim-lsp-installer").on_server_ready(function(server)
  local opts = {
    on_attach = function(_, bufnr)
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      local opts = {buffer = bufnr}
      vim.keymap.set("n", "<Leader>h", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<Leader>i", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }
  if setup_server[server.name] then
    setup_server[server.name](opts)
  end

  server:setup(opts)
end)
