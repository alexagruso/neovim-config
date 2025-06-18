require 'utils'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

Map('n', '<C-h>', Vimcmd 'wincmd h', { desc = 'Move buffer focus up' })
Map('n', '<C-j>', Vimcmd 'wincmd j', { desc = 'Move buffer focus left' })
Map('n', '<C-k>', Vimcmd 'wincmd k', { desc = 'Move buffer focus right' })
Map('n', '<C-l>', Vimcmd 'wincmd l', { desc = 'Move buffer focus down' })

Map('n', '<esc>', Vimcmd 'nohlsearch', { desc = 'Disable search highlighting' })
