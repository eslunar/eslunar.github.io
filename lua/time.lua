timer={}

--once after delay
function timer.after(ms,func)
  local tr=app.javascript:setTimeout(function()end,0)
  local tm={
    _func=func,
    clear=function(delay)app.javascript:setTimeout(function()app.javascript:clearTimeout(tr)end,delay or 0)end
    
  }
  tr=app.javascript:setTimeout(tm._func,ms) return tm end

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


--[[
app.every=function TimeLoop(every=0,func=console.log,delay=0){
  const time={}
  let tr=setTimeout(e=>e,0)
  let loop=0
  let ret;
  
  time._func=func
  time._every=every
  
  time.func=async function(){
    await time._func(loop)
    loop++
    tr=setTimeout(time.func,time._every)
  }
  
  time.clear=function(after=0){
    setTimeout(e=>clearTimeout(tr),after)
    return this
  }
  
  tr=setTimeout(time.func,delay)
  return time
}

]]

--time in milliseconds
function timer.now(format)return app.javascript.Date:now()end

--fixed timer,ignores async func exec wait
function timer.interval(ms,func)return app.javascript:setInterval(func,ms)end
