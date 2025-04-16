return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
			end,
			desc = "Explorer NeoTree (root dir)",
		},
	},
	opts = {
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
			use_libuv_file_watcher = true,
		},
		window = {
			mappings = {
				["<space>"] = "none",
			},
		},
	},

	-- 🔥 Auto-open + focus Neo-tree
	init = function()
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      local is_dir = vim.fn.isdirectory(vim.fn.argv()[1] or "") == 1
      if vim.fn.argc() == 0 or is_dir then
        -- Crée un buffer temporaire et ferme le buffer vide
        vim.cmd("enew")
        vim.cmd("bdelete 1")

        -- Ouvre Neo-tree avec 'show' pour l'afficher correctement
        require("neo-tree.command").execute({
          action = "show",  -- Assure que Neo-tree s'affiche
          position = "left",
          source = "filesystem",
          toggle = false,
        })

        -- Attends un peu avant de donner le focus à Neo-tree
        vim.defer_fn(function()
          -- Cherche la fenêtre de Neo-tree et lui donne le focus
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
            if bufname:match("neo%-tree filesystem") then
              -- Focus sur la fenêtre Neo-tree
              vim.api.nvim_set_current_win(win)
              break
            end
          end
        end, 100)  -- Le délai peut être ajusté si besoin
      end
    end,
  })
end,
}

