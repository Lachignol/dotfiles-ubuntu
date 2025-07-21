return {
  "FtVim/norminette-lint.nvim",
  config = function()
    local nl = require("norminette-lint")
    -- Désactive par défaut (modifie selon préférence)
    nl.setup({
      enable_on_start = false,
    })

    -- Commande :NorminetteEnable pour activer le linter
    vim.api.nvim_create_user_command(
      "NorminetteEnable",
      function() nl.enable() end,
      { desc = "Activer le linter Norminette" }
    )

    -- Commande :NorminetteDisable pour désactiver le linter
    vim.api.nvim_create_user_command(
      "NorminetteDisable",
      function() nl.disable() end,
      { desc = "Désactiver le linter Norminette" }
    )
  end,
}

