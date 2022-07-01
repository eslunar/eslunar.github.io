function table.length(a,ip)
  local count = 0
  
     if ip then for val in pairs(a)do count=count+1 end else for key, val in pairs(a)do if type(key)=="number" then count=count+1 end end end
       
  return count
end
