return {
  {
    'nvzone/typr',
    dependencies = { 'nvzone/volt' }, -- requerido por Typr
    cmd = { 'Typr', 'TyprStats' }, -- carga bajo demanda
    opts = {}, -- no hay opciones documentadas todavía
    keys = {
      { '<leader>tt', '<cmd>Typr<CR>', desc = 'Typr: abrir práctica' },
      { '<leader>tS', '<cmd>TyprStats<CR>', desc = 'Typr: estadísticas' },
    },
  },
}
