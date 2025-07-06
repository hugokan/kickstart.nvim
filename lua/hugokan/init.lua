vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.keymap.set('n', '<C-e>', ':Neotree<CR>', { noremap = true, silent = true, desc = 'Open N[e]otree' })
vim.keymap.set('i', '<C-e>', '<Esc>:w<CR>:Neotree<CR>', { noremap = true, silent = true, desc = 'Open N[e]otree' })
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true, desc = 'Open [G]it' })
vim.keymap.set('n', '<C-p>', ':bp<CR>', { noremap = true, silent = true, desc = '[P]revius file' })

vim.keymap.set('n', '<C-s>', function()
  vim.lsp.buf.format()
  vim.cmd.w()
end, { desc = '[S]ave file' })

vim.keymap.set('i', '<C-s>', function()
  vim.lsp.buf.format()
  vim.cmd.w()
end, { desc = '[S]ave file' })

vim.keymap.set('n', '<leader>saa', '<Cmd>lua ActiveShort()<CR>', { desc = '[S]hort [A]ctive' })
vim.keymap.set('n', '<leader>sad', '<Cmd>lua DesactiveShort()<CR>', { desc = '[S]hort [D]esactive' })

function ActiveShort()
  vim.opt.number = false
  vim.opt.relativenumber = false
end

function DesactiveShort()
  vim.opt.number = true
  vim.opt.relativenumber = true
end

vim.defer_fn(function()
  local ok, term_module = pcall(require, 'toggleterm.terminal')
  if not ok then
    return
  end

  local Terminal = term_module.Terminal

  local term1 = Terminal:new { direction = 'horizontal', hidden = true, count = 1 }
  local term2 = Terminal:new { direction = 'horizontal', hidden = true, count = 2 }
  local horiz_term = Terminal:new { direction = 'horizontal', hidden = true, count = 3 }
  local vert_term = Terminal:new { direction = 'vertical', hidden = true, count = 4 }
  local float_term = Terminal:new { direction = 'float', hidden = true, count = 5 }

  vim.keymap.set('n', '<leader>tn', function()
    vim.cmd 'vsplit' -- divide la ventana en 2 columnas
    vim.cmd 'wincmd l' -- moverse al nuevo split (derecha)

    -- Creamos una nueva terminal independiente
    local new_term = Terminal:new {
      direction = 'vertical',
      hidden = true,
    }

    -- Abrimos en la ventana actual
    new_term:open()
  end, { desc = 'Abrir nueva terminal en split vertical' })
  vim.keymap.set('n', '<leader>tt', function()
    term1:open()
    vim.cmd 'enew'
    vim.cmd 'vsplit'
    vim.cmd 'wincmd l'
    term2:open()
  end, { desc = 'Abrir 2 terminales lado a lado' })

  vim.keymap.set('n', '<leader>th', function()
    horiz_term:toggle()
  end, { desc = 'Abrir terminal horizontal' })

  vim.keymap.set('n', '<leader>tv', function()
    vert_term:toggle()
  end, { desc = 'Abrir terminal vertical' })

  vim.keymap.set('n', '<leader>tf', function()
    float_term:toggle()
  end, { desc = 'Abrir terminal flotante' })

  vim.keymap.set('n', '<leader>tc', function()
    term1:close()
    term2:close()
    horiz_term:close()
    vert_term:close()
    float_term:close()
  end, { desc = 'Cerrar todas las terminales' })

  vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Salir del modo terminal' })
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = 'Mover izquierda' })
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = 'Mover derecha' })
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = 'Mover abajo' })
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = 'Mover arriba' })
end, 100)
