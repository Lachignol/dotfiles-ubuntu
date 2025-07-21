return {
  {
    "barrett-ruth/live-server.nvim",
    ft = { "html", "css", "javascript", "typescript", "vue", "svelte" }, -- adapte selon tes besoins
    config = true, -- utilise la config par défaut
    cmd = { "LiveServerStart", "LiveServerStop" }, -- charge uniquement quand tu exécutes la commande
  },
}

