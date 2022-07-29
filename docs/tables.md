eslunar - table
---
The `table` table has methods to manipulate, well... tables. Extended with JavaScript like methods, e.g `filter`, `assign`, `sort` e.t.c.

```lua
--clone--
c=table.clone({a=1,b=2})
print(c.b)

--iterate over values--
table.each({1,2,3,a=5,b=6},function(e)
  print(e.key,e.value)
end)

```
Table methods directly manipulate the passed table, clone your table to avoid unintetional changes.

---
### Element methods
Method | Syntax | Usage
--- | --- | ---
assign | table.assign({},...) | returns a new table with assigned values from right to left
clone | table.clone({}) | returns a clone of the passed table
each | table.each({},function({key,value})) | iterate over keys

---
**[continue to queries](./queries.md)**