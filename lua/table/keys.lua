function table.keys(a,b)
  local a=a or {}
  local b=b or function()end
  local c={}
  local d=1
  for key,val in pairs(a) do
    print(key,val)
    c[d]=key
    d=d+1
  end
  
  b(c)
  return c
end
