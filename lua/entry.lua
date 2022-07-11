app = {}
app.javascriptCore=require "js";app.javascript=app.javascriptCore.global
app.manifest=app.javascript.manifest
app.tool={type=type}

function type(val)
  local e=app.tool.type(val)
  if e=="userdata" then if val==app.javascriptCore.null then return "null" else return app.javascript:typeof(val) end else return e end
end

app.framed=app.javascript.top~=app.javascript.self