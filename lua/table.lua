table._h={}

--get numbers from table
function table._h.numbers(t)local num={} for key,val in pairs(t)do if type(key)=="number" then num[key]=val end end return num end

--get strings
function table._h.strings(t) local str={} for key,val in pairs(t)do if type(key)=="string" then str[key]=val end end return str end

--get largest key
function table._h.ln(t)
  local ln=0
  for key,val in pairs(t)do if type(key)=="number" and ln < key then ln=key end end
  return ln
end

--reorder numbers
function table._h.rn(t)
  local re={}
  local en=1
  local it=1
  local ln=table._h.ln(t)
  
  while it<ln+1 do
    if t[it] then re[en]=t[it] en=en+1 t[it]=nil end
    it=it+1
  end
  
  
  en=1
  it=table._h.ln(re)
  while en<it+1 do
    t[en]=re[en]
    en=en+1
  end
  
  return t
end


--custom iterator
function table._h.iterator(t,func,str)
  table._h.rn(t)
  local ln=table._h.ln(t)
  local en=1
  
  while en<ln+1 do
    func(en,t[en])
    en=en+1
  end
  
  if str then for key,val in pairs(t)do
    if type(key)~="number" then func(key,val) end
  end end
end

function table.assign(a,b)
  table.each(b,function(val,key)a[key]=val;end)
  return a
end

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

function table.clone(a,b)
  local a=a or {}
  for key,val in pairs(b) do
    if type(val)=="table" then table.clone(a[key],val)
      else a[key]=val
    end
  end
  return a
end

function table.each(a,b)
  table._h.iterator(a,function(key,val)b(val,key)end,true)
  return a
end

function table.filter(a,b)
  local c=table.assign({},a)
  table.each(c,function(val,key)if not b(val,key) then c[key]=nil end end)
  table._h.rn(c)
  return c
end

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

function table.length(a,ip)
  local count = 0
  
     if ip then for val in pairs(a)do count=count+1 end else for key, val in pairs(a)do if type(key)=="number" then count=count+1 end end end
       
  return count
end

function table.map(a,b)
  local c={}
  table.each(a,function(val,key)c[key]=b(val,key) or val end)
  return c
end
