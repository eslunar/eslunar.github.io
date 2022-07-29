eslunar - queries
---
The `document` table has an advance built-in query system for selecting elements.

```lua 
--select an element--
document:query({id="el1"}) -- gets the first element that has id "el1"

--select all links--
document.body:queryAll({type="a",attr={href=true,disabled=false}}) -- gets all links that have a href value and is not disabled

```
Both query methods return nil when no matches are found, and are scoped to the element its called from. `query` returns an element, `queryAll` returns a table of elements (behaviour planned to change).

---
### Element methods
Method | type | Usage
--- | --- | ---
type | string | tag name
id | string | id attribute
class | pattern | class attribute
css | table | match css, truthy match if boolean, else strict matching
attr | table | match attributes, truthy match if boolean, else strict matching
html | pattern | inner HTML
text | pattern | inner text
parent | query | direct parent
child | query | direct child
children | query | all decsendants
position | number or string | return position in results, accepts string values "last" or "first"

Scoping from a higher level (e.g `document`) increases the amount of elements looped over, always scope close to the desired element.

---
**[continue to queries](./queries.md)**
