function obj.text(...)
  local a={...}
  local b=""
  local c=nil
  if #a~=0 then
    table.each(a,function(e)b=b..e;end)
    obj.raw.innerText=b
    return obj
  else return obj.raw.innerText end
end
