return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<Space>t]],
      direction = 'horizontal',
      insert_mappings = false,
      terminal_mappings = false,
    }
  end,
}
