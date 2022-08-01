require("Comment").setup()
require("nvim-autopairs").setup()

require("nvim-treesitter.configs").setup {
  ensure_installed =  { "c", "cpp", "lua", "rust", "python", "ruby", "vim" },
  highlight = { enable = true, },
  indent = { enable = false, }
}

require("treesitter-context").setup {
  enable = true,
  max_lines = 0,
  trim_scope = "outer",
  patterns = {
    default = {
      "class",
      "function",
      "method",
      "module",
    },
  },
  zindex = 20,
  mode = 'cursor',
}

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
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
  },
  sources = { { name = "nvim_lsp" }, { name = "luasnip" } },
}

local lang_servers = {
  "bashls",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
}

local installer = require("nvim-lsp-installer")
for _, name in pairs(lang_servers) do
  local found, server = installer.get_server(name)
  if found and not server:is_installed() then
    print("Installing [" .. name .. "]")
    server:install()
  end
end

local setup_server = {
  sumneko_lua = function(opts)
    opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
  end,
}

require("nvim-lsp-installer").on_server_ready(function(server)
  local opts = {
    on_attach = function(_, bufnr)
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      local opts = { buffer = bufnr }
      vim.keymap.set("n", "<Leader>h", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<Leader>i", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
    end,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }
  if setup_server[server.name] then
    setup_server[server.name](opts)
  end
  server:setup(opts)
end)

