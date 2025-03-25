-- ~/.config/nvim/lua/plugins/comment.lua
return {
  "numToStr/Comment.nvim",
  version = "*", -- Assurez-vous d'utiliser la dernière version
  config = function()
    require("Comment").setup({
      mappings = {
        basic = true, -- Active les mappages de base pour commenter/décommenter
        extra = true, -- Active les mappages supplémentaires
      },
      pre_hook = function(ctx)
        local U = require("Comment.utils")

        -- Si la ligne est vide, ne pas commenter
        if ctx.ctype == U.ctype.line then
          return require("ts_context_commentstring.utils").get_cursor_context()
        end
      end,
    })
  end,
}
