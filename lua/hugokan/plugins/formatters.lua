return {
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local null_ls = require 'null-ls'

      -- Auto fallback: eslint_d si está disponible, sino eslint
      local diagnostics = vim.fn.executable 'eslint_d' == 1 and null_ls.builtins.diagnostics.eslint_d or null_ls.builtins.diagnostics.eslint

      local code_actions = vim.fn.executable 'eslint_d' == 1 and null_ls.builtins.code_actions.eslint_d or null_ls.builtins.code_actions.eslint

      null_ls.setup {
        sources = {
          -- Diagnóstico y acciones ESLint (con fallback automático)
          diagnostics,
          code_actions,

          -- Formateo con Prettier
          null_ls.builtins.formatting.prettier.with {
            filetypes = {
              'javascript',
              'typescript',
              'html',
              'css',
              'json',
              'yaml',
              'markdown',
              'scss',
            },
          },
        },

        -- Autoformato al guardar
        on_attach = function(client, bufnr)
          if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { bufnr = bufnr }
              end,
            })
          end
        end,
      }
    end,
  },
}
