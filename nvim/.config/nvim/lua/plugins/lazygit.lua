return {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim", -- Nécessaire pour les fenêtres flottantes
    },
    keys = {
        { "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" }, -- Raccourci pour ouvrir LazyGit
    },
}

