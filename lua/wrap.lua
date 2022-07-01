local require=requireFactory(false)


--start process
local start=coroutine.wrap(function()
  
  --setup dom binds
  document=app.node(app.javascript.document.documentElement)
  document.head=app.node(app.javascript.document.head)
  document.body=app.node(app.javascript.document.body)
  document.create=app.node
  
  --launch entry script
  console.log(require(app.manifest.main or "index"))

end)
--on document load complete
if app.javascript.document.readyState=="complete" then start() else app.javascript.document:addEventListener("load",start) end
