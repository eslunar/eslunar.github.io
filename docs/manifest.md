eslunar - manifest
---
The app manifest is the json object passed to your script tag, it defines your app, its entry point, splash screen and more. The web manifest is also generated from this.

```html
<script src=//eslunar.github.io/eslunar >
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
--- | --- | --- | ---
icon | url  | "/favicon.ico" | favicon and the web manifest install icon.
main | url  | "/index.lua" | entry script to be run when the app is ready.
splash | html | loading animation | the first contentful paint before the app is ready (splash screen).
service worker | url | "sw.js" | path to the service worker.
title | string | "eslunar app" | status bar title and web manifest's  `name` and `short_name` methods.

---
**[continue to document](./document.md)**




