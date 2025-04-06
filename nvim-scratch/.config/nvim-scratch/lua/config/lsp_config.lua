local lsp_zero = require("lsp-zero").preset({})

-- Installer automatiquement les serveurs LSP nécessaires
lsp_zero.ensure_installed({
	"lua_ls", -- Serveur pour Lua
	"pyright", -- Serveur pour Python
	"tsserver", -- Serveur pour TypeScript/JavaScript
	"clangd", -- Serveur pour C/C++
	"gopls", -- Serveur pour Go
})

-- Configuration des keymaps LSP
lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
end)

-- Setup Mason et Mason-LSPConfig
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "gopls" },
	handlers = {
		lsp_zero.default_setup,
	},
})

-- Configuration spécifique pour gopls (Go)
require("lspconfig").gopls.setup({
	settings = {
		gopls = {
			gofumpt = true, -- Utiliser gofumpt pour le formatage
			staticcheck = true, -- Activer staticcheck
		},
	},
})

-- Configuration spécifique pour clangd (C/C++)
require("lspconfig").clangd.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false -- Désactive le formateur
	end,
})

lsp_zero.setup()
