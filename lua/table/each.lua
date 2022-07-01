function table.each(a,b)
  table._h.iterator(a,function(key,val)b(val,key)end,true)
  return a
end
