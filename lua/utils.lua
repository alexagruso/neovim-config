function Vimcmd(command)
  return '<cmd>' .. command .. '<cr>'
end

Map = vim.keymap.set
