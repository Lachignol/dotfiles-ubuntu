return {
{
    "kawre/leetcode.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    build = ":TSUpdate",  -- mets à jour les parsers Tree-sitter, optionnel
    opts = {},            -- configuration personnalisée, sinon vide
    cmd = "Leet",         -- commande pour lancer le plugin
}

}
