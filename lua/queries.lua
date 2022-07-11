function _query(chd,queer)
  local match=table.assign({},chd)
  
  --match type--
  if queer.type then match=table.filter(chd,function(val)
    if string.lower(queer.type)==string.lower(val.raw.tagName) then return true end
  end)end
  
  --match id--
  if queer.id then match=table.filter(chd,function(val)
    if string.lower(queer.id)==string.lower(val.raw.id) then return true end
  end)end
  
  --match class--
  if queer.class then match=table.filter(chd,function(val)
    if string.find(val.attr("class"),queer.class) then return true end
  end)end
  
  --match text--
  if queer.text then match=table.filter(chd,function(val)
    if string.find(val.text(),queer.text) then return true end
  end)end
  
  --match html--
  if queer.html then match=table.filter(chd,function(val)
    if string.find(val.html(),queer.html) then return true end
  end)end
  
  --parent--
  if queer.parent then match=table.filter(chd,function(val) if #_query({val.parent()},queer.parent)==1 then return true end end) end
  
  --child--
  if queer.child then match=table.filter(chd,function(val) if #_query(val.children(),queer.child)>0 then return true end end) end
  
  --children--
  if queer.children then match=table.filter(chd,function(val) if #_query(val.children(true),queer.children)>0 then return true end end) end
  
  
  --attr--
  if queer.attr then match=table.filter(chd,function(val)local pass=true table.each(queer.attr,function(v,key)if type(v)=="boolean" then
        --check if has assign val to attr--
        local b=val.attr(key)~="" if b~=v then pass=false end else
        --check if values match strictly--
        local b=val.attr(key)==v if not b then pass=false end end end) return pass end)end
  
    --css--
  if queer.css then match=table.filter(chd,function(val)local pass=true table.each(queer.css,function(v,key)if type(v)=="boolean" then
        --check if has assign val to attr--
        local b=val.css(key)~="" if b~=v then pass=false end else
        --check if values match strictly--
        local b=val.css(key)==v if not b then pass=false end end end) return pass end)end
  
  
  if queer.position=="first" then return {match[1]} end
  if queer.position=="last"  then return {match[#match]} end
  if type(queer.position)=="number" then return {match[queer.position]} end
  return match
end



--previous and next sibling--
