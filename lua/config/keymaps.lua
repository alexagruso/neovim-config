require 'utils'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<C-h>', Vimcmd 'wincmd h', { desc = 'Move buffer focus up' })
vim.keymap.set('n', '<C-j>', Vimcmd 'wincmd j', { desc = 'Move buffer focus left' })
vim.keymap.set('n', '<C-k>', Vimcmd 'wincmd k', { desc = 'Move buffer focus right' })
vim.keymap.set('n', '<C-l>', Vimcmd 'wincmd l', { desc = 'Move buffer focus down' })

vim.keymap.set('n', '<esc>', Vimcmd 'nohlsearch', { desc = 'Disable search highlighting' })
