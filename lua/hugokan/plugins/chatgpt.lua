return {
  'jackMort/ChatGPT.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('chatgpt').setup {
      api_key_cmd = 'echo $OPENAI_API_KEY',
      openai_params = {
        model = 'gpt-4o', -- Cambia por "gpt-3.5-turbo" si lo prefieres
        temperature = 0.7,
        top_p = 1,
      },
      openai_edit_params = {
        model = 'gpt-4o',
        temperature = 0.7,
        top_p = 1,
      },
      popup_input = {
        submit = '<C-s>',
      },
    }

    -- Atajos con which-key en grupo IA
    local wk = require 'which-key'
    wk.register({
      ai = {
        name = '🤖 IA',
        c = { '<cmd>ChatGPT<cr>', 'Chat General' },
        e = { '<cmd>ChatGPTEditWithInstruction<cr>', 'Editar con instrucciones' },
        a = { '<cmd>ChatGPTActAs<cr>', 'Actuar como...' },
        g = {
          name = 'Generar',
          f = { '<cmd>ChatGPTRun fix_bugs<cr>', 'Corregir errores' },
          o = { '<cmd>ChatGPTRun optimize_code<cr>', 'Optimizar código' },
          d = { '<cmd>ChatGPTRun docstring<cr>', 'Documentar código' },
        },
      },
    }, { prefix = '<leader>', mode = 'n' })

    -- Modo visual para editar bloques seleccionados
    wk.register({
      ai = {
        name = '🤖 IA',
        e = { '<cmd>ChatGPTEditWithInstruction<cr>', 'Editar bloque con instrucciones' },
      },
    }, { prefix = '<leader>', mode = 'v' })
  end,
}
