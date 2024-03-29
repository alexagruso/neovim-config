-- wrap string in vim command characters
---@diagnostic disable-next-line lowercase-global
function vimcmd(command)
  return '<CMD>' .. command .. '<CR>'
end

-- switch between two colorschemes
---@diagnostic disable-next-line lowercase-global
function switchColorScheme()
  if vim.g.background == 'light' then
    vim.background = 'dark'
  else
    vim.background = 'light'
  end
end

-- unmap function
---@diagnostic disable-next-line lowercase-global
function unmap()
  return function() end
end

-- lazy plugin prefix
---@diagnostic disable-next-line lowercase-global
function lazyplug(plugin)
  return 'plugins/' .. plugin
end
