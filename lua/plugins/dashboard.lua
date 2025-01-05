return {
  'nvimdev/dashboard-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      shortcut_type = 'number',
      config = {
        header = {
          '',
          '██\\   ██\\ ████████\\  ██████\\  ██\\    ██\\ ██████\\ ██\\      ██\\ ',
          '███\\  ██ |██  _____|██  __██\\ ██ |   ██ |\\_██  _|███\\    ███ |',
          '████\\ ██ |██ |      ██ /  ██ |██ |   ██ |  ██ |  ████\\  ████ |',
          '██ ██\\██ |█████\\    ██ |  ██ |\\██\\  ██  |  ██ |  ██\\██\\██ ██ |',
          '██ \\████ |██  __|   ██ |  ██ | \\██\\██  /   ██ |  ██ \\███  ██ |',
          '██ |\\███ |██ |      ██ |  ██ |  \\███  /    ██ |  ██ |\\█  /██ |',
          '██ | \\██ |████████\\  ██████  |   \\█  /   ██████\\ ██ | \\_/ ██ |',
          '\\__|  \\__|\\________| \\______/     \\_/    \\______|\\__|     \\__|',
        },
        -- leading space required for labels due to shitty plugin
        project = {
          enable = true,
          limit = 10,
          icon = '',
          label = ' Recent Projects',
          action = 'Telescope find_files cwd=',
        },
        mru = {
          enable = true,
          limit = 10,
          icon = '',
          label = ' Recent Files',
          cwd_only = false,
        },
        shortcut = {}, -- removes default shortcuts
        footer = {},
      },
    }
  end,
}
