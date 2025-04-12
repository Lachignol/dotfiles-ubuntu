local dap = require("dap")
local dapui = require("dapui")


-- Étapes dans le code
vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "Step Out" })

-- Contrôle du débogueur
vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Continue Debugging" })
vim.keymap.set("n", "<leader>dT", function() dap.terminate() end, { desc = "Terminate Debugging" })

-- Points d'arrêt
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })

-- Interface utilisateur DAP UI
vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "Toggle DAP UI" })

