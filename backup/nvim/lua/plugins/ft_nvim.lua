-- Exemple de configuration de lazy.nvim
return {
  "vinicius507/ft_nvim",
  cmd = { "FtHeader", "Norme" },
  ft = { "c", "cpp" },
  config = function()
    require("ft_nvim").setup({
      header = {
        enable = true,
        username = "ascordil",
        email = "marvin@42.fr",
      },
      norminette = {
        enable = true,
        cmd = "norminette",
        condition = function()
          return true
        end,
      },
    })
  end,
}
