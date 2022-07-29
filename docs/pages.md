eslunar - modals
---
Modals are overlays used for alerts, pages, e.t.c. Modals can be cancelled by pressing the back button or by clicking on the backdrop.

```lua 
local modal=require "modal"
local history=require "history"

--create a modal--
ex=modal("hello")
ex:open()

--create an alert--
ex=modal("<div class=alert ><p>alert!</p><button>ok</button></div>")
ex:query({type="button"}):on("click",
function()history:back()end)
ex:open()
```
Modals are elements, all element methods are available on modals. Both html strings and element tables are accepted by modals.

---
### Element methods
Method | Usage
--- | --- 
open | adds the modal to the page
close | removes the modal from the page

---
**[continue to queries](./queries.md)**
