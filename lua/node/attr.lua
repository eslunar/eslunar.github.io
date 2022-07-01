function obj.attr(prop,val)
  if type(prop)=="table" then
    table.each(prop,function(val,prop)obj.attr(prop,val)end)
  elseif prop and val then
    if app.javascript:nodeAttr(obj.raw,prop) then
      obj.raw[prop]=val else obj.raw:setAttribute(prop,val) end
  elseif prop and not val then
        if app.javascript:nodeAttr(obj.raw,prop) then
          return obj.raw[prop] else return obj.raw:getAttribute(prop) end
    else 
      return obj.raw
    end
  
  return obj
end

