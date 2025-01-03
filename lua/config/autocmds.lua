vim.api.nvim_create_autocmd('InsertEnter', {
  desc = 'Disable relative number lines when entering insert mode',
  callback = function()
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
  desc = 'Enable relative number lines when exiting insert mode',
  callback = function()
    vim.opt.relativenumber = true
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight text when copying',
  callback = function()
    vim.highlight.on_yank()
  end,
})
