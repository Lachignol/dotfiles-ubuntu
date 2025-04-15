return {
    "kdheepak/lazygit.nvim",  -- Le plugin LazyGit pour intégrer Git dans Neovim
    cmd = {
        "LazyGit",               -- Commande principale pour ouvrir LazyGit
        "LazyGitConfig",         -- Ouvrir la configuration de LazyGit
        "LazyGitCurrentFile",    -- Ouvrir LazyGit pour le fichier actuellement ouvert
        "LazyGitFilter",         -- Ouvrir LazyGit avec un filtre pour les commits
        "LazyGitFilterCurrentFile", -- Ouvrir LazyGit avec un filtre sur le fichier actuel
    },
    dependencies = {
        "nvim-lua/plenary.nvim", -- Dépendance nécessaire pour les fenêtres flottantes utilisées par LazyGit
    },
    keys = {
        { 
            "<leader>lg",           -- Raccourci pour ouvrir LazyGit
            "<cmd>LazyGit<CR>",     -- Exécute la commande pour ouvrir LazyGit
            desc = "Open LazyGit",  -- Description affichée dans WhichKey pour cette commande
        },
    },
}

