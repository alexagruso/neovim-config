return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
    },
  },
  config = function()
    vim.api.nvim_create_autocmd('BufWritePre', {
      desc = 'Run conform.nvim formatter for current buffer on save',
      callback = function(args)
        require('conform').format { bufnr = args.buf }
      end,
    })
  end,
}
