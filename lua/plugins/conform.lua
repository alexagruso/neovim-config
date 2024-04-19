--  TODO: research formatter plugins
return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      javascript = { 'prettierd' },
      json = { 'fixjson' },
      lua = { 'stylua' },
      rust = { 'rustfmt' },
      scss = { 'prettierd' },
      tex = { 'latexindent' },
      typescript = { 'prettierd' },
    },
  },
}
