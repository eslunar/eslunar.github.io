function table.filter(a,b)
  local c=table.assign({},a)
  table.each(c,function(val,key)if not b(val,key) then c[key]=nil end end)
  table._h.rn(c)
  return c
end
