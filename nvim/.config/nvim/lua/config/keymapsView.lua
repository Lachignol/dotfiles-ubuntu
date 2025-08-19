local wk = require("which-key")

-- Configuration de base pour une belle présentation
require("which-key").setup({
  plugins = {
    spelling = true,
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
  },
  layout = {
    spacing = 5,
    align = "left",
  },
})

wk.register({
  -- Tabs & Splits
  t = {
    name = "↹ Tabs & Splits",
    k = { "<C-w>t<C-w>K", "Vertical → Horizontal" },
    h = { "<C-w>t<C-w>H", "Horizontal → Vertical" },
  },

  -- Buffers
  b = {
    name = "🗂 Buffers",
    d = { ":bd<CR>", "Fermer buffer" },
    ["<tab>"] = { ":b#<CR>", "Revenir au dernier buffer" },
  },

  -- Navigation Buffers
  n = {
    name = "🔄 Navigation Buffers",
    ["<S-h>"] = { ":bprevious<CR>", "Buffer précédent (Shift+h)" },
    ["<S-l>"] = { ":bnext<CR>", "Buffer suivant (Shift+l)" },
  },

  -- Fenêtres
  w = {
    name = "🪟 Fenêtres",
    v = { ":vsplit<CR><C-w>l", "Split vertical et focus droite" },
    h = { ":split<CR><C-w>j", "Split horizontal et focus bas" },
    d = { ":q<CR>", "Fermer fenêtre" },
  },

  -- Navigation écran
  c = {
    name = "🔄 Navigation écran",
    ["<C-d>"] = { "<C-d>zz", "Descendre d’un demi-écran et centrer" },
    ["<C-u>"] = { "<C-u>zz", "Monter d’un demi-écran et centrer" },
  },

  -- Désactivation flèches
  s = {
    name = "⛔ Désactivation flèches",
    ["<Up>"] = { "", "Désactivé" },
    ["<Down>"] = { "", "Désactivé" },
    ["<Left>"] = { "", "Désactivé" },
    ["<Right>"] = { "", "Désactivé" },
  },

  -- Recherche & Enregistrer
  h = {
    name = "❌ Recherche & Enregistrer",
    ["/"] = { ":nohlsearch<CR>", "Désactiver surbrillance recherche (<leader>/)" },
  },

  -- Sauvegarde
  S = {
    name = "💾 Sauvegarde",
    ["<C-s>"] = { ":w<CR>", "Sauvegarder (normal)" },
    i = { "<Esc>:w<CR>a", "Sauvegarder (insertion)" },
  },

  -- Déplacer texte/ligne
  m = {
    name = "⬆️⬇️ Déplacer texte",
    ["<A-k>"] = { ":m '<-2<CR>gv-gv", "Déplacer texte sélectionné vers le haut (visuel)" },
    ["<A-j>"] = { ":m '>+1<CR>gv-gv", "Déplacer texte sélectionné vers le bas (visuel)" },
    x = {
      name = "Bloc visuel",
      ["<A-k>"] = { ":move '<-2<CR>gv-gv", "Déplacer bloc sélectionné vers le haut" },
      ["<A-j>"] = { ":move '>+1<CR>gv-gv", "Déplacer bloc sélectionné vers le bas" },
    },
  },

  -- Fichiers (Telescope)
  ["<leader>"] = {
    name = "🔭 Telescope",
    ["<leader>"] = { "<cmd>Telescope find_files<cr>", "Chercher fichiers" },
    g = {
      name = "🔍 Recherche",
      ["<leader>"] = { "<cmd>Telescope live_grep<cr>", "Recherche live grep" },
    },
    b = {
      name = "🗂 Buffers",
      ["<leader>"] = { "<cmd>Telescope buffers<cr>", "Liste des buffers" },
    },
    h = {
      name = "❓ Help",
      ["<leader>"] = { "<cmd>Telescope help_tags<cr>", "Aide tags" },
    },
  },

  -- Complétion nvim-cmp
  c = {
    name = "💡 Complétion nvim-cmp",
    n = "Suivant (Ctrl-n)",
    p = "Précédent (Ctrl-p)",
    d = "Descendre doc (Ctrl-d)",
    f = "Monter doc (Ctrl-f)",
    q = "Forcer complétion (Ctrl-q)",
    y = "Confirmer sélection (Ctrl-y)",
    e = "Annuler complétion (Ctrl-e)",
    cr = "Confirmer sélection (Entrée)",
  },

  -- Debug (DAP)
  d = {
    name = "🐞 Debug (DAP)",
    c = { "<cmd>lua require('dap').continue()<cr>", "Continue Debugging (<leader>dc)" },
    T = { "<cmd>lua require('dap').terminate()<cr>", "Terminate Debugging (<leader>dT)" },
    b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint (<leader>db)" },
    u = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle DAP UI (<leader>du)" },
    F10 = { "<cmd>lua require('dap').step_over()<cr>", "Step Over (F10)" },
    F11 = { "<cmd>lua require('dap').step_into()<cr>", "Step Into (F11)" },
    F12 = { "<cmd>lua require('dap').step_out()<cr>", "Step Out (F12)" },
    s = "Démarrer/Continuer (ds)",
    B = "Définir point d’arrêt conditionnel",
    l = "Basculer UI debug",
    F1 = "Step Into (F1)",
    F2 = "Step Over (F2)",
    F3 = "Step Out (F3)",
    F5 = "Démarrer/Continuer (F5)",
    F7 = "Afficher dernière session (F7)",
  },

  -- Flash
  f = {
    name = "⚡ Flash",
    s = { "<cmd>lua require('flash').jump()<cr>", "Flash avant (s)" },
    S = { "<cmd>lua require('flash').jump({ direction = 'left' })<cr>", "Flash arrière (S)" },
  },

  -- Git Conflict (git-conflict.nvim)
  gc = {
    name = " Git Conflict",
    o = { "<cmd>GitConflictChooseOurs<cr>", "Choisir 'Ours' (co)" },
    t = { "<cmd>GitConflictChooseTheirs<cr>", "Choisir 'Theirs' (ct)" },
    b = { "<cmd>GitConflictChooseBoth<cr>", "Choisir les deux (cb)" },
    ["0"] = { "<cmd>GitConflictChooseNone<cr>", "Choisir aucun (c0)" },
    ["]x"] = { "<cmd>GitConflictNextConflict<cr>", "Conflit suivant (]x)" },
    ["[x"] = { "<cmd>GitConflictPrevConflict<cr>", "Conflit précédent ([x)" },
    c = { "<cmd>GitConflictListQf<cr>", "Liste des conflits (quickfix)" },
  },

  -- GitSigns
  gh = {
    name = " Git Hunk",
    s = "Stage hunk",
    r = "Reset hunk",
    S = "Stage buffer",
    u = "Undo stage hunk",
    R = "Reset buffer",
    p = "Preview hunk",
    b = "Blame ligne",
    d = "Diff contre index",
    D = "Diff contre dernier commit",
  },

  -- Toggles GitSigns
  gt = {
    name = "🔀 Toggles Git",
    b = "Toggle blame ligne",
    D = "Toggle affichage lignes supprimées",
  },

  -- Harpoon
  hh = {
    name = "📌 Harpoon",
    m = "Marquer fichier",
    a = "Menu rapide",
    n = "Fichier marqué suivant",
    p = "Fichier marqué précédent",
    ["1"] = "Aller au fichier 1",
    ["2"] = "Aller au fichier 2",
    ["3"] = "Aller au fichier 3",
    ["4"] = "Aller au fichier 4",
    ["5"] = "Aller au fichier 5",
  },

  -- LazyGit
  lg = {
    name = " LazyGit",
    g = "Ouvrir LazyGit",
  },

  -- Oil Explorer
  oo = {
    name = "📂 Oil Explorer",
    o = "Ouvrir Oil Explorer (<leader>o)",
    ["-"] = "Ouvrir dossier parent (-)",
  },

  -- Surround
  ss = {
    name = "🔗 Surround",
    y = "Ajouter autour (ys)",
    c = "Modifier autour (cs)",
    d = "Supprimer autour (ds)",
  },

  -- ToggleTerm
  t = {
    name = "🧩 Terminal Toggle",
    ["<c-\\>"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "Terminal horizontal (Ctrl+\\)" },
    ["<c-|>"] = { "<cmd>ToggleTerm direction=vertical<cr>", "Terminal vertical (Ctrl+|)" },
  },

  -- Trouble
  x = {
    name = "🛠 Trouble",
    X = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics globaux" },
    x = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Diagnostics buffer courant" },
    L = { "<cmd>Trouble loclist toggle<cr>", "Liste de localisation" },
    Q = { "<cmd>Trouble qflist toggle<cr>", "Liste Quickfix" },
  },
  c = {
    name = "⚙️ Trouble LSP / Symbols",
    s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symboles" },
    l = { "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "Définitions / Références LSP" },
  },

  -- ZenMode
  z = {
    name = "🧘 Zen Mode",
    z = { "<cmd>ZenMode<cr>", "Activer Zen Mode" },
  },
}, { prefix = "<leader>" })
