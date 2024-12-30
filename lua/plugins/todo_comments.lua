return {
  'folke/todo-comments.nvim',
  event = { 'VimEnter' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {}, -- must include empty opts or highlighting doesn't work
}
