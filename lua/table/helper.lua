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


--[[
custom iterator

get largest number
while loop through all numbers

for loop over non numbers, exclude numbers


]]

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
