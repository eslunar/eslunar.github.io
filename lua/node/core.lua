app.raw_node={}

function app.node(str,css)
  local obj=table.clone({},app.raw_node)
  
  --set raw reference to element
  if type(str)=="string" then obj.raw=app.javascript:parseNode(str) else obj.raw=str.raw or str end
    
    
-- kept open for members, closes at close.lua
