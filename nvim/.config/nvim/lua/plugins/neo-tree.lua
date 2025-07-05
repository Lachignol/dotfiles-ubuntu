return {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- Optional, for file icons
            "MunifTanjim/nui.nvim",
        },
        config = function()
            -- Set keymap for toggling Neo-tree with <leader>e
            vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true, noremap = true })
            -- Set keymap for toggling Git status with <leader>gs
            vim.keymap.set('n', '<leader>gs', ':Neotree toggle git_status<CR>', { silent = true, noremap = true })

            -- Function to toggle hidden & git-ignored files
            local function toggle_hidden()
                local state = require("neo-tree.sources.manager").get_state("filesystem")
                if state then
                    local filters = state.filtered_items
                    filters.visible = not filters.visible
                    filters.hide_dotfiles = not filters.hide_dotfiles
                    filters.hide_gitignored = not filters.hide_gitignored
                    require("neo-tree.sources.filesystem")._navigate_internal(state, nil, nil)
                end
            end

            -- Keymap to toggle hidden and git-ignored files
            vim.keymap.set('n', '<leader>sh', toggle_hidden,
                { noremap = true, silent = true, desc = "Toggle Hidden Files" })

            -- Optionally configure Neo-tree here
            require("neo-tree").setup({
                -- Use custom icons for different components
                default_component_configs = {
                    window = {
                        position = "left", -- Position NeoTree on the left
                        width = 35, -- Adjust width based on your preference
                    },
                    icon = {
                        folder_closed = "", -- Folder icon (closed)
                        folder_open = "",   -- Folder icon (open)
                        folder_empty = "",   -- Folder icon (empty)
                        default = "",       -- Default file icon
                    },
                    git_status = {
                        symbols = {
                            added     = "✚",  -- Added file icon
                            modified  = "",  -- Modified file icon
                            deleted   = "",  -- Deleted file icon
                            renamed   = "",  -- Renamed file icon
                            untracked = "",  -- Untracked file icon
                            ignored   = "",  -- Ignored file icon
                            unstaged  = "",  -- Unstaged file icon
                            staged    = "",  -- Staged file icon
                            conflict  = "",  -- Conflict file icon
                        },
                    },
                },
                filesystem = {
                    follow_current_file = {
                        enabled = true,  -- Automatically focus the file in the explorer
                    },
                    hijack_netrw_behavior = "open_current", -- Replace netrw with Neo-tree behavior
                    filtered_items = {
                        visible = false,  -- Hide hidden files by default
                        hide_dotfiles = true,  -- Hide dotfiles (e.g., `.gitignore`, `.env`, etc.) by default
                        hide_gitignored = false, -- Keep Git-ignored files visible by default
                        -- Hide specific folders like .git, .cache, etc.
                        hide_by_name = { 
                            ".git",        -- Git directory
                            ".cache",      -- Cache directory
                            "node_modules" -- Node.js dependencies folder
                        },
                    },
                },
            })
        end
    }
