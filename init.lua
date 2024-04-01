--  TODO: vim debugger (vimspector and codelldb configs)

vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.vsnip_snippet_dir = '~/.config/nvim/snippets'

vim.g.material_style = 'deep ocean'

--  TODO: find a place for this
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim.opt
require 'options'

-- vim.keymap
require 'keymaps'

-- Ensure lazy.nvim is installed
require 'lazy-bootstrap'

-- Load lazy plugins
require 'plugins'
