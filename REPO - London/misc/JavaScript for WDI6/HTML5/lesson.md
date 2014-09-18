# Objective
- Students should have an idea of what HTML5 is
- Students understand that HTML5 created a whole bunch of new APIs
- Students understand that they're not widely supported
- Students understand how to detect whether there's support or not
- Students have a broad overview of what APIs there are available. 


# Lesson 
- Today's lesson is not just about typing. You're going to have to think for yourselves. 
- So let's recap! 
- We've used JavaScript to make our web sites more interactive. We can do things in the browser instead of on the server. 
- We've used JS to make our pages feel more responsive, and smoother for the user. 
- We've used it to make things slicker/prettier. 

- But let's take a step back. What if we weren't web developers. What if we were a business? A business that wants to make some software? 
- If we were trying to decide between making something web-based and a 'native' app, what might be our decision-making factors? 
  - What kind of stuff can we do in a native app that we can't do on the web? 
    - Offline access (ie. without an internet connection)
    - Access to webcam, microphone, etc
    - Access to printer
    - Complex graphics
    - Accelerometer access
    - Geolocation
    - Vibration motor
    - Pop-up alerts/notifications
  - What kind of stuff haven't we done in our JS apps so far? 
    - Making them work offline
    - Storing data locally
    - Manipulating the URL bar
    - Seeing whether the tab is currently active or not. 
- Well... changes are afoot. 
  - The thing about HTML5 is that it isn't actually a standard. It's a collection of proposals and implementations and suggestions. 
  - Some are better-supported than others. 
  - Some are set to become standards. Some are basically there already. Some will die on their arse. 
  - Welcome to the internet. Things change. 
  - So don't 100% rely on anything we talk about today. 
  - But there's normally a way to work around older browsers.
    - Most of what we're doing with these things is 'gilding the lily'; making them better for users, but it's not required. 


# Let's take a look. 
- **Warning**: The example JS file is a bit broken. It has a problem with popstate being called repeatedly on page load. It's a bit fucked. 
- Let's fire up our stock server from the other day. 
- It would be nice if we had a history of past stock results. 
  - And if I put them in the browser, I don't have to store them on my server.
- Let's have a look at the docs. 
  - So we can store things offline...
  - ... And see if we've got something when the page loads. 
- So, let's modify our AJAX call to store the past quotes each time we retrieve them. 
- And modify our page to show them if they're present. 
- Refactor the JS to make this easier. 


# Your turn 
- One of the concerns you all had yesterday was that the URL doesn't update when we do our AJAX requests. 
- Well, we can do that. We can use the HTML5 history API. 
- It's got two methods: a pushState method, that you can use to store some state AND update the URL. 
- And there's a popState method, that you can get one state back with it. 
- It's a stack! Remember we talked about those at lunchtime? A FILO queue. 
- So...
  - Whenever we get a new stock symbol, we should call pushState to save the new data and update the URL. 
  - Whenever the user clicks 'back', our window object gets a `popstate` event. You should register an event handler that receives it, and restores the page state. 
  - Maybe you'd like a utility method that takes a JSON object and updates the page state? That you could use from your AJAX method too?
  - Don't worry about the historical results... unless you really want to. 
