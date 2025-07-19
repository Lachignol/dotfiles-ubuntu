return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = function(term)
        if term.direction == "horizontal" then
          return 20
        elseif term.direction == "vertical" then
          return 60
        end
      end,
      open_mapping = [[<c-\\>]], -- Ouvre par défaut avec Ctrl + _
      direction = 'horizontal',
      shell = '/bin/zsh',
      close_on_exit = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      highlights = {
        Normal = {
          guifg = '#ffffff',
          guibg = '#1e1e1e',
        },
        NormalFloat = {
          link = 'Normal',
        },
      },
    }

    -- 🧩 Raccourcis personnalisés
    -- Sort du mode insert en terminal avec <Esc>
    vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

    -- Ctrl + _ → terminal horizontal
    vim.api.nvim_set_keymap('n', '<c-\\>', '<cmd>ToggleTerm direction=horizontal<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('t', '<c-\\>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })

    -- Ctrl + \ → terminal vertical
    vim.api.nvim_set_keymap('n', '<c-|>', '<cmd>ToggleTerm direction=vertical<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('t', '<c-|>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
  end,
}

