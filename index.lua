modal=require"modal"
page=require"page"

-- access the body and head
document.head.html("<style>p{color:red}</style>")
document.body.html("<p> hi there 🤗 </p>")


-- create an element
local butt = document.create("<button>press me</button>")
butt.attr("id","butt")
butt.on("click",function()page().open()end)
document.body.add(butt)

