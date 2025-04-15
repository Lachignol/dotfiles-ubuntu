-- Importer les modules nécessaires
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local cmp = require("cmp")
local luasnip = require("luasnip")

-- Configurer Mason
mason.setup()

-- Configurer Mason-LSPConfig
mason_lspconfig.setup({
  ensure_installed = { "gopls", "lua_ls", "pyright", "clangd", "ts_ls" }, -- Liste des serveurs à installer automatiquement
})

-- Fonction on_attach : pour définir les keymaps spécifiques au LSP
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Affiche la documentation
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Aller à la définition
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- Voir les références
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Renommer une variable
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Actions de code (fixes, suggestions)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts) -- Affiche les diagnostics
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- Diagnostic précédent
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- Diagnostic suivant
end

-- Configurer nvim-cmp pour l'autocomplétion
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Utilise LuaSnip pour l'expansion des snippets
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Sélectionne l'élément suivant
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Sélectionne l'élément précédent
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),    -- Défile les docs vers le haut
    ['<C-f>'] = cmp.mapping.scroll_docs(4),     -- Défile les docs vers le bas
    ['<C-Space>'] = cmp.mapping.complete(),     -- Ouvre l'autocomplétion manuellement
    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Confirme la sélection
    ['<C-e>'] = cmp.mapping.abort(),            -- Annule l'autocomplétion
  },
  sources = {
    { name = 'nvim_lsp' },   -- Source LSP
    { name = 'buffer' },     -- Source pour le contenu du buffer
    { name = 'path' },       -- Source pour les chemins de fichiers
    { name = 'cmdline' },    -- Source pour la ligne de commande
  },
})

-- Afficher les diagnostics dans Neovim
vim.diagnostic.config({
  virtual_text = true, -- Affiche les diagnostics en ligne
  signs = true,        -- Affiche des signes dans la colonne de gauche
  underline = true,    -- Souligne le texte affecté par un diagnostic
})

-- Configuration des serveurs LSP

-- gopls (Go)
lspconfig.gopls.setup({
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,  -- Analyser les paramètres inutilisés
      },
      staticcheck = true,      -- Activer les vérifications statiques
      completeUnimported = true, -- Compléter les imports non utilisés
    },
  },
  root_dir = lspconfig.util.root_pattern("go.mod", ".git") or vim.fn.getcwd(), -- Détecter la racine du projet Go avec go.mod ou .git
})

-- lua_ls (Lua)
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- Éviter les erreurs pour les variables globales comme 'vim'
      },
    },
  },
})

-- pyright (Python)
lspconfig.pyright.setup({
  on_attach = on_attach,
})

-- clangd (C/C++)
lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index","--header-insertion=never" },
  on_attach = function(client, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Affiche la documentation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Aller à la définition
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- Aller à la déclaration
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- Voir les références

    vim.lsp.handlers["textDocument/publishDiagnostics"] =
      function(_, result, ctx, config)
        if not result or not result.diagnostics then return end

        local filtered_diagnostics = {}
        for _, diagnostic in ipairs(result.diagnostics) do
          if not diagnostic.message:find("Included header") then
            table.insert(filtered_diagnostics, diagnostic)
          end
        end

        result.diagnostics = filtered_diagnostics
        vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
      end
  end,
})

-- lspconfig.clangd.setup({
--   cmd = { "clangd", "--background-index","--header-insertion=never" },
--   on_attach = function(client, bufnr)
--     vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
--       if not result or not result.diagnostics then return end
--
--       local filtered_diagnostics = {}
--       for _, diagnostic in ipairs(result.diagnostics) do
--         if not diagnostic.message:find("Included header") then
--           table.insert(filtered_diagnostics, diagnostic)
--         end
--       end
--
--       result.diagnostics = filtered_diagnostics
--       vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
--     end
--   end,
-- })
--
-- lspconfig.clangd.setup({
  -- cmd = { "clangd", "--header-insertion=never" },
-- })

-- tsserver (TypeScript/JavaScript)
lspconfig.ts_ls.setup({
  on_attach = on_attach,
})

