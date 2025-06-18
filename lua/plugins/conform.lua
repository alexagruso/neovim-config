return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      bash = { 'beautysh' },
      css = { 'prettierd' },
      go = { 'gofumpt' },
      html = { 'prettierd' },
      javascript = { 'prettierd' },
      json = { 'prettierd' },
      lua = { 'stylua' },
      php = { 'pretty-php' },
      python = { 'black' },
      scss = { 'prettierd' },
      typescript = { 'prettierd' },
      typst = { 'prettypst' },
    },
  },
}
