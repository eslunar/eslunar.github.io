/*Used in require modules,parses path to be dynamic*/
window.parsepath=function(scope,path,exte){
  if(path.startsWith("//"))path="http:"+path
  else if(/^([a-z]+:\/\/)/i.test(path));
  else path=new URL(path,scope||location.href).href
  let ext=(path.split("/")[path.split("/").length-1||0]||"").includes(".")
  return ext?path:path+(exte||".lua")
}

/*typeof userdata*/
window.typeof=ud=>typeof ud

/*creates an element*/
window.parseNode=function(str="<div>"){
  let e=document.createElement("div")
  e.innerHTML=str
  let x=e.children[0]
  e.innerHTML=""
  return x
}

/*checks if an element has an attr*/
window.nodeAttr=(el,attr,val)=>{
  let x=attr in el?el[attr]:el.getAttribute(attr)
  val!==undefined?attr in el?el[attr]=val:el.setAttribute(attr,val):""
  x=x===null?"":x
  return x }
window.nodeCSS=(el,css,val)=>{
  css=css.replace(/\s/g,"-")
  let x=val!==undefined?el.style[css]=val:el.style[css]
  x=x===null?"":x
  return x }

/*creates a fetch request*/
window.request=async function request(path,cache){
  if(cache&&sessionStorage[path]) return {
    status:200,
    text:sessionStorage[path]
  }; else {
  let el=await fetch(path).catch(function(e){return {err:true}})
  if(el.err)return await request(path)
  
  if(el.ok){
    req = await el.arrayBuffer().catch(e => null)
    if (req === null) /*body fetching failed but headers are true so... retry*/ return await request(path)
    const blob = new Blob([req])
    const text = await blob.text().catch(e => "")
    if(cache)sessionStorage[path]=text
    let json;
    return {status:el.status,text,blob,buffer:req}
  } else {
    return {error:el.status}
  }}
}

/*map native apis*/
manifest.packages=manifest.packages||{}
let a=e=>`${manifest.src}lua/api/${e}.lua`
Object.assign(manifest.packages,{
  "alert":a("alert"),
  "async":a("async"),
  "console":a("console"),
  "fetch":a("fetch"),
  "json":a("json"),
  "prompt":a("prompt"),
  "ternary":a("ternary"),
  "timer":a("timer")
})


/*load in base lua sceipts*/if(sessionStorage["eslunar.lua"])document.head.innerHTML+=`<script id=lua-script type=application/lua >coroutine.wrap(function() ${sessionStorage["eslunar.lua"]} end)()</script>`;else Promise.all(["entry","require","table","css","document","queries","wrap"].map(e=>`${manifest.src}lua/${e}.lua`).map(e=>fetch(e))).then(e=>Promise.all(e.map(e=>e.text()))).then(e=>{
  sessionStorage["eslunar.lua"]=e.join("\n")
  /*compiles lua scripts into single startup*/
  document.head.innerHTML+=`<script id=lua-script type=application/lua >coroutine.wrap(function() ${e.join("\n")} end)()</script>`
})
