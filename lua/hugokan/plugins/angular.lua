return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local lspconfig = require 'lspconfig'
      local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      if ok then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'ts_ls', -- actualizado
          'html',
          'cssls',
          'jsonls',
          'emmet_ls',
          'angularls',
        },
      }

      lspconfig.ts_ls.setup { capabilities = capabilities }
      lspconfig.html.setup { capabilities = capabilities }
      lspconfig.cssls.setup { capabilities = capabilities }
      lspconfig.jsonls.setup { capabilities = capabilities }

      lspconfig.emmet_ls.setup {
        capabilities = capabilities,
        filetypes = {
          'html',
          'css',
          'scss',
          'javascript',
          'javascriptreact',
          'typescriptreact',
        },
      }

      lspconfig.angularls.setup {
        capabilities = capabilities,
        on_new_config = function(new_config, new_root_dir)
          new_config.cmd = {
            'ngserver',
            '--stdio',
            '--tsProbeLocations',
            new_root_dir,
            '--ngProbeLocations',
            new_root_dir,
          }
        end,
        filetypes = { 'typescript', 'html' },
        root_dir = lspconfig.util.root_pattern('angular.json', 'project.json'),
      }
    end,
  },
}
