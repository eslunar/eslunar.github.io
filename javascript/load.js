/*load in base lua sceipts*/Promise.all(["entry","async","require","helpers","time",

/*table extend*/"table/clone","table/assign","table/map","table/each","table/filter","table/keys","table/first","table/last","table/length","table/at","table/helper",



/*elements*/"node/core","node/add","node/remove","node/html","node/text","node/attr","node/css","node/on","node/close"


,"wrap"].map(e=>`/lua/${e}.lua`).map(e=>fetch(e))).then(e=>Promise.all(e.map(e=>e.text()))).then(e=>{
  /*compiles lua scripts into single startup*/
  document.head.innerHTML+=`<script id=lua-script type=application/lua >coroutine.wrap(function() ${e.join("\n")} end)()</script>`
})

window.oop={}
