function obj.html(...)
  local a={...}
  local b=""
  local c=nil
  if #a~=0 then
    table.each(a,function(e)b=b..e;end)
    obj.raw.innerHTML=b
    return obj
  else return obj.raw.innerHTML end
end
