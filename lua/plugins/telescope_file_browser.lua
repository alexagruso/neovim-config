return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    vim.keymap.set('n', '<leader>fb', vimcmd 'Telescope file_browser', { desc = '[F]ile [B]rowser' })
  end,
}
