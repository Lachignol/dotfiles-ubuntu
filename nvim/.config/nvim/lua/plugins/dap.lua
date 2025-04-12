return {
    -- Plugin principal pour le débogage
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui", -- Interface utilisateur pour nvim-dap
            "theHamsta/nvim-dap-virtual-text", -- Texte virtuel pour afficher les variables
            "jay-babu/mason-nvim-dap.nvim", -- Intégration avec Mason
            "leoluz/nvim-dap-go", -- Support spécifique pour Go
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Configurer dap-ui
            dapui.setup()

            -- Ouvrir/fermer automatiquement l'interface utilisateur DAP
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- Configurer nvim-dap-virtual-text
            require("nvim-dap-virtual-text").setup()

            -- Configurer Mason pour installer les adaptateurs DAP
            require("mason-nvim-dap").setup({
                ensure_installed = { "delve", "cppdbg" }, -- Débogueurs Go et C/C++
                automatic_installation = true,
            })

            -- Configurer le support pour Go
            require("dap-go").setup()

            -- Ajouter des symboles pour les points d'arrêt
            vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
        end,
    },
}

