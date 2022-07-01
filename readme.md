esLunar v1.0
---
#### The perfect lua environment for the web.




### Introduction

Built with simplicity in mind, eslunar uses [lua 5.3]() syntax and [javascript]() apis to create amazing web apps, fast! no build steps or compilations required.

Features:
- Simple module import and exports
- supports all javascript libraries
- supports most lua packages
- close interaction with the DOM
- top level asynchronous code
- plays nicely with other frameworks, e.g Jquery
- API packed

All this under `300kb`, **interested?**


---
### Usage
Add esLunar to your `index.html`, then add a json object that references to your entry script.

source:```eslunar.github.io/eslunar.stable```

```
<html>
  <script src=//eslunar.github.io/eslunar.stable >
  {
    "main":"index.lua"
  }
  </script>
</html>
```

Add your lua code to `index.lua`:

```
print("hi eslunar!")
```

---
### Docs
##### Core
- [Setting up](./docs/setup.md)
- [Modules](./docs/modules.md)
- [Manifest](./docs/manifest.md)

##### UI
- [Documet](./docs/document.md)
- [Queries](./docs/queries.md)
- [Modals](./docs/modals.md)
- [Pages](./docs/pages.md)

##### API
- [Async](./docs/async.md)
- [Json](./docs/json.md)
- [Timer](./docs/timer.md)


Learn more [here](./docs/ref.md).

---
### esLunar nightly
All new tested and untested features are pushed to the nightly version before they are green flagged for the stable version to avoid breaking changes and bugs. Never use nightly in production, results could be disastrous to your app.

source: `eslunar.github.io/eslunar.nightly`


---
### Author
Faizel Dealdrey Garoeb

email - <dealdreygaroeb@gmail.com><br/>telegram - https://t.me/esLunar

happy coding!
