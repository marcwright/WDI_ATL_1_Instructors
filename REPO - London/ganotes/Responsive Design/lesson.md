# Responsive Design

## Objectives 
- Students understand why we use responsive design
- Students understand the principle of mobile-first design
- Students understand the UX issues behind mobile interfaces
- Students can use media queries to choose different layouts for different devices. 
- Students can pick appropriate breakpoints for their devices
- Students can use the dev tools to test their designs. 

## Web principles (framing)

- Why are we building web apps at all? Why not native apps? 
  - Works on any device
  - We keep control (not really relevant)
    - Easy updates
    - No license fees
  - Backward compatible
  - Open standards
- But working on any device doesn't mean it's going to work well on any device.
  - And a big factor of that is the size of the screen. 
- Screens come in different sizes. 
  - Desktops: http://blogs.msdn.com/cfs-filesystemfile.ashx/__key/communityserver-blogs-components-weblogfiles/00-00-01-29-43-metablogapi/5775.1_2D002D00_Screens_5F00_499FE465.jpg __a
  - Tablets: http://techzil.com/wp-content/uploads/2012/06/Android-Tablets-Sizes-Compared-560x381.jpg
  - Samsung: http://hexamob.com/wp-content/uploads/2013/06/Does-Samsung-make-too-many-phones4-209x300.png
  - Phones: http://static.guim.co.uk/sys-images/Guardian/About/General/2011/11/1/1320143576426/Pile-of-smart-mobile-phon-007.jpg 

- One way we could solve this problem is to build a separate mobile version of our site. 
  - But then I'm stuck maintaining two versions.
  - Or, more likely, one version will atrophy.
  - And routing becomes complex.
    - What if someone clicked a link to the mobile site, and you detect they're on a desktop?
    - Or the other way round?
    - You're never going to get it exactly right, and it's a distraction. <M-F5>
- So maybe there's a better way. 
- Maybe we could make one site that adapts to various screens? 


## A starting point 
- Let's take some time to build this simple web page. 
- I've given you some markup; now style it up. 
  - Don't use absolute sizes! 


## How did you do this? 
- I tried to give some hints in the class names. 
  - I used some semantic names ("portrait") and some that are a little presentational ("offset-by-one-third")
  - And I used the box-sizing: border-box trick, on everything. 
  - And after that... it was just widths, really. 


## And this looks OK right now. 
- But what happens if I resize it? 
  - Header images "go all broken". 
  - Columns get impractically small
  - As does the footer text. 
- How does this look on a mobile device? 
  - Unreadable! 


## Responsive design: enter the media query. 
- We can't nest rules in CSS. 
  - We can in SASS, it expands it out for us nicely. 
  - However. We *can* nest things within a media query. 
- So, what's a media query? 
  - It lets us apply different CSS rules based on how the user is viewing our document. 
  - Could be display size
  - Or display orientation (ie. portrait or landscape)
  - Or display type (different on projectors, screens, and printed)
  - Or some other things that we don't care about. 
- So we can serve different CSS to different devices. There are a *lot* of devices. What are we going to support?
  - All of them? That's a lot of testing.
    - A lot of testing every time you change something. 
  - Just what your users use.
    - Reasonable decision. But you'll need analytics. 
    - And maybe it's a chicken and egg situation: maybe nobody's using your site on iPhone because it's HORRIBLE on an iPhone. 
  - Just phones.
    - Maybe. Which phones? 
- It depends! 
  - You have to decide. 
  - Maybe with the business. 
  - But if you push me to make a decision, then design with 3 versions: mobiles, tablets, desktops. 
  - We call the point where things change over 'breakpoints'. 


## How do we do it? 
- Let's check it works first. 
  ```
  @media (max-width: 480px) { 
    body { 
      color: red;
    }
  }
  ```
  - Size it down smaller...
    - All our text is red! 
- Now we know we *can* change the styles applied at varying sizes. 
  - But what do we want to change it to? 
    - Stop using columns
    - Fix up margins
    - Make some big elements smaller
    - Hide some things completely. 
- I'm going to fix up those 'points' first. Inside the media query: 
  ```
  .one-third, .two-thirds, .one-half { 
    width: 100%;
  }
  ```
  - And now they stack one on top of the other, instead of getting squeezed up. 

