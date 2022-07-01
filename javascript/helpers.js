

/*Used in require modules,parses path to be dynamic*/
window.parsepath=function(scope,path){
  if(path.startsWith("//"))path="http:"+path
  else if(/^([a-z]+:\/\/)/i.test(path));
  else path=new URL(path,scope||location.href).href
  let ext=(path.split("/")[path.split("/").length-1||0]||"").includes(".")
  return ext?path:path+".lua"
}


/*creates an element*/
window.parseNode=function(str="<div>"){
  let e=document.createElement("div")
  e.innerHTML=str
  return e.children[0]
}

/*checks if an element has an attr*/
window.nodeAttr=(el,attr)=>attr in el
