function obj.css(prop,val)
  if type(prop)=="table" then
    table.each(prop,function(val,prop)obj.css(prop,val)end)
  elseif prop and val then
    obj.raw.style[prop]=val
  elseif prop and not val then
    return obj.raw.style[prop]
    else 
      return obj.raw.style
    end
  
  return obj
end
