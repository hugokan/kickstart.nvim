return {
  'ellisonleao/dotenv.nvim',
  config = function()
    require('dotenv').setup {
      verbose = false,
      dotenv_path = vim.fn.stdpath 'config' .. '/.env.local',
    }
  end,
  lazy = false, -- lo cargamos al inicio
}
