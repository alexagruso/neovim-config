return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      dependencies = {
        'stevearc/dressing.nvim',
      },
      config = true,
    },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = false }),
      callback = function(event)
        local lsp_keymap = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        lsp_keymap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        lsp_keymap('grf', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        lsp_keymap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        lsp_keymap('<leader>rn', vim.lsp.buf.rename, '[R]e[N]ame')
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local language_servers = {
      jsonls = {},
      lua_ls = {},
      rust_analyzer = {},
      svelte = {},
      texlab = {},
      ts_ls = {},
    }

    require('mason-lspconfig').setup {
      automatic_installation = true,
      ensure_installed = {}, -- mason-tool-installer can handle any mason package
      handlers = {
        function(server_name)
          local server = language_servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    local formatters = {
      'black',
      'latexindent',
      'prettierd',
      'stylua',
    }

    require('mason-tool-installer').setup {
      ensure_installed = vim.list_extend(vim.tbl_keys(language_servers), formatters),
    }
  end,
}
