vim.g.mapleader = ' '
vim.g.maplocalleader = ' ' -- no use for this at the moment

-- TODO: move this to telescope config
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = '[F]ile [F]inder' })

vim.keymap.set('n', '<C-h>', '<cmd>wincmd h<CR>')
vim.keymap.set('n', '<C-j>', '<cmd>wincmd j<CR>')
vim.keymap.set('n', '<C-k>', '<cmd>wincmd k<CR>')
vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<CR>')
