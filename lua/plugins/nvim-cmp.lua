return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        return 'make install_jsregexp'
      end)(),
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'SirVer/ultisnips',
  },
  config = function()
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    local ultisnips = require 'cmp_nvim_ultisnips'
    local ultisnips_mappings = require 'cmp_nvim_ultisnips.mappings'

    ultisnips.setup {}

    vim.g.UltiSnipsExpandTrigger = '<tab>'
    vim.g.UltiSnipsForwardTrigger = '<C-j>'
    vim.g.UltiSnipsBackwardTrigger = '<C-k>'

    cmp.setup {
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'ultisnips' },
        { name = 'path' },
        { name = 'buffer' },
      },
      snippet = {
        expand = function(args)
          vim.fn['UltiSnips#Anon'](args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {},

        ['<C-l>'] = cmp.mapping(function(fallback)
          ultisnips_mappings.expand_or_jump_forwards(fallback)
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function(fallback)
          ultisnips_mappings.jump_backwards(fallback)
        end, { 'i', 's' }),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    }

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
