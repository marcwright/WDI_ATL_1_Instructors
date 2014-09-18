# Objective 

- Students understand what AJAX is
- Students understand what's going on under the hood
- Students understand how they can use it to make their apps more responsive
- Students understand the concept of a callback 
- Students understand how they can use it to check for new updates. 


# Lesson 

- AJAX! What is AJAX? 
  - Asynchronous JavaScript And XML
  - We use it to do stuff in the background
  - Such as making our pages feel more responsive by not requiring a full page load. 
  - Or pulling in content after our page has loaded. 
- What's JavaScript? 
- What's XML? 
- What's 'Asynchronous'? 
  - JavaScript is defined as 'single-threaded', which means 'can only do one thing at a time'. 
  - And network access is slow!
- In reality, we don't use XML all that often any more. Often we use JSON, but nothing says it has to be. 

- An AJAX request consists of a few things. 
  - We need a URL to call, and maybe some data to go with it. 
  - We need a callback function: something that runs when we get our data back. 
  - Generally, we need two: one that runs on success, and one that runs on failure. 


## Jumping in
- Let's build a simple HTML page for a stocks page. 
- And a simple Sinatra app to give me a quote for a given stock symbol. 

### Starting point: startingpoint.zip
- Hipchat them the startingpoint.zip file.
- Unzip it
- Don't look at the Ruby! Let's reverse-engineer it. 
- Run it
  - requires gems 'sinatra', 'sinatra-contrib', 'yahoofinance', 'json'. 
- Visit http://localhost:4567
- Tour the app:
  - Home page. Pretty boring. 
  - It's got a form. Where does it submit to? 
  - It posts to a location, which then redirects us to that page.
  - And loading that page shows us a stock quote. 

### What's wrong with that? 
- Nothing! 
- It works fine! 
- But... what if the user loads a page, and then walks away to get a coffee? 
  - When they come back, it'll be out of date. And not obviously out of date. 
- We could make it autorefresh with pure HTML. 

  ```
  <meta http-equiv="refresh" content="1">
  ```

  - But this is kinda ugly. If the web server is slow, then they could come back to an error page. 
  - And what if the user's trying to do something, like type into a text box and we refresh it out from under them? 
- So maybe we could just make it update via JavaScript. 
  - But... remember when we said that JavaScript is single-threaded? 
  - And we saw it lock up the browser, and the page? 
  - Network access is SLOOOOOOW. We'd have a lot of pauses. 
  ```
  var now = new Date();
  var currentDate = null;
  do { currentDate = new Date(); } while (currentDate-now < 5000);
  ```
  - And means your other code can't run. 

### AJAX! 
- So we can make it update via JavaScript in the background.
- It's just a web request! 
  - But instead of it originating from the web browser, it's originating from our code. 
  - The browser still makes the request, but it's driven by our JS - not by clicking links or submitting a form. 
- A little like me getting coffee. I could go out and get coffee...
  - But then you're all stuck here, waiting for me to return. 
  - Empty space.
  - And if I have to go grab something from the table outside...
  - Still empty space. The same empty space. 
- But what if I ask Imran to get me coffee? 
  - I can keep on teaching. I just don't have my coffee yet. 
  - I can do other stuff, simpler stuff, until I'm caffeinated. 
  - And if I'd asked Imran to grab something from the table outside, then I can tell you a different thing. 
    - He'll be back in a moment, so you should definitely wait. 
    - He's gone a bit longer, come back in 10 minutes. 

### So how do we do it? 
  - Browsers give you a think called the XMLHttpRequest object. Mostly... (IE)
  - We need an endpoint we can call. 
  - And we should request JSON data back. 
  - Now we've got it back, we need to do something with it. 
  - And we need to do something different if it fails. 
- And we need something that runs it. 
  - Hook it into the form button.

- How do we do this in jQuery? 
  - Include jQuery on the page. 
  - jQuery gives us a handy .ajax() method. 
    - It takes a bunch of parameters: 
      - url
      - complete - always runs
      - error - a function that runs on error
      - success - a function that runs on success
      - dataType - the type of the returned data that we're expecting. 
      - data - some information to send to the server. 
      - type - the HTTP method to use. 
  

  - We can also do this differently, using function chaining. 
    - done(), fail(), always().

- Let's make this better. 
  - Progress indicator.
  - Error messaging
  - Highlight elements when we load them in. 

- What else can we do with AJAX? 
  - We can check for users posting new content, like Twitter showing '3 new tweets' at the top if you leave a page open. 
  - We can do *partial rendering*, where we render part of the page on the server and send the new content to the browser. 
    - Could do this for pagination. 
    - Could do this for switching between tabs. 
    - Can reduce server load times, because we don't have to generate the entire page all at once. 
  - We can send data back to the server. In our example, we've done it as part of the URL, via a GET request, but we could have used the `data` property instead. 

- What's the point? 
  - Smaller web requests
  - Makes pages feel more 'alive'
  - Lets us update pages without forcing the user to hit refresh


## Lab
- Let's build a simple chat site. 
- Not database-backed, just in-memory. 
- You'll need a simple Sinatra app.. let's knock one out. 
  - Each line of text should have a username, a datestamp, and the line of text. 
  - When someone connects, we should render the past 10 lines of history. 
  - And we need a way to submit the line of text. 
  - Let's do AJAX-only for now; when someone submits, they should get all the history they've missed. 
  - And we should have a method to get all the history since a certain date. 
- Now it's your turn. Write the interface. 
- You're going to need an HTML input box for the line of text, and let them pick their names. 
- And you'll need to keep track of the most recent date stamp in JavaScript. 
- When the user submits a line of text, you need to write an AJAX function that submits it to the server. 
- And when you get the result back, you should append it to your chat listing. 
- Maybe a list? 


# Bonus material: demo of a blocked program
