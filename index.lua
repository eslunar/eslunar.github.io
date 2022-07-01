document.head.html("<style>p{color:red}</style>")
document.body.html("<p> hi there 🤗 </p>")


-- create an element
local butt = document.create("<button>press me</button>")
butt.attr("id","mEl")
butt.on("click",function()alert("hello eslunar!")end)
document.body.add(butt)
