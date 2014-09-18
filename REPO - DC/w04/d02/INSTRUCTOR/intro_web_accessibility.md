# Web Accessibility

**Learning Objectives**

- What are major web accessibility factors?
- What is Section 508?
- What is WCAG?
- What are ARIA roles?

## Accessibility Considerations

There are many different audiences to take into account while considering accessibility.

- **Browser** (Technical features, touch-enabled)
- **Visual** (Screen readers, color contrast)
- **Motor skills** (keyboard access, big buttons)
- **Auditory** (Closed captioning)
- **Cognative/Intellectual** (copy writing)

## Section 508

**An ammendment to the Rehabilitation Act of 1973**

In 1998 the US Congress amended the Rehabilitation Act to require Federal agencies to make their information technology accessible to persons with disabilities. Many private companies now follow this same practice.

Making content follow Section 508 guidelines is a *very* common software requirement. Common best-practices:

- Organized document outline.
- Image alt attributes.
- ARIA roles.
- Standard tags for custom uses.
- Jump-to navigation links.

### Image alt

Image tags support an "alt" attribute that may define a text alternative for an image. ALL images should have an `alt` attribute, like so:

```
<img src="sunset.jpg" alt="Beach at sunset.">
```

Alternate text should be a *complete sentance*. In the event that the image is purely visual flavor with little real content value, specifying a blank `alt` attribute for an image tag is totally acceptible.

Do NOT add garbage filler into alt texts (such as the Rails default of using an image's file name as its alt text). This practice does more harm than good.

### ARIA Roles

**Accessible Rich Internet Applications**

[Screen Reader](https://www.youtube.com/watch?v=KFPtxCDUPqs)

ARIA roles help screen readers identify major content items on the page. HTML5 was modeled (badly) after ARIA roles, but have been unsuccessful in replacing them.

ARIA roles are attributes of HTML tags. They're typically added to block-level elements to denote the role of the block's internal content.

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

## WCAG

**Web Content Accessibility Guidelines**

WCAG requirements are almost as common as Section 508 compliance. WCAG is mainly concerned with color contrast:

The difference between a background color and the foreground text color on it must meet certian contrast ratios. Try it out:

[Snook Color Contrast Checker](http://snook.ca/technical/colour_contrast/colour.html)