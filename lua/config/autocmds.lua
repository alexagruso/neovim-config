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
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Disable spell check when entering terminal mode',
  callback = function()
    vim.opt_local.spell = false
  end,
})
