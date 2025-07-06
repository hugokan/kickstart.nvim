return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 15,
        open_mapping = [[<C-t>]],
        direction = 'horizontal', -- o "vertical", "horizontal", "tab", "float"
        shade_terminals = true,
        start_in_insert = true,
        persist_mode = false,
      }
    end,
  },
}
