function table.at(a,b)
  local b=b or 1
  local count=1
  local val=nil
  
  for key, val in pairs(a)do
    print(count,key,val)
    count=count+1
    
  end
  
  return val
end
