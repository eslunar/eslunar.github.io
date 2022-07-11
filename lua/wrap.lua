local require=requireFactory(false)


--start process
local start=coroutine.wrap(function()
  
  --setup dom binds
  document=app.node(app.javascript.document.documentElement)
  document.head=app.node(app.javascript.document.head)
  document.body=app.node(app.javascript.document.body)
  document.create=app.node
  
  --launch entry script
  print(require(app.manifest.main or "index") or "")
  
  --remove splash screen
  app.javascript.document:querySelector("splash"):remove()
  app.javascript.document:querySelector("#lua-script"):remove()
end)


local function rloop() app.javascript:setTimeout(function() if app.javascript.document.readyState=="complete" then start() else rloop() end end,0) end rloop()
