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
