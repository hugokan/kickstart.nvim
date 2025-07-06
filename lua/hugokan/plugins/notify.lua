return {
  'rcarriga/nvim-notify',
  lazy = false,
  config = function()
    local notify = require 'notify'

    notify.setup {
      stages = 'fade_in_slide_out',
      timeout = 3000,
      render = 'default',
      background_colour = '#1e1e2e',
      icons = {
        ERROR = '',
        WARN = '',
        INFO = '',
        DEBUG = '',
        TRACE = '✎',
      },
    }

    -- Reemplaza vim.notify globalmente
    vim.notify = notify
  end,
}
