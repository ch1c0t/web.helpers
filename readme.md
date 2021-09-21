## Introduction

`web.helpers` are a few functions to create web user interfaces. To install:

```
npm install web.helpers
```

## render

To import:
```
import { render } from 'web.helpers'
```

`render` accepts two arguments:

- `id`: a String, [an id existing in the document][id];
- `view`, which is either of these:
  - an instance of [HTMLElement][HTMLElement];
  - an Array of HTMLElement instances;

[id]: https://developer.mozilla.org/en-US/docs/Web/API/Element/id
[HTMLElement]: https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement

Usage examples:
```
div = document.createElement 'div'
render 'SomeId', div

array = [
  document.createElement 'div'
  document.createElement 'div'
]
render 'AnotherId', array
```

`render` updates an element at `id` with [replaceChildren][replaceChildren].

One way to create elements is with [web.tags][web.tags].

[replaceChildren]: https://developer.mozilla.org/en-US/docs/Web/API/Element/replaceChildren
[web.tags]: https://github.com/ch1c0t/web.tags

## isMobile

is to check if you are in a mobile browser:

```
import { isMobile } from 'web.helpers'

if isMobile()
  console.log 'inside of a mobile browser'
else
  console.log 'otherwise'
```
