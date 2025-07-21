return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/lua/snippets" } })

    -- Ici tu es SÛR que LuaSnip est chargé : tu peux mapper sans aucun risque
    local luasnip = require('luasnip')
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if luasnip.expand_or_jumpable() then
        return "<Plug>luasnip-expand-or-jump"
      else
        return "<C-k>"
      end
    end, { expr = true, silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if luasnip.jumpable(-1) then
        return "<Plug>luasnip-jump-prev"
      else
        return "<C-j>"
      end
    end, { expr = true, silent = true })
  end,
}

