esLunar - manifest
---
The manifest is the json object passed to your script tag, it defines your app, its entry point, splash screen and more. The web manifest is also generated from this.

```html
<script src=//eslunar.github.io/eslunar.stable >
{
  "main":"index.lua",
  "title":"demo app",
  ...
}
</script>
```
All values in the manifest are optional, including the `main` method which defaults to `index.lua`. The manifest itself is not even required.

---
### Manifest methods
Method | type | Default | Description
- | - | - | -
icon | url  | "/favicon.ico" | Sets the apps favicon and the web manifest install icon.
main | url  | "/index.lua" | Sets the entry script to be run when the app is ready.
splash | html | loading animation | sets the first contentful paint before the app is ready.
title | string | "esLuna app" | sets app title and web manifest  `name` and `short_name` methods.

---
**[continue to document](./document.md)**




