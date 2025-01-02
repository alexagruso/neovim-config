return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {
      'css',
      'html',
      'javascript',
      'lua',
      'scss',
      'svelte',
      'typescript',
    },
    auto_install = true,
    highlight = { enable = true },
  },
}
