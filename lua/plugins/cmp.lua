return {
  'saghen/blink.cmp',
  version = '1.*',
  dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    snippets = { preset = 'luasnip' },
    sources = { default = { 'lsp', 'snippets' } },
    completion = {
      ghost_text = { enabled = true },
      menu = {},
    },
  },
}
