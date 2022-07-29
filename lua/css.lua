css = {}
  function css:selector(a,b)
    a=a or ""
    b=b or {}
    --set selector--
    if b then
    local el=css.bundle:query({attr={query=a,group="selector"}}) or document:create("<style></style>").attr({query=a,group="selector",object=json.encode(b)}).el
     el:html(a..css._uniCon(b))
    css.bundle:add(el)
    
    else
    --get selector--
      local el=css.bundle:query({attr={query=a,group="selector"}}) or document:create("<style></style>").attr({query=a,group="selector",object="{}"}).el
      return json.decode(el.attr("object"))
    end
  end

  function css:keyframe(a,b)
    a=a or ""
    b=b or {}
    --set selector--
    if b then
    local el=css.bundle:query({attr={query=a,group="keyframe"}}) or document:create("<style></style>").attr({query=a,group="keyframe",object=json.encode(b)}).el
     el:html("@keyframes "..a..css._multiCon(b))
    css.bundle:add(el)
    
    else
    --get selector--
      local el=css.bundle:query({attr={query=a,group="keyframe"}}) or document:create("<style></style>").attr({query=a,group="keyframe",object="{}"}).el
      return json.decode(el:attr("object"))
    end
  end

  
  css._uniCon=function(obj)
    
    obj=obj or {}
    local build="{"
    local el=document:create("<psuedo-element>")
    el.css(obj)
    build=build..(type(el.raw:getAttribute("style"))=="string" and el.raw:getAttribute("style") or "")
    return build.."}"
  end
  
  css._multiCon=function(obj)
    obj = obj or {}
    local build="{"
    local map=table.map(obj,function(val,key)
      build=build..key..css._uniCon(val)end)
    
    return build.."}"
  end
  

