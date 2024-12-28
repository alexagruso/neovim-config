return {
  'smoka7/hop.nvim',
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
  config = function()
    local hop = require 'hop'
    hop.setup()

    vim.keymap.set('n', 'f', function()
      vim.cmd 'HopWord'
    end, { desc = 'Hop to any word', remap = true })

    vim.keymap.set('n', 'F', function()
      vim.cmd 'HopWordMW'
    end, { desc = 'Hop to any visible buffer', remap = true })
  end,
}
