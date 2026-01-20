function Vimcmd(command)
  return '<cmd>' .. command .. '<cr>'
end

function DumpTable(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then
        k = '"' .. k .. '"'
      end
      s = s .. '[' .. k .. '] = ' .. DumpTable(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end
