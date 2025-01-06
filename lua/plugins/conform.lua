return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      css = { 'prettierd' },
      go = { 'gofumpt' },
      html = { 'prettierd' },
      javascript = { 'prettierd' },
      json = { 'prettierd' },
      lua = { 'stylua' },
      python = { 'black' },
      scss = { 'prettierd' },
      typescript = { 'prettierd' },
    },
  },
}
