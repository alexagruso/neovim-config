--  TODO: implement colorscheme switching
return {
  'marko-cerovac/material.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'material-deep-ocean'
  end,
}
