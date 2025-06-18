--  NOTE: this has been replaced by typst-preview, kept for
--  backwards-compatibility
return {
  'lervag/vimtex',
  enable = false,
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = 'zathura'
  end,
}
