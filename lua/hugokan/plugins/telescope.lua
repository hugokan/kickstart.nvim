return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'

    telescope.setup {
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          preview_width = 0.6,
        },
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
            ['<Esc>'] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    }

    -- Cargar extensiones si están disponibles
    pcall(telescope.load_extension, 'fzf')
    pcall(telescope.load_extension, 'file_browser')
    pcall(telescope.load_extension, 'ui-select') -- para dressing

    -- Atajos recomendados (opcional)
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Buscar archivos' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Buscar texto (grep)' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers abiertos' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Ayuda' })
    vim.keymap.set('n', '<leader>fe', telescope.extensions.file_browser.file_browser, { desc = 'File browser' })
  end,
}
