return {
-- Ajouter le plugin transparent.nvim
        { "xiyaowong/transparent.nvim", config = function()
            require('transparent').setup({
                enable = true, -- Activer la transparence
                extra_groups = { -- Ajouter des groupes supplémentaires si nécessaire
                    'Normal', 'NormalNC', 'Comment', 'SpecialComment',
                    'LineNr', 'SignColumn', 'EndOfBuffer'
                },
            })
        end },
}
