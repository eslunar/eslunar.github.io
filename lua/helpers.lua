--js native alerts
function alert(el)app.javascript:alert(el)end

--js console
console={}
function console.log(...) app.javascript.console:log(...); end
function console.error(e) app.javascript.console:error(e); end
function console.warn(e) app.javascript.console:warn(e); end

--JSON
json={}
function json.parse(e)
  local function parse(obj)
    local tab={}
    for key, val in pairs(obj) do 
      if type(val)=="userdata" then
        tab[key]=parse(val)
      else tab[key]=val end
    end
    return tab
  end
  
  return parse(app.javascript.JSON:parse(e))
end


function json.string(e)
  local function convert(tab)
    local obj=app.javascript.JSON:parse("{}")
    for key,val in pairs(tab) do
      local t=type(val)
      if t=="string" or t=="number" or t=="boolean" or t=="nil" then obj[key]=val elseif t=="table" then obj[key]=convert(val) end
    end
    return obj
  end
  
  return app.javascript.JSON:stringify(convert(e))
end


--ternary helper
function turn(c,t,f,d) if c then return t or true else return f or false or d end end


--fetch function
function fetch(path,opts)
  
  
end
