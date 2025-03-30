local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	-- Bootstrap lazy.nvim
	-- If lazy.nvim is not already installed, clone it.
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- import/override with your plugins
		{ import = "plugins" },
		{ import = "colorscheme" },

		-- LSP Configuration using lsp-zero
		-- Installs: nvim-lspconfig, mason.nvim, mason-lspconfig.nvim, nvim-cmp, cmp-nvim-lsp, LuaSnip, lsp-zero.nvim
		{ "neovim/nvim-lspconfig" }, -- LSP Support
		{ "williamboman/mason.nvim" }, -- Package manager for LSP servers
		{ "williamboman/mason-lspconfig.nvim" }, -- Bridge between mason and lspconfig
		{ "hrsh7th/nvim-cmp" }, -- Autocompletion framework
		{ "hrsh7th/cmp-nvim-lsp" }, -- LSP completion source for nvim-cmp
		{ "L3MON4D3/LuaSnip" }, -- Snippets engine
		{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" }, -- Easy LSP setup

		-- LSP Servers
		-- Installs: clangd (C/C++), gopls (Go)
		{
			"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				{ "nvim-lua/plenary.nvim" },
			},
			config = function()
				local null_ls = require("null-ls")
				null_ls.setup({
					sources = {
						null_ls.builtins.formatting.stylua, -- lua formatter
						--null_ls.builtins.diagnostics.flake8, -- python linter
						--null_ls.builtins.formatting.black, -- python formatter
					},
				})
			end,
		},
		{ "golang/tools", requires = { "fatih/vim-go", "nvim-lua/plenary.nvim" } }, -- go formatter
		{ "neovim/nvim-lspconfig" },
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	-- install = { colorscheme = { "tokyonight", "habamax", "catppuccin" } },
	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = false, -- notify on update
	}, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
