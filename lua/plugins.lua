require('lazy').setup {
  -- Shortcut for commenting out current selection
  require 'plugins/comment',

  -- Allows formatting based on file type
  require 'plugins/conform',

  -- Floating terminal
  require 'plugins/floaterm',

  -- Displays git status symbols in the gutter
  require 'plugins/gitsigns',

  -- Code navigation tool
  require 'plugins/hop',

  -- Status bar
  require 'plugins/lualine',

  -- Material theme with treesitter support
  require 'plugins/material',

  --  TODO: figure out what this plugin does
  require 'plugins/mini',

  -- Automatically closes pairs with treesitter support
  require 'plugins/nvim-autopairs',

  -- Completion engine
  require 'plugins/nvim-cmp',

  -- Language server compatibility
  require 'plugins/nvim-lspconfig',

  -- Better code syntax
  require 'plugins/nvim-treesitter',

  --  TODO: figure out what this plugin does
  require 'plugins/rust-tools',

  -- Various search tools
  require 'plugins/telescope',

  -- Telescope file browser plugin
  require 'plugins/telescope-file-browser',

  -- Highlights various comment labels
  require 'plugins/todo-comments',

  -- Code error and warning aggregator
  require 'plugins/trouble',

  -- Latex workspace plugin
  require 'plugins/vimtex',

  -- Determines whether to expand tabs in the current file
  require 'plugins/vim-sleuth',

  -- Displays menu with named keymaps
  require 'plugins/which-key',
}
