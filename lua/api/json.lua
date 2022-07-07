return {
  parse=function(e)
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
end,


string=function(e)
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
}
