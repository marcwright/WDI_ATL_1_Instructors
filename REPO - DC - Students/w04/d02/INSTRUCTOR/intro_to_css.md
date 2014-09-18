# Intro to CSS

**Learning Objectives**

- What is CSS?
- What are Selectors?
- What is the Box Model?

## CSS

**Cascading Stylesheets**

Provides visual styling rules for specific elements within the document object model (DOM).

## Where styles go

### External stylesheets

The best approach is to include all of your styles through external stylesheets (".css" files) using the `<link>` tag. Add a reset stylesheet first to normalize your environment across browsers!

```
 <link href="reset.css" rel="stylesheet">
 <link href="main.css" rel="stylesheet">
```

### Embedded stylesheets

Styles may be embedded into the HTML document within a `<style>` tag. While this can have its uses, the approach is generally discouraged.

```
 <style>
  body {
    background-color: #ccc;
  }
 </style>
```

### Inline styles

Extremely specific style attributes can be written onto elements within the Document Object Model (DOM). This is the primary method that JavaScript uses to manipulate your presentation. You should avoid using inline styles while composing your base presentation graphics.

```
 <div style="display:none;">I'm hidden.</div>
```

## Selectors

Selectors are used to target elements in the DOM with specific style rules. Selectors may target elements by tag name, class name, id name, or as inline rules applied directly to an element.

### Basic Selectors:

- `tagname`
- `.class-name`
- `#id-name`

**HTML:**

```
 <div class="promo" id="pencil-promo">
	<h2>Pencils for sale!</h2>
	<p>For a limited time offer, get yours today!</p>
	
	<p style="font-size:10px;">Limited time offer, while supplies last.</p>
 </div>
```
**CSS Selectors**

```
 h2 {
	/* Selects by tag name */
 }

 .promo {
	/* Selects by class name */
 }

 #pencil-promo {
	/* Selects by id name */
 }
```

### Composite Selectors

Selectors may be combined and/or nested. This allows styles to target very specific elements.

- `tag.class-name`
- `.class1.class2`
- `tag#id-name.class-name`
- `.class-name .sub-class`
- `.classname a.class-name`

There is no technical limit to the nesting of selectors, however discipline and good judgement while nesting selectors will do you a great service, and improve rendering performance!

```
 div.promo h2 {
 	/* Composite selector */
 }
```

### Psudo-classes

Special psudo-classes allow us to add additional refinements onto our base selector classes. Common psudo-classes include:

- :hover
- :focus
- :first-child
- :last-child

### Specificity

Specificity determines what style rules are applied to an element that is targeted by many different style rules. The element's actual computed style is determined by its most *specific* styles.

#### Scoring
Specificity is actually quite easy to calculate:

| selector | value |
|:-- |:----------- |
| **tag** | 1 point  |
| **class**  | 10 points   |
| **id** | 100 points  |
| **inline** | 1000 points   |
| **!important** | 10,000 points   |

So, the net specificity of this selector would be…?:

```
div#features a.slide h3 span
```
This selector is worth **114 points**.

#### Specificity Ties
When two selectors have the same net specificity score, then the last one applied wins. Note that stylesheets are read from top to bottom, and their styles are applied in order… therefore, styles defined lower within your stylesheet will win.

## Basic styles

Some basic element styles:

- **background-color**: #000;
- **background-image**: url("image.jpg");
- **border**: 1px solid #f00;
- **border-radius**: 5px;
- **color**: #FFF;
- **font-family**: Arial, Helvetica, sans-serif;
- **font-size**: 12px;
- **font-style**: italic;
- **font-weight**: bold;
- **line-height**: 2em;
- **list-style**: none;

## The Box Model

[Box Model](http://www.vanseodesign.com/css/inline-blocks/)

Some element styles specifically used for controlling box dimensions and margins:

- **border**: 1px solid #f00;
- **display**: block / inline / inline-block / none;
- **height**: 50px;
- **margin**: 10px auto;
- **padding**: 20px 40px;
- **width**: 100px;

### Box attribute order

Box style rules (margin, padding, etc) may include 1-4 values for the different sides. These values are applied as follows:

```
 /* Same on all four sides */
 margin: 20px;
 
 /* Top-Bottom / Left-Right */
 margin: 20px 40px;
 
 /* Top / Right / Bottom / Left (clockwise) */
 margin: 10px 50px 50px 40px;
```

## Positioning

Elements may define a position attribute that determines how they are placed within the document. Absolute positioning breaks the element from document flow, and aligns it to its nearest relative parent.

- **position**: static / relative / absolute / fixed;
- **bottom**: 0;
- **left**: 0;
- **right**: 0;
- **top**: 0;
 
## Floats

Floating takes block elements out of standard document flow, and allows them to stack horizontally.

- **float**: left / right / none;
- **clear**: both;
- **overflow**: auto / hidden;

### Wrapping Floats

Because floated content is removed from document flow, you need clear the floated sequence for the parent element to wrap its floated children. There are three main techniques:

#### clear

Add "clear:both;" to an element after the floated content.

```
 <div>
 	<div style="float:left;">I'm Floated!</div>
 	<div style="clear:both;"></div>
 </div>
```

#### overflow

Add "overflow:auto / hidden;" to the parent element. The overflowed parent will wrap its floated children.

```
 <div style="overflow:auto;">
 	<div style="float:left;">I'm Floated!</div>
 </div>
```

#### clearfix

Use a `.clearfix` class on the parent container, and then add a [clearfix implementation](http://css-tricks.com/snippets/css/clear-fix/) into your stylesheet. Clearfix is a widely recognized and accepted practice (albiet, still technically a hack though).

```
 <div class="clearfix">
 	<div style="float:left;">I'm Floated!</div>
 </div>
```

## Pro Tips

1. **All styles go into external CSS files**. Avoid using inline-styles.
2. **Only style using class and tag selectors**. AVOID STYLING IDs.
3. **Avoid !important**. It's a last resort.
4. **Alphabetize your style rules.** You'll avoid clumsy overrides!

