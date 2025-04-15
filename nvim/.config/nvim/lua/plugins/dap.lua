return {
    -- Plugin principal pour le débogage
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            -- Interface utilisateur pour nvim-dap
            "rcarriga/nvim-dap-ui",
            -- Texte virtuel pour afficher les variables dans le code
            "theHamsta/nvim-dap-virtual-text",
            -- Intégration avec Mason pour gérer les installations des adaptateurs DAP
            "jay-babu/mason-nvim-dap.nvim",
            -- Support spécifique pour le débogage Go
            "leoluz/nvim-dap-go",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Configurer dap-ui pour afficher l'interface utilisateur du débogueur
            dapui.setup()

            -- Ouvrir/fermer automatiquement l'interface utilisateur DAP lors des événements de débogage
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()  -- Ouvre l'interface lorsque le débogage commence
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()  -- Ferme l'interface lorsque le débogage est terminé
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()  -- Ferme l'interface lorsque le processus de débogage est quitté
            end

            -- Configurer nvim-dap-virtual-text pour afficher des informations sur les variables dans le code
            require("nvim-dap-virtual-text").setup()

            -- Configurer Mason pour installer automatiquement les débogueurs nécessaires
            require("mason-nvim-dap").setup({
                ensure_installed = { "delve", "cppdbg" }, -- Assurer l'installation de débogueurs Go et C/C++
                automatic_installation = true,  -- Installation automatique des débogueurs
            })

            -- Configurer le support spécifique pour Go avec nvim-dap-go
            require("dap-go").setup()

            -- Ajouter des symboles visuels pour les points d'arrêt dans le code
            vim.fn.sign_define("DapBreakpoint", {
                text = "🔴",  -- Définir l'icône pour un point d'arrêt
                texthl = "",
                linehl = "",
                numhl = ""
            })
        end,
    },
}

