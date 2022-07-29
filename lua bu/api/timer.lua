local timer={}

--once after delay
function timer.after(ms,func)
  local tm={_func=func,clear=function()app.javascript:clearTimeout(tr)end}
  local tr=app.javascript:setTimeout(tm._func,ms) return tm end

--loop after ms with time after
function timer.every(ms,func,delay)
  local loop=1
  local ret=nil
  local tm={}
    tm.interval=ms
    tm._func=func
    tm.func=function()
      ret=tm._func(loop,ret)
      loop=loop+1
      tr=timer.after(ms or 0,tm.func)
    end
    
    tm.clear=function()
      tr.clear()
      return tm
    end
  
  local tr=timer.after(delay or 0,tm.func)
  return tm
end

--fixed timer,ignores async func exec wait
function timer.interval(ms,func)return app.javascript:setInterval(func,ms)end

return timer
