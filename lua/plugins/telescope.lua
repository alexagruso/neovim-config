require 'utils'

return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    vim.keymap.set('n', '<leader>ff', vimcmd 'Telescope find_files', { desc = '[F]ile [F]inder' })
    vim.keymap.set('n', '<leader>fg', vimcmd 'Telescope live_grep', { desc = '[F]ile [G]rep' })
    vim.keymap.set('n', '<leader>fh', vimcmd 'Telescope help_tags', { desc = '[H]elp tags' })
  end,
}
