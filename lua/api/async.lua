return function(func)
  return function(...)
      local args=...
      local data=nil
      local cr=coroutine.running()
      local continue=function(e)
        data=e
        coroutine.resume(cr)
      end
      
      app.javascript:setTimeout(function()func(continue,args)end,0)
      coroutine.yield("xxx")
      return data
    
  end
  
end
