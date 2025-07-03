-- vim.cmd 'colorscheme kanagawa-dragon'
-- require('kanagawa').load 'wave'
-- return { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 }

return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  config = function()
    require('kanagawa').setup {
      compile = false,
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = { bold = true },
      functionStyle = { bold = true },
      transparent = false,
      dimInactive = true,
      terminalColors = true,
      theme = 'wave', -- ⚠️ Aquí puedes cambiar "wave", "dragon", "lotus"
    }

    -- Carga el esquema de color seleccionado
    vim.cmd 'colorscheme kanagawa-wave'
  end,
}
