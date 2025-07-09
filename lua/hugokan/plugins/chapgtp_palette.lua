return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'jackMort/ChatGPT.nvim' },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'
    local action_state = require 'telescope.actions.state'

    local commands = {
      { name = '🤖 Abrir ChatGPT', cmd = ':ChatGPT' },
      { name = '✍️ Editar con instrucciones (Visual)', cmd = ':ChatGPTEditWithInstruction' },
      { name = '🎭 Actuar como...', cmd = ':ChatGPTActAs' },
      { name = '🧠 Generar docstring', cmd = ':ChatGPTRun docstring' },
      { name = '🔧 Optimizar código', cmd = ':ChatGPTRun optimize_code' },
      { name = '🐛 Corregir errores', cmd = ':ChatGPTRun fix_bugs' },
    }

    local function run_command_picker()
      telescope.pickers
        .new({}, {
          prompt_title = '🎯 Acciones IA',
          finder = telescope.finders.new_table {
            results = commands,
            entry_maker = function(entry)
              return {
                value = entry,
                display = entry.name,
                ordinal = entry.name,
              }
            end,
          },
          sorter = telescope.config.values.generic_sorter(),
          attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              vim.cmd(selection.value.cmd)
            end)
            return true
          end,
        })
        :find()
    end

    -- Atajo de teclado: <leader>sp
    local wk = require 'which-key'
    wk.register({
      s = {
        p = { run_command_picker, '🎯 Paleta de comandos IA' },
      },
    }, { prefix = '<leader>' })
  end,
}
