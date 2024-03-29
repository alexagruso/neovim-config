return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'codedark',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename', 'filetype' },
        lualine_x = { 'searchcount' },
        lualine_y = { 'encoding' },
        lualine_z = { 'location' },
      },
    }
  end,
}
