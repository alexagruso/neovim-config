require 'util'

vim.keymap.set('i', '<C-u>', unmap(), { desc = 'Unmap Ctrl + U' })

vim.keymap.set('n', '<leader>cfh', vimcmd 'e $MYVIMRC', { desc = 'Open [C]onfig [F]ile [H]ere' })
vim.keymap.set('n', '<leader>cft', vimcmd 'tabnew $MYVIMRC', { desc = 'Open [C]onfig [F]ile in new [T]ab' })
vim.keymap.set('n', '<leader>cfx', vimcmd 'split $MYVIMRC', { desc = 'Open [C]onfig [F]ile in split' })
vim.keymap.set('n', '<leader>cfv', vimcmd 'vsplit $MYVIMRC', { desc = 'Open [C]onfig [F]ile in [V]split' })
vim.keymap.set('n', '<leader>cs', vimcmd 'source $MYVIMRC', { desc = 'Source [C]onfig File' })

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', vimcmd 'nohlsearch')

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>th', vimcmd 'terminal' .. 'A', { desc = 'Open [T]erminal [H]ere' })
vim.keymap.set('n', '<leader>tt', vimcmd 'tabnew' .. vimcmd 'terminal' .. 'A', { desc = 'Open [T]erminal in new [T]ab' })
vim.keymap.set('n', '<leader>tx', vimcmd 'split' .. vimcmd 'terminal' .. 'A', { desc = 'Open [T]erminal in split' })
vim.keymap.set('n', '<leader>tv', vimcmd 'vsplit' .. vimcmd 'terminal' .. 'A', { desc = 'Open [T]erminal in [V]split' })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>' .. vimcmd 'q' .. vimcmd 'FloatermKill', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>fb', vimcmd 'Telescope file_browser', { desc = 'Open Telescope [F]ile [B]rowser' })
vim.keymap.set('n', '<leader>ga', vimcmd 'tabnew', { desc = 'Create new tab' })

vim.keymap.set('n', '<leader>dc', vimcmd 'TroubleClose', { desc = '[C]lose Trouble' })
vim.keymap.set('n', '<leader>dd', vimcmd 'TroubleToggle', { desc = '[D]ocument [D]iagnostics' })
vim.keymap.set('n', '<leader>dt', vimcmd 'TodoTrouble', { desc = '[D]ocument [T]asks' })

vim.keymap.set('n', 'f', vimcmd 'HopWord', { desc = 'Hop' })
