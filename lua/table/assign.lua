function table.assign(a,b)
  table.each(b,function(val,key)a[key]=val;end)
  return a
end
