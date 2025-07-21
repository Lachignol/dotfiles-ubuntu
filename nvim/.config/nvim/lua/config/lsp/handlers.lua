local M = {}

M.clangd_handler = function(client, bufnr)
  require("config.lsp.on_attach").on_attach(client, bufnr)

  vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
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
end

return M

