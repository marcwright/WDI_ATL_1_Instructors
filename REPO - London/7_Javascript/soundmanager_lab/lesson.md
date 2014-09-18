# Working with other libraries: SoundManager

[i:]
## Objective
- Students understand that we can use JavaScript to interact with other people's services, or make our browsers do cool things.
- Students can use the SoundManager 2 code to play sounds in their browser
- Students can build an app that acts like a daft punk drum machine.


## Intro
So we've seen some native JavaScript, and we've seen jQuery, which lets us do a bunch of stuff more easily.

Remember how we said that jQuery is just a library? SoundManager is just a library too, and we're going to have a play with it.

It's probably overkill for what we're going to do today, but it's a fun example of working with other libraries.

And it runs locally, so we don't have to worry about bandwidth or maximum requests being exceeded for an API.

### So what is Sound Manager?
It's a library that lets us work with sound files.

We can do some of this with native HTML5 now (all the music app projects did), but...

- SoundManager is more powerful
- And SoundManager will automatically (and transparently!) use Flash as a fallback if HTML5 is not available.

Let's demo this by building a basic MP3 player.


## Codealong

[i]: Zip and share the starting-point code with the students to start the lesson.

### Tour of the starting point

- We've got a Sinatra app. We're only doing this to serve files from a server; it is the smallest sinatra project possible.
- It's just `require 'sinatra'`! (and a route to the public index.html file)
- We've got a copy of jQuery in the `public` directory.
- And we've got a copy of something called SoundManager.
- We've got an index.html... it's fairly bare-bones right now.
- And that references a music.js... which is also empty.


### What is SoundManager?

Let's read their (web page)[http://www.schillmania.com/projects/soundmanager2/]

The documentation has a "Getting started" section.

And it's got setup instructions! Let's do that.

```
  // music.js
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


So we got our browser to make sound. That's our sanity check. Comment it out for future reference, and let's make our play button work.


## Play a sound

We have a link in our HTML... so we need a click handler.

- Let's do our 'standard' JS boilerplate.
  - App module
  - Setup method
  - Click handlers.

```
  var myPlayer = myPlayer || {};

  myPlayer.play = function() { console.log("Not implemented yet."); };

  myPlayer.setup = function() {
    $('#playbutton').click(function(ev) {
      ev.preventDefault();
      myPlayer.play(); 
    });
  };

  soundManager.setup({
      url: '/swf/',
      preferFlash: true,
      onready: myPlayer.setup
  });
```

The soundManager documentation says that the 'onready' callback will fire after the DOM is loaded.

So we don't need to put this inside a jQuery `$(document).ready`... though we could if we wanted.

- Our soundManager.setup calls our myPlayer setup...
- ... which registers a click handler on our link...
- ... which calls a myPlayer.play method that *we haven't written yet*.

Let's make it play.

```
  myPlayer.play = function() {
    var sound = soundManager.createSound({
      id: 'trackId',
      url: '/drumloop.mp3'
    });
    sound.play();
  };
```

But it would be "better" if we kept the logic of *which* sound out of the play function.

```
  myPlayer.play = function() {
    var sound = getSound();
    sound.play();
  };

  myPlayer.getSound = function() {
    if (!myPlayer._currentSound) {
      myPlayer._currentSound = soundManager.createSound({
        id: 'track',
        url: '/drumloop.mp3'
      });
    };
    return myPlayer._currentSound;
  };

  myPlayer._currentSound = null;
```


## CSS break

- Bigger font
- Centered on screen
- No underline

```
  // css/styles.css
  h1 {
    text-align: center;
  }

  p {
    font-size: 400%;
    text-align: center;
  }

  p a {
    text-decoration: none;
  }
```


## Back to JS

So... we can play our sound. But we can't pause it.

What should happen when we try?

- The music should pause.
- The page symbol should probably have turned into a pause button when we started playing, and turn into a play button when we pause it.
- Our click handler should make the music start again after we click the pause.

So now we're starting to manage our page state a little bit.

- We need to know whether we're currently playing any music.
  - If so, our page should pause when we click.
  - If not, it should resume.

This is just a simple example; we should also change our state when the track finishes playing.

- Maybe you can try that after the lesson...


### Data attributes.

One way we can do this is through data attributes.

jQuery lets us keep arbitrary data on our DOM elements, using the `data()` method.

We can initialise it by using an attribute in our HTML

```
  <!-- index.html -->
  <p id="test_element" data-test="foo">

  // browser console
  $('#test_element').data('test'); // "foo"
  $('#test_element').data('test', 'aardvark');
  $('#test_element').data('test'); // "aardvark"
```

- Inspect the element... it's still foo. *It's only changed in jQuery's 'data' structure.

Update the setup method so it has the state.

```
  myPlayer.setup = function() {
    var $playButton = $('#playbutton');
    $playButton.click(myPlayer.playClickHandler);
    $playButton.data('state', 'stopped');
  };
```

Write that playClickHandler function:

```
  myPlayer.playClickHandler = function(ev) {
    ev.preventDefault();
    if ($('#playbutton').data('state') == 'playing') {
      myPlayer.pause();
    } else {
      myPlayer.play();
    }
  };
```

Update that play function to manage the state:

```
  myPlayer.play = function() {
    var sound = myPlayer.getSound();
    var $playButton = $('#playbutton');
    $playButton.html('&#10074;&#10074;'); // Update play button with a pause button
    if ($playButton.data('state') == 'stopped') { // Play if stopped, otherwise resume
      sound.play();
    } else if ($playButton.data('state') == 'paused') {
      sound.resume();
    } else {
      console.warn("myPlayer is in an unexpected state: " + $playButton.data('state'));
    }
    // Keep my app state in sync
    $playButton.data('state', 'playing');
  };
```

And write a pause function.

```
  myPlayer.pause = function() {
    console.debug("myPlayer.pause()");
    // Pause whatever sound is currently playing
    var sound = myPlayer.getSound();
    sound.pause();
    $('#playbutton').html('&#9654;').data('state', 'paused'); // Update symbol and state
  };
```

### Exercises for the reader

- Fix up the state when the track stops playing.
- Count the number of plays/pauses/resumes/finished tracks
  - And show them in the page
- Add multi-track support.


## Lab Time: iDaft

Hey, check this thing out: http://www.najle.com/idaft/

But it's in Flash!

- Flash is sooooo 2007.
- Surely we know enough to do this in JavaScript now?
- Go for it..

[i:] Share the daft_wdi_soundkit.zip file which contains all the wavs.


