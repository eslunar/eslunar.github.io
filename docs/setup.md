eslunar - setup
---
Two files are required to start, your entry `.html` file and your lua code, seperately. Add eslunar as a script tag in your entry `.html` file, then add a json object to said script tag, this acts as your package config file.

source:```eslunar.github.io/eslunar```

```html
<html>
  <script src=//eslunar.github.io/eslunar >
  {
    "main":"index.lua"
  }
  </script>
</html>
```

Now create your entry `.lua`  file in the same directory, which is currently set to `index.lua`.

```lua
local a = "hello "
local b = "eslunar!"
print(a..b)
--prints "hello eslunar!"
```
Run in your browser to see results, you can also use the `alert` api to see graphical results.

---
### Processes during setup

On script successfully loaded, eslunar creates a customisable splash screen to keep the user occupied while the [lua VM](//fengari.io) is warming up. When the VM is ready, eslunar runs the first lua script. If the first script successfully loads, the splash screen will be removed, else [failsafe measures](./failsafe.md) will be launched.

---
**[continue to modules](./modules.md)**
