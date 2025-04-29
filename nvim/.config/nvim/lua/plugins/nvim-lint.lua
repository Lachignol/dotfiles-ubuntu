return {
  "mfussenegger/nvim-lint", -- Installer nvim-lint
  config = function()
    -- Configurer nvim-lint
    local lint = require("lint")
    
    -- Lancer linting pour certains types de fichiers
    lint.linters_by_ft = {
      lua = { }, -- Exemple pour Lua, tu peux ajouter d'autres linters pour d'autres langages
      python = { "flake8" }, -- Exemple pour Python
      -- Tu peux ajouter d'autres types de fichiers et leurs linters ici
    }

    -- Activer nvim-lint
    vim.cmd [[
      augroup LintOnSave
        autocmd!
        autocmd BufWritePost * lua require('lint').try_lint()
      augroup END
    ]]
  end,
}

