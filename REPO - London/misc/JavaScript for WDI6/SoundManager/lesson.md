# Working with other libraries: SoundManager

## Objective
- Students understand that we can use JavaScript to interact with other people's services, or make our browsers do cool things. 
- Students can use the SoundManager 2 code to play sounds in their browser
- Students can build an app that acts like a daft punk drum machine. 


## Lesson
- So we've seen some native JavaScript, and we've seen jQuery, which lets us do a bunch of stuff more easily. 
- Remember how we said that jQuery is just a library? SoundManager is just a library. 
  - It's probably overkill for what we're going to do today, but it's a fun example of working with other libraries. 
  - And it runs locally, so we don't have to worry about rate limiting. 

- So what is Sound Manager? 
  - It's a library that lets us work with sound files. 
  - We can do some of this with native HTML5 now, but...
    - SoundManager is more powerful
    - And SoundManager will automatically (and transparently!) use Flash as a fallback if it's not available. 
- Let's demo this by building a basic MP3 player. 

### Codealong
- soundmanager-startingpoint.zip contains an "empty" project based on the notes below. 
- Tour of the app: 
  - We've got a Sinatra app. We're only doing this to serve files from a server; it is the smallest sinatra project possible. 
  - It's just `require 'sinatra'`!
  - We've got a copy of jQuery in the `public` directory.
  - And we've got a copy of something called SoundManager. What is SoundManager? Let's read the web page. 
    - http://www.schillmania.com/projects/soundmanager2/
  - We've got an index.html... it's fairly bare-bones right now. 
  - And that references a music.js... which is also empty. 
- Let's look at the documentation for SoundManager. "Getting started". 
  - It's got setup instructions! Let's do that. 
    ```
    soundManager.setup({
      url: '/swf/',
      preferFlash: true, 
      onready: function() {
        var mySound = soundManager.createSound({
          id: 'aSound',
          url: '/drumloop.mp3'
        });
        mySound.play();
      }
    });
    ```
    - We've told SoundManager where to find its flash files with the URL parameter. 
    - We've told it to prefer flash; it sometimes gets a bit janky with MP3 playback if we don't. 
    - And we've given it a callback parameter. 
    - That's created a sound... 
    - ... and then told it to play.

  - So we got our browser to make sound. That's our sanity check. Let's make our play button work. 
    - It's a link... so we need a click handler. 
    - So let's do our 'standard' JS boilerplate. 
      - App module
      - Setup method
      - Click handlers. 
      ```
      var myPlayer = myPlayer || {};

      myPlayer.play = function() { console.log("Not implemented yet."); };

      myPlayer.setup = function() {
          $('#playbutton').click(function(ev) { ev.preventDefault(); myPlayer.play(); });
      };

      soundManager.setup({
          url: '/swf/',
          preferFlash: true,
          onready: myPlayer.setup
      });
      ```
    - The soundManager documentation says that the 'onready' callback will fire after the DOM is loaded. 
    - So we don't need to put this inside a jQuery `$(document).ready`... though we could if we wanted. 
    - Our soundManager.setup calls our myPlayer setup...
    - ... which registers a click handler on our link...
    - ... which calls a myPlayer.play method that we haven't written yet. 

    - Let's make it play. 
    ```
    myPlayer.play = function() { 
      var sound = soundManager.createSound({
        id: 'track', 
        url: '/drumloop.mp3'
      });
      sound.play();
    };
    ```

- Styling break
  - Bigger font
  - Centered on screen
  - No underline
  - NB THE BELOW IS UNTESTED
    ```
    p { 
      font-size: 400%;
      text-align: center; 
    }

    p a { 
      text-decoration; none; 
    }
    ```

- So... we can play our song. But we can't pause it. 
- What should happen when we try? 
  - The music should pause. 
  - The page symbol should probably have turned into a pause button when we started playing, and turn into a play button when we pause it. 
  - Our click handler should make the music start again after we click the pause. 
- So now we're starting to manage our page state a little bit. 
  - We need to know whether we're currently playing any music. 
  - If so, our page should pause when we click. 
  - If not, it should resume. 
- This is just a simple example; we should also change our state when the track finishes playing. 
  - It's left as an exercise for the reader. 

### Data attributes. 
- One way we can do this is through data attributes. 
- jQuery lets us keep arbitrary data on our DOM elements, using the `data()` method. 
  - We can initialise it by using an attribute in our HTML... but it won't be kept updated. Beware! 
  ```
  <p id="testp" data-test="foo">

  $('#testp').data('test'); // "foo"
  $('#testp').data('test', 'aardvark');
  $('#testp').data('test'); // "aardvark"
  ```
  - Inspect the element... it's still foo. 


- So let's do this for our app. 
  - Update the setup method so it has the state. 
    ```
    myPlayer.setup = function() {
        var $playButton = $('#playbutton');
        $playButton.click(myPlayer.playClickHandler);
        $playButton.data('state', 'stopped');
    };
    ```
  - Write that playClickHandler function:
    ```
    myPlayer.playClickHandler = function(ev) {
        if ($('#playbutton').data('state') == 'playing') {
            myPlayer.pause();
        } else {
            myPlayer.play();
        }
    };
    ```
  - Update that play function to manage the state: 
    ```
    myPlayer.play = function() {
        var song = myPlayer.getSong();
        var $playButton = $('#playbutton');
        $playButton.html('&x275A; &x275A;'); // Update play button with a pause button
        if ($playButton.data('state') == 'stopped') { // Play if stopped, otherwise resume
            song.play();
        } else if ($playButton.data('state') == 'paused') {
            song.resume();
        } else {
            console.warn("myPlayer is in an unexpected state: " + $playButton.data('state'));
        }
        // Keep my app state in sync
        $playButton.data('state', 'playing');
    };
    ```

  - And write a pause function. 
    ```
    myPlayer.pause = function() {
        console.debug("myPlayer.pause()");
        // Pause whatever song is currently playing
        var song = myPlayer.getSong();
        song.pause();
        $('#playbutton').html('&#9654;').data('state', 'paused'); // Update symbol and state
    };
    ```

### Exercises for the reader
- Fix up the state when the track stops playing. 
- Count the number of plays/pauses/resumes/finished tracks
  - And show them in the page
- Add multi-track support. 




## Lab: iDaft
- Hey, check this thing out: http://www.najle.com/idaft/
- But it's in Flash! 
- Flash is SOOOOO 2007. 
- Surely we know enough to do this in JavaScript now? 
- Go for it. 



### Archive: The old setup instructions. 
- Let's create a new directory in our classwork. 
- And create a public directory, with a js subdir and a swf subdir. 
- Browsers have a security policy that stops files being loaded off the hard disk sometimes, so we're going to have an empty Sinatra app so all of our content. 
  - `echo "require 'sinatra'" > main.rb`
- Let's download jQuery and soundManager.
  - jQuery goes in our public/js folder. 
  - soundManager/script/soundmanager.js goes in public/js
  - All the files from soundManager/swf/ go in public/swf

- Set up a basic index.html
- Get a basic page up and running
