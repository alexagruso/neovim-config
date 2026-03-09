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
      -- TODO: figure this bullshit out
      wgsl_analyzer = {
        settings = {
          customImports = {
            ['bevy_pbr::clustered_forward'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_pbr/src/render/clustered_forward.wgsl',
            ['bevy_pbr::mesh_bindings'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_pbr/src/render/mesh_bindings.wgsl',
            ['bevy_pbr::mesh_functions'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_pbr/src/render/mesh_functions.wgsl',
            ['bevy_pbr::mesh_types'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_pbr/src/render/mesh_types.wgsl',
            ['bevy_pbr::mesh_vertex_output'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_pbr/src/render/mesh_vertex_output.wgsl',
            ['bevy_pbr::mesh_view_bindings'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_pbr/src/render/mesh_view_bindings.wgsl',
            ['bevy_pbr::mesh_view_types'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_pbr/src/render/mesh_view_types.wgsl',
            ['bevy_pbr::pbr_bindings'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_pbr/src/render/pbr_bindings.wgsl',
            ['bevy_pbr::pbr_functions'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_pbr/src/render/pbr_functions.wgsl',
            ['bevy_pbr::lighting'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_pbr/src/render/pbr_lighting.wgsl',
            ['bevy_pbr::pbr_types'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_pbr/src/render/pbr_types.wgsl',
            ['bevy_pbr::shadows'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_pbr/src/render/shadows.wgsl',
            ['bevy_pbr::skinning'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_pbr/src/render/skinning.wgsl',
            ['bevy_pbr::utils'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_pbr/src/render/utils.wgsl',
            ['bevy_sprite::mesh2d_bindings'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_sprite/src/mesh2d/mesh2d_bindings.wgsl',
            ['bevy_sprite::mesh2d_functions'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_sprite/src/mesh2d/mesh2d_functions.wgsl',
            ['bevy_sprite::mesh2d_types'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_sprite/src/mesh2d/mesh2d_types.wgsl',
            ['bevy_sprite::mesh2d_vertex_output'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_sprite/src/mesh2d/mesh2d_vertex_output.wgsl',
            ['bevy_sprite::mesh2d_view_bindings'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_sprite/src/mesh2d/mesh2d_view_bindings.wgsl',
            ['bevy_sprite::mesh2d_view_types'] = 'https://raw.githubusercontent.com/bevyengine/bevy/main/crates/bevy_sprite/src/mesh2d/mesh2d_view_types.wgsl',
          },
        },
      },
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
