function requireFactory(scope)
 return function(path)
   
   path=app.javascript:parsepath(scope,path)
  
  local result={}
  local cr=coroutine.running()
  local request=app.javascript:request(path)
  
  request["then"](request,function(x,e)result=e;coroutine.resume(cr)end)
  
  
  coroutine.yield()
  if result.error then console.error("Error: couldn't load "..path.." "..result.error) return nil end
  local module,err=load("local module={};module.path=\""..path.."\";local require=requireFactory(module.path); "..result.text)
  
  if err then print(err,type(err)) return nil end
  
  return module(path)
 end
end


