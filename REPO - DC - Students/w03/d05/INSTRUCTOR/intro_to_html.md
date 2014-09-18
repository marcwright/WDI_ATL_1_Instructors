# Intro to HTML

**Learning Objectives**

- What is HTML?
- What is the DOM?
- What is Accessibility, why do we care?
- What is SEO, why do we care?
- What is the Document Outline?
- What's up with this "HTML5" thang?

## HTML

**Hypertext Markup Language**

The skeleton of a website. It is nothing more than *structured content*. HTML is inherently logicless, therefore, it is NOT CODE (it's content).

## The DOM

**The Document Object Model**

- Defines structure for all content within the document.
- Each "element" is an object, and may be accessed and modified independently of other content.
- Inspectible using the web inspector.

## Accessibility

[Screen Reader](https://www.youtube.com/watch?v=KFPtxCDUPqs)

* 0:00 - H1
* 0:24 - bullet, links
* 1:00 - H2
* 1:17 - image

### ARIA Roles

**Accessible Rich Internet Applications**

Roles may be assigned to any tag. They're typically added to block-level elements to denote the role of the block's internal content.

```
 <div role="banner">Welcome to my website!</div>
```

**Common roles**

- `"banner"` : The page header block.
- `"navigation"` : A region of major site navigation.
- `"search"` : The region containing the site's search form.
- `"main"` : The main content region of the page.
- `"complementary"` : A region that complements the main (ie: a sidebar)
- `"contentinfo"` : The page footer.

## The Document Outline

**The Document Object Model**

- Defines a heirarchy for all content elements in the document.
- Primarily structured by `<h1>` - `<h6>` tags.
- Not surprisingly, should read like a bullet point list…

**A Document Outline...**

* **h1** - Document Title
	* **h2** - About Us
		* **h3** - Brand
		* **h3** - Leadership
		* **h3** - Backstory
	* **h2** - Products
		* **h3** - Widgets
		* **h3** - Wingnuts
		* **h3** - Accessories
	* **h2** - Contact Us
		* **h3** - Phone
		* **h3** - Email
		* **h3** - Street Address
		
## HTML Tags

- **Document Elements**
	- `<DOCTYPE html>`
	- `<html lang="en">`
	- `<head>` / `<title>` (important!!)
	- `<body>`
- **Inline Elements**
	- `<span>`
	- `<a>`
	- `<b>` / `<strong>`
	- `<i>` / `<em>`
	- `<img>`
- **Block Elements**
	- `<div>`
	- `<h1>`, `<h2>`, `<h3>`, `<h4>`, `<h5>`, `<h6>`
	- `<p>`
	- `<ul>` / `<li>`
	- `<ol>` / `<li>`
	- `<dl>` / `<dt>` / `<dd>`
- **Form Elements**
	- `<form>`
	- `<input>`
	- `<select>` / `<option>`
	- `<textarea>`
- **Table Elements ( …not for layout… )**
	- `<table>`
	- `<th>`, `<tr>`
	- `<td>`
- **Includes**
	- `<link>`
	- `<style>`
	- `<script>`

## The Truth About HTML5

Includes many confusing new "semantic" tags. These tags are (ironically) subjective regarding their content roles, and thus invalidate their own value as content identifiers:

- `<section>`
- `<article>`
- `<header>`
- `<footer>`
- `<nav>`
- `<main>`
- `<aside>`
- `<address>`
- `<cite>`

Includes several new form input types, as well as several new form attributes that target mobile platforms:

- `<input type="number">`
- `<input type="slider">`
- `<input type="date">`

HTML5 includes many new multimedia-oriented tags. These tags were largely motivated by the decline of Flash, so provide new browser-native multimedia capabilities:

- `<canvas>`
- `<video>`
- `<audio>`


## Exercise

Compose the Document Outline for…
[How We Use Energy](http://needtoknow.nas.edu/energy/energy-use/)
