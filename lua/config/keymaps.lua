require 'utils'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<C-h>', vimcmd 'wincmd h', { desc = 'Move buffer focus up' })
vim.keymap.set('n', '<C-j>', vimcmd 'wincmd j', { desc = 'Move buffer focus left' })
vim.keymap.set('n', '<C-k>', vimcmd 'wincmd k', { desc = 'Move buffer focus right' })
vim.keymap.set('n', '<C-l>', vimcmd 'wincmd l', { desc = 'Move buffer focus down' })

vim.keymap.set('n', '<esc>', vimcmd 'nohlsearch', { desc = 'Disable search highlighting' })
