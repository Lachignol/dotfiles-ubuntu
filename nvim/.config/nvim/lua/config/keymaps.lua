local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------LEADER KEY----------------------------------------------------
vim.g.mapleader = " "

-------TABULATION--------------------------------------------------------------
-- Utiliser des tabulations réelles (physiques) pour la touche Tab
vim.opt.expandtab = false -- Ne pas remplacer les tabulations par des espaces

map("n", "<leader>tk", "<C-w>t<C-w>K") -- change vertical to horizontal
map("n", "<leader>th", "<C-w>t<C-w>H") -- change horizontal to vertical

-------BUFFER-------------------------------------------------------------------
-- Supprimer le buffer actuel avec <leader>bd
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true })
-- naviguer entre les buffers vers la gauche avec shift + h
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true })
-- naviguer entre les buffers vers la droite avec shift + l
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true })
-- revien au dernier buffer avec <leader> et tabulation
vim.api.nvim_set_keymap('n', '<leader><tab>', ':b#<CR>', { noremap = true, silent = true, desc = "Revenir au dernier buffer" })


-------WINDOW-------------------------------------------------------------------
-- Bouger entre les fenetres split avec Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
-- spliter les fenetre avec espace + w + v
vim.keymap.set("n", "<leader>wv", ":vsplit<CR><C-w>l", { noremap = true, silent = true }) -- split vertical et focus à droite
-- spliter les fenetre avec espace + w + h
vim.keymap.set("n", "<leader>wh", ":split<CR><C-w>j", { noremap = true, silent = true })  -- split horizontal et focus en bas
-- pour fermer la fenetre avec espace + w + d
vim.keymap.set("n", "<leader>wd", ":q<CR>", { noremap = true, silent = true })

-------NAVIGATION-------------------------------------------------------------------
-- Permet de recentrer l'ecran (ZZ) quand je bouge avec ctrl+d ou ctrl_u (bouge d'un demi ecran vers le haut ou le bas)
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
-------FLECHES-------------------------------------------------------------------
-- Désactiver les touches fléchées dans Neovim
vim.api.nvim_set_keymap("n", "<Up>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Left>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Right>", "", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<Up>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Down>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Left>", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Right>", "", { noremap = true, silent = true })


-------Desactiver la surbrillance de la recherche -------------------------------------------------------------------
vim.api.nvim_set_keymap("n", "<leader>/",":nohlsearch<CR>", {noremap = true,silent = true
})
-------Mapper Ctrl-S pour enregistrer le buffer---------------------------------------
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true }) -- Mode normal
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true }) -- Mode insertion

------Deplacement de texte ou ligne vers le haut avec k ou le bas avec h--------------
-- Déplace le texte sélectionné vers le haut en mode visuel (activé avec v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le haut en mode visuel" })
-- Déplace le texte sélectionné vers le bas en mode visuel (activé avec v)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le bas en mode visuel" })

-- Déplace le texte sélectionné vers le haut en mode visuel bloc (activé avec V)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le haut en mode visuel bloc" })
-- Déplace le texte sélectionné vers le bas en mode visuel bloc (activé avec V)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le bas en mode visuel bloc" })