## A word of warning. 
- Let's say I have some CSS like this in my page. 
  ```
  section p { 
    color: red;
  }

  p { 
    color: blue;
  } 
  ```
  What colour will my paragraphs be within my sections? 
  - Red, because of specificity. 
  - In CSS, the more specific rule gets applied. And two selectors are more specific than one. 
  - **Media queries do not count towards specificity.**
    - ie. `p { color: blue; }` and `@media (max-width: 480px) { p { color: red; }}` have EXACTLY THE SAME SPECIFICITY. 
  - This means that you must define your mobile overrides last. Otherwise your "normal" stying will override it. 


## Your turn
- Let's see what you can do on your own for a bit. Take half an hour and try to make a mobile-phone friendly version of this page. 
  - If you have enough time, try a tablet version too. I'd recommend a breakpoint of 768px.


## My version
- Here's what I did on mobile: 
  - Fixed up the header, putting them in circles instead of leaving them portrait-style images. 
  - Made the font-sizes smaller in the headlines and bigger in the footer. 
  - Fixed up the margins in the footer to something more visually pleasing. 
  - Hid the side image entirely. 

- And on tablets: 
  - Adjusted the header so it was still circles, but kept the proportions. 
  - Kept the three-column layout but tweaked the font sizes and added some dividing lines between the divs. 
  - Stretched the quotes out to full-width, and indented them a bit. 


## How can we test this? 

- Up until now we've been testing this by resizing our browser. How else could we do this? 
- There's a Chrome plugin, called Dimensions, that makes it easy for us to set our browser to a specific size. We don't have to guess.
- But this isn't going to give you the same results as actually viewing it on a mobile device. 
- Chrome has some tools built in that help you test your designs. 
  - Open up the dev tools
  - Open up the console using the little >E button. 
  - Switch to the 'Emulation' tab. 
  - And you can then choose which device you'd like to emulate. 


## it doesn't work! 
- Oh no! Our nice responsive design doesn't work! 
  - What's up with that? 
    - Mobile browsers LIE
    - Mobile devices are COMPLEX
    - The iPhone has 640x1136 pixels in its display. 
    - My laptop has 1280x800.
    - It's 3x the size, but only has around 150 more pixels in each dimension?! 
    - The iPhone's pixels are smaller. So its pixel density is larger. 
  - So, mobile browsers will lie about their dimensions. 
    - So you can see "normal", unresponsive sites, and get an overview of them. 
      - Better to see the whole thing zoomed out and let you pick which bit to zoom in on rather than just seeing a top-left corner, right? 
    - Or, if not lie, bend the truth. It'll tell you about its *viewport*, which is not the same as its *screen*. 
    - The iPhone browser will, by default, tell you that it's got a viewport of 980px. (https://developer.apple.com/library/iOs/documentation/AppleApplications/Reference/SafariWebContent/UsingtheViewport/UsingtheViewport.html). 
    - And those 640 pixels? They're physical pixels, but the iPhone will report "logical" pixels, and tell you its only got 320 of them. 
    - So it should get our version with a max-width of 480px. 
- We can fix this using a meta tag to tell the browser that we know what we are doing. 
  - Try `<meta name="viewport" content="width=device-width" />` to set your viewport to be the same as the device width. 
  - Or, maybe we're going to have a design that takes up 500px of size?
    - `<meta name="viewport" content="width=500, initial-scale=1" />`
      - Set the viewport to be 500px...
      - And set the initial scale so we can see all of it. 
      - Including the initial-scale=1 is fairly standard, even if we use width=device-width. 
    - You can set other properties like this: 
      - user-scalable=yes or no, to stop the user scaling the page. 
      - maximum-scale and minimum-scale, which takes a number so you can stop people zooming in and out too far. 

## Lab
- Your task is: use media queries to do some ridiculous things. 
  - We've used media queries to do the eminently sensible things, like show different designs to users on mobile and desktop browsers. 
  - But that's not all we can do with them. 
  - Use your imagination!
    - Let [this tweet](https://twitter.com/tinysubversions/status/408612270458302464) be your inspiration:
      > "Net art" and "net artist" are such loaded terms. I prefer "weird internet stuff" and "weird internet stuffer" as alternatives

- Build a simple page that: 
  - Shows COMPLETELY DIFFERENT content to desktop, mobile, and tablet users.
  - Shows something COMPLETELY DIFFERENT to users when in portrait and landscape mode.
  - Prints out something COMPLETELY DIFFERENT to what the user sees on their screen. Some sites show a big "This article was printed from TheGuardian.com" or similar at the top when documents are printed.
  - Shows something COMPLETELY DIFFERENT when projected rather than viewed on the screen. 






