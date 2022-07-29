--return largest key interger--
function __largest_num(tab)local ln=0 for key,val in pairs(tab)do if type(key)=="number"then ln=key>ln and key or ln  end end return ln end


--push to table--
function __push_val(tab,val)tab[__largest_num(tab)+1]=val end

--order keys--
function __order_keys(tab)
  local ln=__largest_num(tab)
  local length=0
  local count=0
  local ta,tn,tl={},{},{}
  
  -- 1 divide and empty tab --
  for key,val in pairs(tab)do
    if type(key)=="number"then tn[key]=val;tab[key]=nil else tl[key]=val;tab[key]=nil end
  end
  
  -- 2 order numbers and push to tab --
  while count~=(ln+1) do
    if tn[count] then __push_val(tab,tn[count]) length=length+1 end count=count+1
  end
  
  -- 3 add non-numerical keys --
  for key,val in pairs(tl)do length=length+1 tab[key]=val end
  
  return tab,length
end

--iterate over tables--
function __iterator(tab,func)
  local x,length=__order_keys(tab)
  local ln=__largest_num(tab)
  local count=0
  while count~=(ln+1) do
    if tab[count] then func({key=count,value=tab[count],largest_num=ln,length=length,table=tab}) end
    count=count+1
  end
  
  for key,val in pairs(tab)do
    if type(key)~="number" then func({key=key,value=val,largest_num=ln,length=length,table=tab})end
  end
end

function table.each(tab,func)
  __iterator(tab,func)
  return tab
end

function table.assign(tab,...)
  local o=__order_keys({...})
  table.each(o,function(e)
    table.each(e.value,function(x)
      tab[x.key]=x.value
      end)
    end)
  return __order_keys(tab)
end

function table.clone(tab)
  local o={}
  table.each(tab,function(e)
    if type(e.value)=="table" then
      o[e.key]=table.clone(e.value)
    else o[e.key]=e.value end
    end)
  return o end

function table.filter(tab,func,assign)
  return table.each(assign and table.assign({},tab) or tab,function(e)if func(e)==false then e.table[e.key]=nil end end)end

function table.map(tab,func) local o={} table.each(tab,function(e)o[e.key]=func(e) end) return o end

function table.fromArray(arr)
  local tab={}
  local ln=arr.length
  local count=0
  while count~=(ln+1)do
    tab[count]=arr[count]
    count=count+1
  end
  return tab
end