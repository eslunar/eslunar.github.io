function table.map(a,b)
  local c={}
  table.each(a,function(val,key)c[key]=b(val,key) or val end)
  return c
end
