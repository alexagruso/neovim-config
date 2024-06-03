return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'onsails/lspkind.nvim',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp = require 'cmp'
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local globals = require 'globals'
    local lspkind = require 'lspkind'
    local luasnip = require 'luasnip'

    cmp.setup {
      -- completion menu behaviour
      -- see :h 'completeopt'
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- format the completion menu
      formatting = {
        format = lspkind.cmp_format {
          maxwidth = 50,

          before = function(_, vim_item)
            local truncated_entry = vim.fn.strcharpart(vim_item.abbr, 0, globals.MAX_MENU_ENTRY_LENGTH) .. '...'
            local truncated_type = vim.fn.strcharpart(vim_item.menu, 0, globals.MAX_MENU_TYPE_LENGTH) .. '...'

            if truncated_entry ~= vim_item.abbr then
              vim_item.abbr = truncated_entry .. '...'
            end

            if truncated_type ~= vim_item.menu then
              vim_item.menu = truncated_type .. '...'
            end

            return vim_item
          end,
        },
      },

      -- completion menu keybinds
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {},

        ['<C-l>'] = cmp.mapping(function(_)
          luasnip.jump(1)
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function(_)
          luasnip.jump(-1)
        end, { 'i', 's' }),
      },

      -- snippet engine
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },

      -- entries from these sources will show up in the completion menu
      sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
        { name = 'buffer' },
      },

      -- window settings
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    }

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
