return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local function terminal_indicator()
      if vim.bo.buftype == "terminal" then
        local mode = vim.fn.mode()
        return mode == "t" and "[TERM INSERT]" or "[TERM NORMAL]"
      end
      return ""
    end

    require('lualine').setup {
      options = {
        icons_enabled = false,
        theme = 'auto',
        section_separators = '',
        component_separators = '',
        globalstatus = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {
          {
            'filename',
            path = 1,
            symbols = {modified = ' [+]', readonly = ' [RO]', unnamed = '[No Name]'}
          },
          terminal_indicator,
        },
        lualine_x = {
          'filetype',
          {
            'diagnostics',
            sources = {'nvim_lsp'},
            sections = {'error', 'warn'},
            symbols = {error = 'E:', warn = 'W:'},
            colored = false,
          },
        },
        lualine_y = {'progress'},
        lualine_z = {'location'},
      },
    }
  end,
}

