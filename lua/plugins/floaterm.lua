return {
  'voldikss/vim-floaterm',
  config = function()
    vim.keymap.set('n', '<leader>ft', vimcmd 'FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish', { desc = '[F]loating [T]erminal' })
  end,
}
