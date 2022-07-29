app = {}
app.javascriptCore=require "js"
app.javascript=app.javascriptCore.global

--informante--
app.manifest=app.javascript.manifest
app.framed=app.javascript.top~=app.javascript.self
