return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
      lsp = {
        progress = {
          enabled = true,
          format = 'lsp_progress',
          throttle = 1000 / 30,
        },
        signature = { enabled = true },
        message = { enabled = true },
      },
      views = {
        cmdline_popup = {
          border = { style = 'rounded' },
          position = { row = 5, col = '50%' },
          size = { width = 60, height = 'auto' },
        },
        popupmenu = {
          relative = 'editor',
          position = { row = 8, col = '50%' },
          size = { width = 60, height = 10 },
          border = { style = 'rounded' },
        },
      },
    }
  end,
}
