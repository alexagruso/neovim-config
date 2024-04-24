return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-path',
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      build = 'make install_jsregexp',
    },
  },
  config = function()
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'

    cmp.setup {
      -- entries from these sources will show up in the completion menu
      sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
        { name = 'buffer' },
      },

      -- snippet engine
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },

      -- completion menu behaviour
      -- see :h 'completeopt'
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- completion menu keybinds
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {},

        ['<C-l>'] = cmp.mapping(function(_)
          --  TODO: setup snippets
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function(_)
          --  TODO: setup snippets
        end, { 'i', 's' }),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    }

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    --  TODO: move these into separate config for luasnips
    local snippets = require 'luasnip.loaders.from_vscode'
    snippets.lazy_load { paths = { '../../snippets/cpp.json' } }
    snippets.lazy_load { paths = { '../../snippets/svelte.json' } }
  end,
}
