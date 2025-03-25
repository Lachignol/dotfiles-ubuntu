return {
    'vim-syntastic/syntastic',
    config = function()
        -- Configuration optionnelle pour Syntastic
        vim.g.syntastic_always_populate_loc_list = 1
        vim.g.syntastic_auto_loc_list = 1
        vim.g.syntastic_check_on_open = 1
        vim.g.syntastic_check_on_wq = 0

        -- Utiliser uniquement Norminette comme vérificateur
	vim.g.syntastic_c_checkers = {'norminette'}
        vim.g.syntastic_cpp_checkers = {'norminette'}  -- Si vous travaillez avec C++
    end,
}

