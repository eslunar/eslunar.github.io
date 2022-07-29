function _query(chd,queer)
  local match=table.assign({},chd)
  
  --match type--
  if queer.type then match=table.filter(chd,function(e)
    if string.lower(queer.type)==string.lower(e.value.raw.tagName) then return true end
  end,true)end
  
  --match id--
  if queer.id then match=table.filter(chd,function(e)
    if string.lower(queer.id)==string.lower(e.value.raw.id) then return true end
  end,true)end
  
  --match class--
  if queer.class then match=table.filter(chd,function(e)
    if string.find(e.value.attr:class(),queer.class) then return true end
  end,true)end
  
  --match text--
  if queer.text then match=table.filter(chd,function(e)
    if string.find(e.value:text(),queer.text) then return true end
  end,true)end
  
  --match html--
  if queer.html then match=table.filter(chd,function(e)
    if string.find(e.value:html(),queer.html) then return true end
  end,true)end
  
  --parent--
  if queer.parent then match=table.filter(chd,function(e) if #_query({e.value:parent()},queer.parent)==1 then return true end end,true) end
  
  --child--
  if queer.child then match=table.filter(chd,function(e) if #_query(e.value:children(),queer.child)>0 then return true end end,true) end
  
  --children--
  if queer.children then match=table.filter(chd,function(e) if #_query(e.value:children(true),queer.children)>0 then return true end end,true) end
  
  
  --attr--
  if queer.attr then match=table.filter(chd,function(e)local pass=true table.each(queer.attr,function(x)if type(x.value)=="boolean" then
        --check if has assign val to attr--
        local b=e.value.attr(x.key)~="" if b~=x.value then pass=false end else
        --check if values match strictly--
        local b=e.value.attr(x.key)==x.value if not b then pass=false end end end) return pass end)end
  
    --css--
  if queer.css then match=table.filter(chd,function(e)local pass=true table.each(queer.css,function(x)if type(x.value)=="boolean" then
        --check if has assign val to attr--
        local b=e.value.css(x.key)~="" if b~=x.value then pass=false end else
        --check if values match strictly--
        local b=e.value.css(x.key)==x.value if not b then pass=false end end end) return pass end)end
  
  
  if queer.position=="first" then return {match[1]} end
  if queer.position=="last"  then return {match[#match]} end
  if type(queer.position)=="number" then return {match[queer.position]} end
  return match
end



--previous and next sibling--
