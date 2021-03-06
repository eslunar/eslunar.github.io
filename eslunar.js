window.manifest=JSON.parse(window.top===window.self?document.currentScript.innerText||"{}":sessionStorage.manifest||"{}")
let src=document.currentScript.src.split("/")
src.pop()
manifest.src=src.join("/")+"/"
manifest.color=manifest.color||"#0097A7"
manifest.flags=(manifest.flags||"").split(" ")

/*enable responsive design*/
let mt=document.createElement("meta")
  mt.setAttribute("charset","UTF-8")
  document.head.appendChild(mt)
  mt=document.createElement("meta")
  mt.setAttribute("name","viewport")
  mt.setAttribute("content","width=device-width, initial-scale=1")
  document.head.appendChild(mt)
  mt=document.createElement("meta")
  mt.setAttribute("name","theme-color")
  mt.setAttribute("content",manifest.color)
  document.head.appendChild(mt)
  
  mt=document.createElement("link")
  mt.setAttribute("rel","icon")
  mt.setAttribute("href",manifest.icon||manifest.src+"favicon.ico")
  document.head.appendChild(mt)
  mt = document.createElement("title")
  mt.innerText = manifest.title || "eslunar app"
  document.head.appendChild(mt)
  
  /*create web manifest*/
  mt = document.createElement("link")
  mt.rel = "manifest"
  mt.href = "data:application/manifest+json," + encodeURIComponent(JSON.stringify({ name: manifest.title||"eslunar app", short_name: manifest["short title"]||manifest.title||"eslunar app", start_url:manifest.entry || location.origin, display:manifest.display||"standalone", description:manifest.description || "Powered by esLunar.", background_color:manifest.background||"white", theme_color:manifest.color, icons: [ { src:manifest.icon || manifest.src + "favicon.ico",sizes: "192x192",type: "image/png"},{ src:manifest.icon || manifest.src + "favicon.ico",sizes: "512x512",type: "image/png",purpose:"any maskable"} ]}))
  
  
    document.head.appendChild(mt)
  mt=undefined



let splash=document.createElement("splash")
Object.assign(splash.style,{background:"#00000020",position:"fixed",zIndex:99999,top:0,bottom:0,left:0,right:0,backdropFilter:"blur(3px)",display:"flex",alignItems:"center",justifyContent:"center"})
splash.innerHTML=manifest.splash||`<style>load{width:35px;height:35px;border-radius:100%;border:5px solid ${manifest.color};border-top:5px solid transparent;transform:rotate(0deg);animation:spin 800ms linear infinite;margin:20px auto}@keyframes spin{to{transform:rotate(359deg)}}</style><load></load>`
manifest.flags.includes("no-splash")?"":document.documentElement.appendChild(splash)

if(sessionStorage["eslunar.js"])setTimeout(sessionStorage["eslunar.js"],0); else Promise.all(["engine","setup"].map(e=>`${manifest.src}js/${e}.js`).map(e=>fetch(e))).then(e=>Promise.all(e.map(e=>e.text()))).then(e=>{sessionStorage["eslunar.js"]=e.join("\n");setTimeout(e.join("\n"),0)})