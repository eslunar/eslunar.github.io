function table.clone(a,b)
  local a=a or {}
  for key,val in pairs(b) do
    if type(val)=="table" then table.clone(a[key],val)
      else a[key]=val
    end
  end
  return a
end
