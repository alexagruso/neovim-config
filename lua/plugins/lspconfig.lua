return {
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      emmylua_ls = {},
      tinymist = {
        settings = {
          exportPdf = 'onSave',
          formatterMode = 'typstyle',
          lint = {
            enabled = true,
          },
        },
      },
      rust_analyzer = {
        settings = {
          ['rust-analyzer'] = {
            cargo = {
              features = 'all',
            },
          },
        },
      },
      wgsl_analyzer = {},
    },
  },
  dependencies = {
    'mason-org/mason.nvim',
    -- Required for mason language filter to work properly
    'stevearc/dressing.nvim',
    'nvim-telescope/telescope.nvim',
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
    'saghen/blink.cmp',
  },
  config = function(_, opts)
    require('mason').setup()

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = false }),
      callback = function(event)
        local lsp_keymap = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        lsp_keymap('gd', require('telescope.builtin').lsp_definitions, '[g]oto [d]efinition')
        lsp_keymap('gD', vim.diagnostic.open_float, '[g]oto [D]iagnostic')
        lsp_keymap('grf', require('telescope.builtin').lsp_references, '[g]oto [r]e[f]erences')
        lsp_keymap('gI', require('telescope.builtin').lsp_implementations, '[g]oto [I]mplementation')
        lsp_keymap('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
      end,
    })

    local blink = require 'blink.cmp'
    for server, config in pairs(opts.servers) do
      config.capabilities = blink.get_lsp_capabilities(config.capabilities)
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end,
}
