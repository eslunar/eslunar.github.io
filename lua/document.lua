function app.node(str,css)
  local obj={}
  
  --set raw reference to element
  if type(str)=="string" then obj.raw=app.javascript:parseNode(str) else obj.raw=str.raw or str end
  
  --add children
  function obj.add(...)table.each({...},function(e)obj.raw:append(e.raw or e)end)return obj end
  
  --remove from parent or children
  function obj.remove(...)obj.raw:remove()return obj end
  
  --edit attributes
  function obj.attr(prop,val)if type(prop)=="table" then table.each(prop,function(val,prop)obj.attr(prop,val)end)elseif prop and val then if app.javascript:nodeAttr(obj.raw,prop) then obj.raw[prop]=val else obj.raw:setAttribute(prop,val) end elseif prop and not val then if app.javascript:nodeAttr(obj.raw,prop) then return obj.raw[prop] else return obj.raw:getAttribute(prop) end else  return obj.raw end return obj end
  
  --edit style
  function obj.css(prop,val)if type(prop)=="table" then table.each(prop,function(val,prop)obj.css(prop,val)end) elseif prop and val then obj.raw.style[prop]=val elseif prop and not val then return obj.raw.style[prop] else return obj.raw.style end return obj end
  
  --set get inner HTML
  function obj.html(...)local a,b,c={...},"",nil if #a~=0 then table.each(a,function(e)b=b..e;end) obj.raw.innerHTML=b return obj else return obj.raw.innerHTML end end
  
  --set get inner text
  function obj.text(...)local a,b,c={...},"",nil if #a~=0 then table.each(a,function(e)b=b..e;end) obj.raw.innerText=b return obj else return obj.raw.innerText end end
  
  --add event listener
  function obj.on(event,func)return obj.attr("on"..event,func)end
  
  
  --close doc
  return obj
end

