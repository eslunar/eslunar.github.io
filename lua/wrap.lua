local require=requireFactory(false)


--start process
local start=coroutine.wrap(function()
  
  --setup dom binds
  document=app.nodeClass.create(app.javascript.document.documentElement)
  document.head=app.nodeClass.create(app.javascript.document.head)
  document.body=app.nodeClass.create(app.javascript.document.body)
  function document:create(node)return app.nodeClass.create(node)end
  css.bundle=document:create("<style-bundle></style-bundle>")
  css.bundle.css:display("none")
  document:add(css.bundle)
  --]]
  --launch entry script
  print(require(app.manifest.main or "index") or "")
  
  --remove splash screen
  app.javascript.document:querySelector("splash"):remove()
  app.javascript.document:querySelector("#lua-script"):remove()
end)

--wait for doc load--
local function rloop() app.javascript:setTimeout(function() if app.javascript.document.readyState=="complete" then start() else rloop() end end,0) end rloop()
