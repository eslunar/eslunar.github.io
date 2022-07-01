function obj.on(event,func)
  return obj.attr("on"..event,func)
end
