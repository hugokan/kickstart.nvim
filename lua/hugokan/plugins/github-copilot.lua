return {
  'github/copilot.vim',
  event = 'InsertEnter',
  config = function()
    -- Desactiva el mapeo por defecto de <Tab>
    vim.g.copilot_no_tab_map = true

    -- Usa <C-J> para aceptar la sugerencia de Copilot
    vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { expr = true, silent = true })

    -- Opcional: activa Copilot Chat si tienes acceso
    vim.g.copilot_chat_enabled = true
  end,
}
