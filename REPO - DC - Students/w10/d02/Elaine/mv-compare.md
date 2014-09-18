# MV-Compare

## Libraries and Frameworks

- A **library** performs specific, well-defined operations.

- A **framework** is a skeleton over which an application's business logic is fleshed out. The skeleton provides core support for the application's specific operations.

## Let's Research…

### Teams:

1. Angular
2. Backbone
3. Ember
4. Knockout
5. Ractive
6. React

### Research facts:

- **Short description of the tool**
With Backbone, you represent your data as Models, which can be created, validated, destroyed, and saved to the server. Whenever a UI action causes an attribute of a model to change, the model triggers a "change" event; all the Views that display the model's state can be notified of the change, so that they are able to respond accordingly, re-rendering themselves with the new information. In a finished Backbone app, you don't have to write the glue code that looks into the DOM to find an element with a specific id, and update the HTML manually — when the model changes, the views simply update themselves.

Philosophically, Backbone is an attempt to discover the minimal set of data-structuring (models and collections) and user interface (views and URLs) primitives that are generally useful when building web applications with JavaScript. In an ecosystem where overarching, decides-everything-for-you frameworks are commonplace, and many libraries require your site to be reorganized to suit their look, feel, and default behavior — Backbone should continue to be a tool that gives you the freedom to design the full experience of your web application.

- **Who made it?** (if available)

Jeremy Ashkenas, also the creator of CoffeeScript and Underscore.

- **Pattern** (MVC? V-only? etc.)

MV*, with the caveat that the view class can be thought of as a controller

- **Dependencies** (other libraries this tool depends on)

jQuery + Underscore.js

- **Library or Framework?**

Library/Framework

Backbone is a library, not a framework, and plays well with others. You can embed Backbone widgets in Dojo apps without trouble, or use Backbone models as the data backing for D3 visualizations (to pick two entirely random examples).

- **Minified filesize** (NOT g-zipped! Download the minified script and ⌘I it)

18kb

- **Browser Support** (if available)

Most if not all, dependent on jQuery.

- **GitHub Commits** (rounded to the nearest hundred)

2,618 commits

- **GitHub Stars** (rounded to the nearest hundred)

18,400
