function obj.add(...)
  table.each({...},function(e)obj.raw:append(e.raw or e)end)
  return obj
end
