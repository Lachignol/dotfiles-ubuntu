local wk = require("which-key")

wk.register({
  -- 🗂 Buffers
  buffers = {
    name = "🗂 Buffers",
    b = { ":bd<CR>", "Fermer buffer" },
    ["<tab>"] = { ":b#<CR>", "Revenir au dernier buffer" },
    ["<S-h>"] = { ":bprevious<CR>", "Buffer précédent (Shift+h)" },
    ["<S-l>"] = { ":bnext<CR>", "Buffer suivant (Shift+l)" },
    tb = { "<cmd>Telescope buffers<cr>", "Liste des buffers (Telescope)" },
  },

  -- 💾 Sauvegarde
  save = {
    name = "💾 Sauvegarde",
    ["<C-s>"] = { ":w<CR>", "Sauvegarder (normal)" },
    i = { "<Esc>:w<CR>a", "Sauvegarder (insertion)" },
  },

  -- ↹ Tabs & Splits
  tabs = {
    name = "↹ Tabs & Splits",
    k = { "<C-w>t<C-w>K", "Vertical → Horizontal" },
    h = { "<C-w>t<C-w>H", "Horizontal → Vertical" },
  },

  -- 🪟 Fenêtres
  windows = {
    name = "🪟 Fenêtres",
    v = { ":vsplit<CR><C-w>l", "Split vertical et focus droite" },
    h = { ":split<CR><C-w>j", "Split horizontal et focus bas" },
    d = { ":q<CR>", "Fermer fenêtre" },
  },

  -- 🔄 Navigation écran
  navigation = {
    name = "🔄 Navigation écran",
    ["<C-d>"] = { "<C-d>zz", "Descendre d’un demi-écran et centrer" },
    ["<C-u>"] = { "<C-u>zz", "Monter d’un demi-écran et centrer" },
  },

  -- 💡 Complétion nvim-cmp
  completion = {
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

  -- ⛔ Désactivation flèches
  disable_arrows = {
    name = "⛔ Désactivation flèches",
    ["<Up>"]    = { "", "Désactivé" },
    ["<Down>"]  = { "", "Désactivé" },
    ["<Left>"]  = { "", "Désactivé" },
    ["<Right>"] = { "", "Désactivé" },
  },

  -- ❌ Recherche & Enregistrer / Surbrillance
  search = {
    name = "❌ Recherche & Surbrillance",
    ["/"] = { ":nohlsearch<CR>", "Désactiver surbrillance (<leader>/)" },
    tf = { "<cmd>Telescope find_files<cr>", "Chercher fichiers (Telescope)" },
    tg = { "<cmd>Telescope live_grep<cr>", "Recherche live grep (Telescope)" },
    th = { "<cmd>Telescope help_tags<cr>", "Aide tags (Telescope)" },
  },

  -- 📌 Harpoon
  harpoon = {
    name = "📌 Harpoon",
    m = "Marquer fichier",
    a = "Menu rapide",
    n = "Fichier marqué suivant",
    p = "Fichier marqué précédent",
    ["1"] = "Aller au buffer harpoon 1/2/3/4/5",
  },

  -- 📂 Oil Explorer
  oil = {
    name = "📂 Oil Explorer",
    o = "Ouvrir Oil Explorer (<leader>o)",
    ["-"] = "Ouvrir dossier parent (-)",
  },

  -- 🐞 Debug (DAP)
  debug = {
    name = "🐞 Debug (DAP)",
    c = { "<cmd>lua require('dap').continue()<cr>", "Continue Debugging" },
    T = { "<cmd>lua require('dap').terminate()<cr>", "Terminate Debugging" },
    b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    u = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle DAP UI" },
    s = "Démarrer/Continuer (ds)",
    B = "Définir point d’arrêt conditionnel",
    l = "Basculer UI debug",
    F1 = "Step Into (F1)",
    F2 = "Step Over (F2)",
    F3 = "Step Out (F3)",
    F5 = "Démarrer/Continuer (F5)",
    F7 = "Afficher dernière session (F7)",
  },

  -- ⚡ Flash
  flash = {
    name = "⚡ Flash",
    s = { "<cmd>lua require('flash').jump()<cr>", "Flash avant (s)" },
    S = { "<cmd>lua require('flash').jump({ direction = 'left' })<cr>", "Flash arrière (S)" },
  },

  -- Git / GitSigns / LazyGit / Toggle
  git = {
    name = " Git",
    gc = {
      name = "Git Conflict",
      o = { "<cmd>GitConflictChooseOurs<cr>", "Choisir 'Ours'" },
      t = { "<cmd>GitConflictChooseTheirs<cr>", "Choisir 'Theirs'" },
      b = { "<cmd>GitConflictChooseBoth<cr>", "Choisir les deux" },
      ["0"] = { "<cmd>GitConflictChooseNone<cr>", "Choisir aucun" },
      ["]x"] = { "<cmd>GitConflictNextConflict<cr>", "Conflit suivant" },
      ["[x"] = { "<cmd>GitConflictPrevConflict<cr>", "Conflit précédent" },
      c = { "<cmd>GitConflictListQf<cr>", "Liste des conflits (quickfix)" },
    },
    gh = {
      name = "Git Hunk",
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
    gt = {
      name = "Git Toggle",
      b = "Toggle blame ligne",
      D = "Toggle affichage lignes supprimées",
    },
    gl = {
      name = "LazyGit",
      g = "Ouvrir LazyGit",
    }
  },

  -- 🔗 Surround
  surround = {
    name = "🔗 Surround",
    y = "Ajouter autour (ys)",
    c = "Modifier autour (cs)",
    d = "Supprimer autour (ds)",
  },

  -- 🛠 Trouble
  trouble = {
    name = "🛠 Trouble",
    X = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics globaux" },
    x = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Diagnostics buffer courant" },
    L = { "<cmd>Trouble loclist toggle<cr>", "Liste de localisation" },
    Q = { "<cmd>Trouble qflist toggle<cr>", "Liste Quickfix" },
    symbols = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symboles" },
    lsp = { "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "Définitions / Références LSP" },
  },

  -- 🧘 Zen Mode
  zenmode = {
    name = "🧘 Zen Mode",
    z = { "<cmd>ZenMode<cr>", "Activer Zen Mode" },
  },

  -- ⬆️⬇️ Déplacement texte/ligne
  move = {
    name = "⬆️⬇️ Déplacer texte",
    ["<A-k>"] = { ":m '<-2<CR>gv-gv", "Déplacer sélection haut (visuel)" },
    ["<A-j>"] = { ":m '>+1<CR>gv-gv", "Déplacer sélection bas (visuel)" },
    x = {
      name = "Bloc visuel",
      ["<A-k>"] = { ":move '<-2<CR>gv-gv", "Déplacer bloc sélectionné haut" },
      ["<A-j>"] = { ":move '>+1<CR>gv-gv", "Déplacer bloc sélectionné bas" },
    }
  },
}, { prefix = "<leader>" })

