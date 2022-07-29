local modal=require"modal"
local json=require"json"
local lo=app.javascript.location


return function(manifest)
  app.javascript.sessionStorage.manifest=json.encode(manifest or {main="/index"})
  local obj=modal("")
  obj.frame=document.create("<iframe style=width:100%;height:100%;border:0 ></iframe>")
  obj.frame.attr({src=lo.origin..lo.pathname.."?"..math.random(1,999999)})
  obj.add(obj.frame)
  return obj
end
