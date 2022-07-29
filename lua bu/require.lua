function requireFactory(scope)
 return function(path,opt)
   opt=opt or {}
   
   if app.manifest.packages[path] then path=app.manifest.packages[path] else path=app.javascript:parsepath(scope,path,opt.type=="js"and".js"or nil) end
  
  local result={}
  local cr=coroutine.running()
  local request=app.javascript:request(path,true)
  
  request["then"](request,function(x,e)result=e;coroutine.resume(cr)end)
  
  
  coroutine.yield()
  
  --if fetch error--
  if result.error then app.javascript.console:error("Error: couldn't load "..path.." "..result.error) return nil
  --if require type javascript--
  elseif opt.type=="js"or opt.type=="javascript"then
  return luafy(app.javascript:eval('(function(){'..result.text..'})()') or nil)
  --default type lua--
  else local module,err=load("local module={};module.path=\""..path.."\";local require=requireFactory(module.path); "..result.text)
  
  if err then app.javascript.console:error("Syntax error in script "..path.." at line "..string.sub(err,61))return nil end
  
  local rv=nil
  local p,x=pcall(module)
  if p then return x else app.javascript.console:error("Runtime error in script "..path.." at line "..string.sub(x,61))return nil end
  end
  
  
  
 
  
end
end


function luafy(res)
  
  return res
end
