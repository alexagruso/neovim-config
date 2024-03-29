return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {},
  config = function()
    local Rule = require 'nvim-autopairs.rule'
    local npairs = require 'nvim-autopairs'

    npairs.setup {
      check_ts = true,
    }

    npairs.add_rules {
      Rule('\\(', '\\)', 'tex'),
      Rule('\\[', '\\]', 'tex'),
      Rule('$', '$', 'tex'),
      Rule('$$', '$$', 'tex'),
    }
  end,
}
