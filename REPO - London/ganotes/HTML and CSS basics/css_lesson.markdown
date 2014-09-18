# CSS

## What is CSS? 
  - Cascading Style Sheets
  - A way of describing the appearance of a web page. 
  - If HTML describes the structure of your page, the CSS describes the presentation. 

## What does 'cascading' mean? 
  - The Cascade is the way that declarations 'tumble down' to the elements. 
    - User agent stylesheet (built in to the browser)
    - Options set by the user
    - Then the document author
      - External file
      - In the top of the page
      - On a specific element
  - specificity
    - More specific selectors take priority. 

  - What's a child element? 
    - The DOM
    - It's a tree
    - Everything has a parent, generally.

## It's best to look at an example. 
  1. Add a <link rel="stylesheet" href="example.css"> to your web page's head section. 
  2. Create a file called example.css in the same directory as example.html. 
  3. Add "body { background-color: red; }" to example.css. 
  4. Hit 'refresh' in your page. The page is now red! 
  - This isn't because we like red pages; it's because it's obvious to see it's having an effect so we know it's working properly. 

- In CSS, later rules overwrite previous ones.
- Browsers load their own stylesheets first. That's what made our bare HTML page look like it did. 
- These defaults can be different from browser-to-browser, so we generally use a reset stylesheet to 'flatten out' the differences. 
  1. Grab reset.css from http://meyerweb.com/eric/tools/css/reset/reset.css
  2. Include it
  3. Hit refresh

## We can include multiple files; the browser will include them all and apply all their rules to your document. This can be a useful technique to help you organise your CSS. 

## Let's do some basic styling. 
- body
  - A nicer font (font-family).
  - Background colour 
  - Margins and max-width. 

- H1 centred
- Img
  - Add a class (portrait), talk about what classes are. 
  - Float it right, talk about positioning.
  - Add a left margin and max-width. 

- H2: dotted line above, margins.
- Links: colours, colours for pseudoclasses (hover, visited). 
- Footer: 
  - Different colour background and text
  - Display: block
  - Smaller font
- Clear: both

- Measurement units

- Aside, ul
  - Add div class=likes
  - border-box: box-sizing
  - 50% size, inline-block
  - border-radius
    - talk about prefixing
    - look on MDN for support: [docs](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius#Browser_compatibility)
  - Mention this is how we do two-column layouts. 

- Footer
  - Different colour
  - Min-height
  - Wrap everything else in a div so we can do it without the margins. 



## Resources
- Box model: https://developer.mozilla.org/en-US/docs/Web/CSS/box_model?redirectlocale=en-US&redirectslug=CSS%2Fbox_model
- CSS reference: https://developer.mozilla.org/en-US/docs/Web/CSS/Reference
- Reset stylesheet: http://meyerweb.com/eric/tools/css/reset/reset.css

