local dap = require("dap")
local dapui = require("dapui")

-- Points d'arrêt
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })

-- Contrôle du débogueur
vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Continue Debugging" })
vim.keymap.set("n", "<leader>ds", function() dap.step_over() end, { desc = "Step Over" })
vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step Into" })
vim.keymap.set("n", "<leader>do", function() dap.step_out() end, { desc = "Step Out" })

-- Interface utilisateur DAP UI
vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "Toggle DAP UI" })

