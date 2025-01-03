require 'utils'

return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    vim.keymap.set('n', '<leader>sb', Vimcmd 'Telescope buffers', { desc = '[S]earch [B]uffers' })
    vim.keymap.set('n', '<leader>sf', Vimcmd 'Telescope find_files', { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sg', Vimcmd 'Telescope live_grep', { desc = '[S]earch with [G]rep' })
    vim.keymap.set('n', '<leader>sh', Vimcmd 'Telescope help_tags', { desc = '[S]earch [H]elp tags' })
  end,
}
