return {
  'yetone/avante.nvim',
  build = 'make',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'stevearc/dressing.nvim',
    'nvim-tree/nvim-web-devicons',
    'MeanderingProgrammer/render-markdown.nvim',
  },
  opts = function()
    local primary_model = os.getenv 'OPENROUTER_MODEL' or 'mistralai/devstral-small-2505'
    local fallback_model = 'meta-llama/llama-3-8b-instruct'

    if not os.getenv 'OPENAI_API_KEY' then
      vim.notify('❌ Falta OPENAI_API_KEY. Asegúrate de definirla en .env.local', vim.log.levels.ERROR)
    end
    return {
      provider = 'openai',
      providers = {
        openai = {
          endpoint = 'https://openrouter.ai/api/v1/chat/completions',
          model = primary_model,
          timeout = 30000,
        },
      },

      -- fallback automático si el modelo da error
      hooks = {
        on_response_error = function(err, context)
          if context.provider.name == 'openai' then
            vim.notify('⚠️ Devstral no respondió, cambiando a LLaMA3', vim.log.levels.WARN)
            context.provider.options.model = fallback_model
            return true -- reintentar con el nuevo modelo
          end
          return false
        end,
      },
    }
  end,
}
