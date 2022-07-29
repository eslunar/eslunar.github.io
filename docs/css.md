eslunar - css
---
Use the css table to create selectors, keyframes or media queries.

```lua 
-- create a selector --
css:selector("p",{padding="5px"})
css:selector(".blue",{color="blue"})

--animations--
css:keyframe("spin",{
  from={transform="rotate(0deg)"},
  to={transform="rotate(359deg)"}
})

--media queries--
css:media("all and width>1000px",{
  .navbar={position="fixed"}
})
```
All methods on the css table chainable for convinience.

example :  `css:selector(...):keyframe(...)`

---
### Element methods
Method | Usage
--- | ---
selector | Creates an ordinary css selection.
keyframe | Creates a keyframe object for animations, used by the css `animation` property.
media | creates a media object, for responsive design or dark mode.

These methods return their values if the second param is omited.

---
**[continue to queries](./queries.md)**
