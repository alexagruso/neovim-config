-- vim.fn.stdpath("data") gives "$home/.local/share/nvim"
local lazy_path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

-- if the lazy.nvim repo is not present, then we clone it
if not vim.uv.fs_stat(lazy_path) then
  local lazy_repo = 'https://github.com/folke/lazy.nvim.git'
  local git_output = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazy_repo, lazy_path }

  if vim.v.shell_error ~= 0 then
    -- something went wrong with cloning, so we notify and exit
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { git_output, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- allows require() to implicitly reference lazy_path
vim.opt.rtp:prepend(lazy_path)

require('lazy').setup {
  spec = {
    { import = 'plugins' },
  },
  install = { colorscheme = { 'habamax' } },
  checker = { enabled = false },
}
