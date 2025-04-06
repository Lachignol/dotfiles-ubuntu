-- Configuration spécifique pour clangd (C/C++)
require("lspconfig").clangd.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false -- Désactive le formateur
  end,
})
-- local lspconfig = require("lspconfig")
--
-- -- Configuration minimale pour clangd avec uniquement la navigation vers la définition
-- lspconfig.clangd.setup({
--   cmd = {
--     "clangd",
--     "--header-insertion=never", -- Ignorez les erreurs d'insertion d'en-tête
--     "--enable-config", -- Permet l'utilisation de .clangd pour la configuration
--   },
--   on_attach = function(client)
--     -- Désactiver toutes les fonctionnalités sauf la navigation vers la définition
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormattingProvider = false
--     client.server_capabilities.diagnosticsProvider = false
--     client.server_capabilities.completionProvider = {
--       resolveProvider = false,
--       triggerCharacters = {},
--     }
--     client.server_capabilities.signatureHelpProvider = false
--     client.server_capabilities.codeActionProvider = false
--     client.server_capabilities.codeLensProvider = false
--     client.server_capabilities.documentHighlightProvider = false
--     client.server_capabilities.documentSymbolProvider = false
--     client.server_capabilities.workspaceSymbolProvider = false
--     client.server_capabilities.callHierarchyProvider = false
--     client.server_capabilities.typeHierarchyProvider = false
--     client.server_capabilities.inlayHintProvider = false
--
--     -- La capacité de navigation vers la définition est activée par défaut,
--     -- donc pas besoin de la configurer explicitement.
--   end,
-- })
