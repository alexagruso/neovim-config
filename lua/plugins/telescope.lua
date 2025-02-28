require 'utils'

return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    vim.keymap.set('n', '<leader>sb', Vimcmd 'Telescope buffers', { desc = '[s]earch [b]uffers' })
    vim.keymap.set('n', '<leader>sd', Vimcmd 'Telescope diagnostics', { desc = '[s]earch [d]iagnostics' })
    vim.keymap.set('n', '<leader>sf', Vimcmd 'Telescope find_files', { desc = '[s]earch [f]iles' })
    vim.keymap.set('n', '<leader>sg', Vimcmd 'Telescope live_grep', { desc = '[s]earch with [g]rep' })
    vim.keymap.set('n', '<leader>sh', Vimcmd 'Telescope help_tags', { desc = '[s]earch [h]elp tags' })
  end,
}
