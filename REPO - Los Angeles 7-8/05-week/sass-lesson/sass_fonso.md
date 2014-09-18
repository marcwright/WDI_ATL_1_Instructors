#SASS

###Variables

```
$font-stack:    Helvetica, sans-serif;
$primary-color: #333;

body {
  font: 100% $font-stack;
  color: $primary-color;
}
```


```
body {
  font: 100% Helvetica, sans-serif;
  color: #333;
}
```

###Partials and Import

Partial Sass files contain little snippets of CSS that you include in other Sass files.Sass partials are used with the @import directive.

Partial

```
_partial.scss
```

Import

Let's say you have a couple of Sass files, _reset.scss and base.scss. We want to import _reset.scss into base.scss.

```
// _reset.scss

html,
body,
ul,
ol {
   margin: 0;
  padding: 0;
}
```

```
/* base.scss */

@import 'reset';

body {
  font-size: 100% Helvetica, sans-serif;
  background-color: #efefef;
}
```
###Nesting & Inheritance

Nesting is awesome (but can also be tricky if you haven't planned out your stylesheet, so map out your page structure first!).

You can nest rules inside of each other. If you have an ```<a>``` inside of a ```<nav>```, and you want those a's specially styled, you can do this:

```
nav {
	background-color: #ff3366;
	
	a {
		text-decoration: none;
		font-weight: bold;
	}

}
```

You can also use ```@extend``` to re-apply rules across selectors (inheritance!). 

**generic rule:**

```
.box {
	height: 100px;
	width: 100px;
}
```

**inherited elsewhere:**

```
.blue { 
	@extend .box;
	background-color: blue;
}

.green { 
	@extend .box;
	background-color: green;
}
```

###Mixins

Mixins are like functions for sass

```
@mixin border-radius($radius) {
  -webkit-border-radius: $radius;
     -moz-border-radius: $radius;
      -ms-border-radius: $radius;
          border-radius: $radius;
}

.box { @include border-radius(10px); }
```

###Operators

You can create flexible layouts (fluid grids!) by embedding the math for sizing directly in your stylesheets.

```
 section {
 	width: 500px / 960px * 100%;
 	}
 	
```

In the above rule, the section will be 500px wide if the window is 960px wide, or **500/960 px** wide for other window widths.


###Fun facts

- The official SASS guide is [here](http://sass-lang.com/quide).
- ```@import``` lets you bring in other sheets (like the base stylesheet that comes with Twitter Bootstrap) or partials.
- You can also use conditionals, like ```@if``` to set styles.
- Additional operators (like ```&```) take things next-level, and let you select parent or child selectors.
- If you love SASS and want to use it on a non-Rails app, you can! [Compass](http://compass-style.org/) is your pal.
- Bootstrap and other front-end frameworks now support SASS.

**source:**

[the sass guide](http://sass-lang.com/guide)

If you wanna go down the rabbit hole check out the reference

[sass reference](http://sass-lang.com/documentation/file.SASS_REFERENCE.html)


