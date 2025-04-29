return {
    "nvimdev/dashboard-nvim",
    lazy = false, -- Prevent lazy-loading to properly handle stdin
    opts = function()
        local logo = [[
██╗      █████╗      ██████╗██╗  ██╗██╗ ██████╗ ███╗   ██╗ ██████╗ ██╗     
██║     ██╔══██╗    ██╔════╝██║  ██║██║██╔════╝ ████╗  ██║██╔═══██╗██║     
██║     ███████║    ██║     ███████║██║██║  ███╗██╔██╗ ██║██║   ██║██║     
██║     ██╔══██║    ██║     ██╔══██║██║██║   ██║██║╚██╗██║██║   ██║██║     
███████╗██║  ██║    ╚██████╗██║  ██║██║╚██████╔╝██║ ╚████║╚██████╔╝███████╗
╚══════╝╚═╝  ╚═╝     ╚═════╝╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
Config 💾
    ]]

        -- Adjusted ASCII art to align with the logo
local additional_art =
  ' _                                              \n' ..
  '| |                                             \n' ..
  ' | |===( )    //////                              \n' ..
  ' |_|   |||   | o o|                               \n' ..
  '        |||  ( c  )                  ____          \n' ..
  '         |||  \\= /                  ||   \\_       \n' ..
  '          |||||||                   ||     |       \n' ..
  '          |||||||                ...||__/|-"       \n' ..
  '          |||||||             __|________|__       \n' ..
  '            |||             |______________|       \n' ..
  '            |||             || ||      || ||       \n' ..
  '            |||             || ||      || ||       \n' ..
  '          --|||-------------||-||------||-||-----  \n' ..
  '            |__>            || ||      || ||       \n' ..
  '                                                     \n' ..
  '                                                     \n' ..
  '     hit any key to continue                                   \n'

        logo = string.rep("\n", 8) .. logo .. "\n" .. additional_art

        local opts = {
            theme = "doom",
            hide = {
                statusline = false,
            },
            config = {
                header = vim.split(logo, "\n"),
                center = {
                    { action = "lua require('telescope.builtin').find_files()", desc = " Find File", icon = " ", key = "f" },
                    { action = "enew | startinsert", desc = " New File", icon = " ", key = "n" },
                    { action = "lua require('telescope.builtin').oldfiles()", desc = " Recent Files", icon = " ", key = "r" },
                    { action = "lua require('telescope.builtin').live_grep()", desc = " Find Text", icon = " ", key = "g" },
                    { action = "edit $MYVIMRC | source $MYVIMRC", desc = " Config", icon = " ", key = "c" },
                    { action = "lua require('persistence').load()", desc = " Restore Session", icon = " ", key = "s" },
                    { action = function() vim.cmd("Lazy") end, desc = " Lazy", icon = "󰒲 ", key = "l" },
                    { action = function() vim.cmd("qa") end, desc = " Quit", icon = " ", key = "q" },
                },
                footer = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
                end,
            },
        }

        for _, button in ipairs(opts.config.center) do
            button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
            button.key_format = "  %s"
        end

        -- open dashboard after closing lazy
        if vim.o.filetype == "lazy" then
            vim.api.nvim_create_autocmd("WinClosed", {
                pattern = tostring(vim.api.nvim_get_current_win()),
                once = true,
                callback = function()
                    vim.schedule(function()
                        vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
                    end)
                end,
            })
        end

        return opts
    end,
}
