return {
  'jackMort/ChatGPT.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('chatgpt').setup {
      openai_params = {
        model = 'gpt-4', -- o "gpt-3.5-turbo" si prefieres
        temperature = 0.7,
        max_tokens = 1000,
      },
      openai_edit_params = {
        model = 'gpt-4',
        temperature = 0.7,
        top_p = 1,
      },
    }
  end,
  keys = {
    { '<leader>cg', '<cmd>ChatGPT<CR>', desc = 'ChatGPT UI' },
    { '<leader>ce', '<cmd>ChatGPTEditWithInstructions<CR>', mode = { 'n', 'v' }, desc = 'Editar con instrucciones' },
    { '<leader>cc', '<cmd>ChatGPTCompleteCode<CR>', mode = { 'n', 'v' }, desc = 'Completar código' },
  },
}
