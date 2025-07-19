local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    -- Bootstrap lazy.nvim
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
        -- Ajout de nvim-treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            event = { "BufReadPost", "BufNewFile" },
            config = function()
                require("nvim-treesitter.configs").setup {
                    ensure_installed = { "lua", "python", "go", "c", "cpp" },
                    highlight = { enable = true },
                    indent = { enable = true },
                }
            end,
        },

        -- Import de tes autres plugins
        { import = "plugins" },
        { import = "colorscheme" },

        -- LSP Configuration (nvim-lspconfig, mason, etc.)
        {
            "neovim/nvim-lspconfig",
            dependencies = {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "hrsh7th/nvim-cmp",
                "hrsh7th/cmp-nvim-lsp",
                "L3MON4D3/LuaSnip",
                "VonHeikemen/lsp-zero.nvim",
            },
            config = function()
                require("config.lsp_config") -- Charger votre configuration LSP ici
            end,
        },

        -- Mason and Mason-LSPConfig
        { "williamboman/mason.nvim" },
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = "williamboman/mason.nvim",
            config = function()
                require("mason-lspconfig").setup {
                    ensure_installed = { "gopls", "lua_ls", "pyright", "clangd" },
                }
            end,
        },

        -- None-LS pour les formateurs et linters
        {
            "nvimtools/none-ls.nvim",
            event = { "BufReadPre", "BufNewFile" },
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                local null_ls = require("null-ls")
                null_ls.setup({
                    sources = {
                        null_ls.builtins.formatting.stylua,
                        -- null_ls.builtins.diagnostics.flake8,
                        -- null_ls.builtins.formatting.black,
                    },
                })
            end,
        },

        -- Golang tools
        {
            "golang/tools",
            dependencies = { "fatih/vim-go", "nvim-lua/plenary.nvim" },
            ft = { "go" },
        },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    checker = { enabled = true, notify = false },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

