Websockets
=============  

Install node (do as prework for lesson)
----------------------------------------

For websockets we need to use a different server than rails.  Some of you may of heard of Node. It is written in javascript and the main difference to rails is that it acts asynchronously.  this means it can do lots of tasks at the same time. In addition it is fast and light weight. First let's install node:  <http://nodejs.org/>  


Overview of traditional internet
--------------------------------

In week 1 we looked at how the internet works. 

- Request/response is the general way the internet works. 
  - Reminder that the internet is stateless.
    - The web server has no idea who you are when you make a request. 
    - Cookies get around that, by giving a client something to be remembered by. 
      - The server says "Here, hold this red hankerchief, and use it whenever you ask something." 
      - So when the client says "Can I have page X, please?" it waves the red hankerchief. 
      - And the server can say "Oh, I remember this guy with the red hankerchief, he's totally logged in." Or not, if not. 
  - And broadly speaking, the server drops the connection after every single file. 
  - That's HTTP, of course. That describes how web servers and browsers can talk to each other. But how does the data actually get there? 
  - We touched briefly on this; anyone remember TCP? IP? 
    - This stuff is more low-level than HTTP. HTTP sits on top. 
    - Our data gets broken down into packets, and each packet is sent across the network.
    - There's a thing that the web doesn't use, called UDP. User Datagram Protocol. 
    - It's really simple: basically just throws packets out onto the network, and forgets about them. 
      - It doesn't guarantee what order they'll be received. 
      - It doesn't guarantee IF they'll be received. 
      - Ideal for games! You just want the latest positions of all the world objects. If stuff gets dropped, we don't care. 
      - Good for VoIP too. If you get the occasional glitch or dropped packet, it's better than more latency.
    - Transmission Control Protocol is for stuff that we care a bit more about. 
      - Guarantees the ordering of data received.
      - Guarantees (as much as possible) that data will get through. 
      - How? 
        - Handshakes on connections. 
          - Server, are you ready? 
          - Yes, client, I'm ready.
          - Cool, here comes some data. 
          - (The data). 
  - So every single time we want to make a web request, we've got to do that handshake AS WELL AS the HTTP request. 
  - This is no big deal for web pages. 
  - But... what if we want to do a lot of requests? 
    - Get notifications when someone likes our cat picture on Facebook? 
    - Get new tweets for our timeline? 
    - Get chat messages? 
    - Get game actions for a multiplayer game? 
  - It's not so ideal any more, is it? 


Websockets  
------------  

- Hence, websockets.
- A web socket holds a connection open between the client and the server, and either end can send messages. 
- Your app no longer needs to say, regularly, "Got any new content?". When there's new content, it will receive a message.
  - Which sounds like a natural fit to event-driven programming to me...
  - You've changed your app from 'pull' to 'push'.
    - Pull: the client goes "Got any new content?" regularly. New data is pulled down by the client. 
    - Push: the client sits & waits until it gets told there is new content. 


- Let's build a chat app. A chat app that doesn't poll for new content. 

Express
---------

Express is a framework for node.  First let's install express:

```  
    npm install express  
    npm install -g express-generator  
```  
This is a bit like gem install. We need these two applications to help us create a node app.

We can set up a basic lightweight node server manually. This would be similar to setting up a sinatra app.  
However for we can also use express to scaffold an app for us.  For this situation we will use express.  

```  
    express socketApp  
```  
Have a look at the files created - it looks similar to what rails creates for you.  

```  
    cd socketApp   
    npm install  
```  
npm install is a bit like bundle - it sets up all the dependencies for the app.  
 
 First of all subl . and take a look at the views, routes, public folders.  See what you think happens when we run the server.


Let's see what express has set up for us.  
```  
    npm start  
```   
Navigate to localhost:3000.  You should see the express welcome screen.  Navigate to /users and the route given responds with text.  Navigate elsewhere and you get an error.

Great we have a working server!  However the template we have is in jade.  Jade is fantastic - it is a more avanced, cleaner version of haml. However this isn't a lesson on jade.  In the index.jade file delete all the content.  Then have just this as the only line in the file:  
```
    include index.html
```  
In the views folder create an index.html.  Add some html to it (html tab) and a title and then check that this is being rendered by the server.   


Chat App
----------

We're going to build a chat app with websockets.  In index.html:  

```  
  <html>  
    <head>  
      <title>GAChat with web sockets</title>  
    </head>  
    <body>  
      <h1>GAChat v2</h1>  
      <p class="connecting">Please wait, connecting to server...</p>  
      <form action="#">  
      <input id="nick" type="text" placeholder="Enter your name" disabled="disabled" />  
        <ul class="chatlines"></ul>  
        <input type="text" id="text" placeholder="Enter text here" disabled="disabled"/>  
        <input type="submit" value="Speak!" disabled="disabled" />  
      </form>  
    </body>  
    </html>  
```  
  
Let's also include some css.  In public > stylesheets > style.css:

```  
    html {
    background-color: #eee;
  }

  body {
    max-width: 960px;
    margin-left: auto;
    margin-right: auto;
    font-family: sans-serif;
  }

  h1 {
    text-align: center;
    border-bottom: 1px solid #aaa;
    margin-bottom: 40px;
  }

  p.connecting {
    max-width: 400px;
    background-color: #dd9;
    padding: 10px;
    border-radius: 5px;
    margin: 0 auto 40px;
    text-align: center;
  }

  ul.chatlines {
    max-width: 600px;
    border: 1px solid #aaa;
    background-color: #ccc;
    min-height: 50px;
  }
```  
In the layout.jade it linked to the stylesheet.  However we have bypassed the layout so we need to link to the sylesheet there. 

```  
    <link rel="stylesheet" href="stylesheets/style.css" />
```  

Let's also create an app.js file inside our public > javascripts folder and link to that in our index.html file:  
```  
    <script src="javascripts/app.js"></script>
```  
Test to make sure this is inlcuded (add an alert of console.log to the file)   

We could write this in angular - however we are going to go back and practice a bit of jquery.  

We need to include socket.io and jquery in our app.  Let's just use a publically hosted versionin our app for both.
```  
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.socket.io/socket.io-1.0.6.js"></script>
```  

We also need to install socket.io for use on the server side: 

```  
    npm install socket.io  
```  

We need to set up socket on the server side:

In bin > www: 

```  
  var io = require('socket.io').listen(server);

  io.sockets.on('connection',   function (socket) {
    console.log('A new user connected!');
    
    socket.emit('info', { msg: 'A user connected' });  
});
```   

In our app.js file we want to respond to the 'info' event.

```  
    var socket = io.connect(); 

    socket.on('info', function (data) {
        console.log(data);
    });
```

Restart the server and refresh the page.  It tells us a user conencted!  Let's open up a new incognito window and go to localhost.










