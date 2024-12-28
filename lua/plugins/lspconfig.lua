return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'stylua',
        'lua-language-server',
      },
    }
  end,
}
