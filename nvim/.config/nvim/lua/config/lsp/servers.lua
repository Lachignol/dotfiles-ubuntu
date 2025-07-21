local lspconfig = require("lspconfig")
local on_attach = require("config.lsp.on_attach").on_attach
local handlers = require("config.lsp.handlers")

-- Go
lspconfig.gopls.setup({
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
      completeUnimported = true,
    },
  },
  root_dir = lspconfig.util.root_pattern("go.mod", ".git") or vim.fn.getcwd(),
})

-- Lua
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Python
lspconfig.pyright.setup({
  on_attach = on_attach,
})

-- TypeScript
lspconfig.ts_ls.setup({
  on_attach = on_attach,
})

-- C/C++
lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index", "--header-insertion=never" },
  on_attach = handlers.clangd_handler,
})

