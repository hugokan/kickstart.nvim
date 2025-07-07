return {
  'Exafunction/windsurf.vim',
  event = 'InsertEnter',
  config = function()
    vim.g.codeium_disable_bindings = 1

    -- Atajo: aceptar sugerencia
    vim.keymap.set('i', '<C-g>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true, desc = 'Aceptar sugerencia de Codeium' })

    -- Atajo: rechazar sugerencia
    vim.keymap.set('i', '<C-]>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true, desc = 'Rechazar sugerencia Codeium' })

    -- Atajo: modo chat desde selección visual
    vim.keymap.set('v', '<leader>ai', function()
      vim.fn['codeium#Chat']()
    end, { desc = '💬 Prompt interactivo Codeium' })

    -- Registro de atajos en which-key
    local wk = require 'which-key'
    wk.register({
      a = {
        name = '💡 IA',
        i = { "<cmd>lua vim.fn['codeium#Chat']()<cr>", '💬 Chat con Codeium (desde selección visual)' },
      },
    }, { prefix = '<leader>', mode = 'v' }) -- visual mode only
  end,
}
