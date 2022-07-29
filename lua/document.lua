app.nodeClass={} -- node class
__nodeMeta={__index=app.nodeClass} -- node meta instance
  -- create a new object --
function app.nodeClass.create(node,opts)
  node=node or "<div>"
  local ins={}
  -- create html element or bind existing --
  if type(node)=="string" then ins.raw=app.javascript:parseNode(node)else ins.raw=node.raw or node end
  
  --set css n attr binds--
  ins.css=app.cssClass.create(ins)
  ins.attr=app.attrClass.create(ins)
  setmetatable(ins,__nodeMeta)
  return ins
end

  --add children
  function app.nodeClass:add(...)table.each({...},function(e)self.raw:append(e.value.raw or e.value)end)return self end
  --remove from parent or children
  function app.nodeClass:remove(...)self.raw:remove()return self end
  
  --edit attributes
  function app.nodeClass:attr(prop,val)if type(prop)=="table" then table.each(prop,function(e)self:attr(e.key,e.value)end)elseif prop and val then app.javascript:nodeAttr(self.raw,prop,val) else return app.javascript:nodeAttr(self.raw,prop) end return self end
  
  --edit style
  function app.nodeClass:css(prop,val)if type(prop)=="table" then table.each(prop,function(e)self:css(e.key,e.value)end)elseif prop and val then app.javascript:nodeCSS(self.raw,prop,val) else return app.javascript:nodeCSS(self.raw,prop) end return self end
  
  --set get inner HTML
  function app.nodeClass:html(...)local a,b,c={...},"",nil if #a~=0 then table.each(a,function(e)b=b..e.value;end) self.raw.innerHTML=b return self else return self.raw.innerHTML end end
  
  --set get inner text
  function app.nodeClass:text(...)local a,b,c={...},"",nil if #a~=0 then table.each(a,function(e)b=b..e.value;end) self.raw.innerText=b return self else return self.raw.innerText end end
  
  --add event listener
  function app.nodeClass:on(event,func)self.raw:addEventListener(event,function(e,x,y,z)func(x,y,z);end)
    return self
    end
  
  
  --get children
  
  function app.nodeClass:children(deep)local function parse(arr)return table.map(table.fromArray(arr),function(e)return app.nodeClass.create(e.value)end) end;if deep then return parse(self.raw:querySelectorAll("*")) else return parse(self.raw.children) end end
  
  
  --query elements--
  function app.nodeClass:query(queer)
    return _query(self:children(true),queer or {})[1]
  end
  
  function app.nodeClass:queryAll(queer)
      return _query(self:children(true),queer or {})
  end
  
  --parent
  function app.nodeClass:parent()if type(self.raw.parentNode)~="null"  then return app.nodeClass.create(self.raw.parentNode)else return nil end end