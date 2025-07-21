return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "rafamadriz/friendly-snippets", -- snippets prêt-à-l'emploi (optionnel)
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Chargement des snippets VSCode et snippets Lua persos
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load({
      paths = vim.fn.stdpath("config") .. "/snippets",
    })

    -- Table des labels de source (noms affichés dans le menu)
    local menu_labels = {
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      luasnip = "[Snippet]",
      path = "[Path]"
    }

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-q>"] = cmp.mapping.complete(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),

      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
      }),

      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = menu_labels[entry.source.name]
          return vim_item
        end,
      },
    })

    -- Complétion pour la ligne de commande `:`
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
      }),
    })

    -- Complétion pour les commandes de recherche `/` ou `?`
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
  end,
}

