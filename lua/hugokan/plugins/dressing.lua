return {
  'stevearc/dressing.nvim',
  event = 'VeryLazy',
  opts = {
    input = {
      enabled = true,
      border = 'rounded',
    },
    select = {
      enabled = true,
      backend = { 'telescope', 'builtin' }, -- usa telescope si está instalado
    },
  },
}
