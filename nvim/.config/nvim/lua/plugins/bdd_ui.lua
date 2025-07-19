return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
  },
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  config = function()
    -- Activer les icônes nerd fonts
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}

