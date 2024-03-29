return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    --- @diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'c',
        'cpp',
        'html',
        'lua',
        'markdown',
        'vim',
        'vimdoc',
        'rust',
        'scss',
        'svelte',
        'toml',
        'typescript',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
    }
  end,
}
