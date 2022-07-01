esLuna - document
---
Use the document table to access the DOM, query elements or create new elements.The document table itself is an element with extra methods such as `head`, `body` and `create`.

```lua 
-- access the body and head
document.head.html("<style>p{color:red}</style>")
document.body.html("<p> hi there 🤗 </p>")


-- create an element
local butt = document.create("<button>press me</button>")
butt.attr("id","mEl")
butt.on("click",function()alert("hello esluna!")end)
document.body.add(butt)

-- query an element
local el = document.query({id="mEl",type="button"})
el.css("background","blue")

```
All methods on the document or elements are chainable for convinience.

example :  `el.attr("disabled",true).css("color","gray")`

---
### Document methods
Method | type | Usage
- | - | -
body | element | bound to the document body.
clone | function(element) | clones an element.
create | function(string or element) | Creates a new element from an html string provided, or creates a reference if an element is provided.
head | element | bound to the document head.

---
### Element methods
Method | Usage
- | -
add | adds an element to the referer, accepts infinite parameters.
attr | Sets or gets referers attributes, learn [more](./attrncss.md).
css | Sets or gets referers style, learn [more](./attrncss.md).
html | Sets or gets referers inner HTML, learn [more](./textnhtml.md).
off | Removes an event listener from the referer.
on | Adds an event listener to the referer.
query | Return the first matching child of the referer, learn [more](./queries.md).
queryAll | Return  matching children of the referer, learn [more](./queries.md).
remove | Removes referer from its parent, if a query object is passed, then it removes the matching children of the referer.
text | Sets or gets referers inner text, learn [more](./textnhtml.md).

You can also access javascript element methods currently unavailable to esLuna via the `element.raw` method, which is just direct access to the html element being manipulated.

---
**[continue to queries](./queries.md)**