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

        lsp_keymap('gd', require('telescope.builtin').lsp_definitions, '[g]oto [d]efinition')
        lsp_keymap('gD', vim.diagnostic.open_float, '[g]oto [D]iagnostic')
        lsp_keymap('grf', require('telescope.builtin').lsp_references, '[g]oto [r]e[f]erences')
        lsp_keymap('gI', require('telescope.builtin').lsp_implementations, '[g]oto [I]mplementation')
        lsp_keymap('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- List of supported language servers
    local language_servers = {
      bashls = {},
      cssls = {},
      html = {},
      intelephense = {},
      jsonls = {},
      lua_ls = {},
      pylsp = {},
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
      'beautysh',
      'black',
      'clang-format',
      'fixjson',
      'gofumpt',
      'latexindent',
      'prettierd',
      'pretty-php',
      'stylua',
      'xmlformatter',
    }

    require('mason-tool-installer').setup {
      ensure_installed = vim.list_extend(vim.tbl_keys(language_servers), formatters),
    }
  end,
}
