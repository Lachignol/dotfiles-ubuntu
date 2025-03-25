----------------------HISTORY----------------------
-- Gestion de l'historique d'annulation
-- Active la persistance de l'historique d'annulation
vim.opt.undofile = true
--Définit 10000 niveaux d'annulation
vim.opt.undolevels = 10000
--Stocke les fichiers d'annulation dans le répertoire de données de Neovim
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
-- Mise à jour plus fréquente
vim.opt.updatetime = 200
-- Augmentation de l'historique de commandes
vim.opt.history = 100

----------------------SWAP-FILE--------------------
-- Désactivation des fichiers swap
vim.opt.swapfile = false


