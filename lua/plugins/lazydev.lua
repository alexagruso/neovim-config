-- loads lua libraries for neovim config
return {
  'folke/lazydev.nvim',
  ft = 'lua',
  opts = {
    library = {
      { path = '${3rd}/luv/library' },
      'lazy.nvim',
    },
  },
}
