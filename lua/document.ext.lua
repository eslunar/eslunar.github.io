app.cssClass={__call=function(self,val)if type(val)=="string"then return self[val]()else table.each(val or {},function(e)self[e.key]=e.value end)end;return self end,__newindex=function(self,key,val)app.javascript:nodeCSS(self.raw,key,val)return self end,__index=function(self,key)return function(self,val)if val then app.javascript:nodeCSS(self.raw,key,val) else return app.javascript:nodeCSS(self.raw,key) end return self end end}

--css bind--
function app.cssClass.create(el)
  local ins={}
  ins.raw=el.raw or el
  ins.el=el
  setmetatable(ins,app.cssClass)
  return ins
end


app.attrClass={__call=function(self,val)if type(val)=="string"then return self[val]()else table.each(val or {},function(e)self[e.key]=e.value end)end;return self end,__newindex=function(self,key,val)app.javascript:nodeAttr(self.raw,key,val)return self end,__index=function(self,key)return function(self,val)if val then app.javascript:nodeAttr(self.raw,key,val) else return app.javascript:nodeAttr(self.raw,key) end return self end end}

--css bind--
function app.attrClass.create(el)
  local ins={}
  ins.raw=el.raw or el
  ins.el=el
  setmetatable(ins,app.attrClass)
  return ins
end
