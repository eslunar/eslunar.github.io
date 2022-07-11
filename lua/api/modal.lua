--remove latest modal on physical back pressed--
app.javascript:addEventListener("popstate",function()
  local el=document.query({type="modal",position="last"})
  if el then el.remove() end
end)

return function(inner,css)
  local obj=document.create("<modal style=background:#00000025;top:0;left:0;bottom:0;right:0;z-index:3;position:fixed;display:flex;align-items:center;align-content:center;justify-content:center ></modal>")
  obj.css(css or {})
  --modal escape--
  obj.raw:addEventListener("click",function(n,e)
    if e.target==obj.raw then app.javascript.history:back() end
  end)
  if type(inner)=="string" then
    obj.html(inner)
  else obj.add(inner) end
  
  obj.open=function()
    document.add(obj)
    app.javascript.history:pushState(math.random(1,9999999),null,app.javascript.location.href)
    return obj
  end
  
  obj.close=function()
    app.javascript.history:back()
    return obj
  end
  
  
  return obj
  
end
