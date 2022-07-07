eslunar - modules
---
Modules are imported using the `require` function, and exported using the `return` statement. After a module is imported, its source is cached to sessionStorage.

Create a `module.lua` file, note any name can be used and it does not need to be in the root directory.

```lua
local greet = function(name)
   print("hello "..name.."!")
end

return greet --exports greet function
```

Then refer to your module in your main script, note if module name does not have an extension, the `.lua` extension is automatically added.

```lua
local greet = require("module.lua")
-- alt: local greet = require "module"
greet("eslunar")
-- prints "hello eslunar!"
```


---
**[continue to manifest](./manifest.md)**









