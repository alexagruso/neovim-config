require 'utils'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<C-h>', vimcmd 'wincmd h')
vim.keymap.set('n', '<C-j>', vimcmd 'wincmd j')
vim.keymap.set('n', '<C-k>', vimcmd 'wincmd k')
vim.keymap.set('n', '<C-l>', vimcmd 'wincmd l')
