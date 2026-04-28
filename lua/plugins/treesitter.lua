return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local configs = require 'nvim-treesitter.configs'
    configs.setup {
      ensure_installed = {
        'css',
        'html',
        'javascript',
        'latex',
        'lua',
        'scss',
        'svelte',
        'typescript',
        'wgsl',
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
    }
  end,
}
