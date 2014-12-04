## JS Timers

1. Bring up the Timer Prompt. Give the students 5 minutes to look it over.
1. Have them pair up and share what they learned.
1. Have them share the importance of setting intervals and clearing intervals with the class.


####Timeout Demo
```
javascript
setTimeout(function(){
  console.log("(The Release of Mockingjay)")   
}, 5000)

```
####setInterval Demo
```
javascript
var pronunciation = "poh-TAY-toh"

function debate(){
  console.log(pronunciation);
  pronunciation = pronunciation === "poh-TAY-toh" ? "po-TAH-toh" : "poh-TAY-toh"
}

setInterval(debate, 1000);
setInterval(debate, 1000);
setInterval(debate, 1000);

```
But this is doing way more than it should. We want to clear intervals, for which we use `clearInterval`

####clearInterval Demo
```

javascript
// set intervalIDs to timers
timerID = setInterval(debate, 1000);
timerIDTwo = setInterval(debate, 1000);
timerIDThree = setInterval(debate, 1000);

clearInterval(timerID);
clearInterval(timerIDTwo);
clearInterval(timerIDThree);


```

## Timer Code Along
####Target Elements By ID
```
javascript
var start = document.getElementById("start");
var title = document.getElementById("timer");
var reset = document.getElementById("reset");
var pause = document.getElementById("pause");

```

####Add Event Listener to Start Clock
```
javascript
var seconds = 0;
// variable so we have something for our interval to hook onto in the global space
var timerID;

// on click we update the text field with 'Time Elapsed: 0'
start.addEventListener("click", function(){
  title.textContent = 'Time Elapsed: ' + seconds;
  timerID = setInterval(updateTime, 1000);
});

```

####But we need an updateTime function
```
javascript
function updateTime(){
  seconds++;
  title.textContent = "Time Elapsed: " + seconds;
}
```
####Great, lets set up the listener for resetting the watch
```
javascript
// When "Reset" is clicked, the text should return to "Stop Watch"
reset.addEventListener("click", resetTextAndClearInterval)

function resetTextAndClearInterval(){
  title.textContent = "Stop Watch";
  clearInterval(timerID);
  // we need to reset the seconds to zero, so that when we press start the time doesn't start at 3
  seconds = 0;
}
```
####Now let's add the pause functionality
```
javasript
// When "Pause" is clicked, the text should say "Time elapsed: 1", but stop incrementing.
pause.addEventListener("click", function(){
  clearInterval(timerID);
}); 
```
####Final Product
```
javascript
var start = document.getElementById("start");
var title = document.getElementById("timer");
var reset = document.getElementById("reset");
var pause = document.getElementById("pause");

var seconds = 0;
var timerID;

function updateTime(){
  seconds++;
  title.textContent = "Time Elapsed: " + seconds;
}

// on click we update the text field with 'Time Elapsed: 0'
start.addEventListener("click", function(){
  title.textContent = 'Time Elapsed: ' + seconds;
  timerID = setInterval(updateTime, 1000);
});

function resetTextAndClearInterval(){
  title.textContent = "Stop Watch";
  clearInterval(timerID);
  // we need to reset the seconds to zero, so that when we press start the time doesn't start at 3
  seconds = 0;
}

reset.addEventListener("click", resetTextAndClearInterval);
pause.addEventListener("click", function(){
  clearInterval(timerID);
});
```

##The Walker

To make The Walker walk across the page, we're going to have to set an interval that continually changes his position within the container element.

```
javascript
var leftBorder = 400;
var rightBorder = 700;
var theWalker = document.getElementById("img");

// Have the stick figure start at the right border and start walking left
var xPosition = rightBorder;

// sets starting position on right
theWalker.style.left = xPosition + "px";
// sets default direction
var walkingLeft = true;

function walk(){
  // When he crosses the left border, have him turn around and start walking right
  if(xPosition > rightBorder || xPosition < leftBorder){
    // flips direction and photo
    walkingLeft = !walkingLeft;
    theWalker.classList.toggle("flip-img");
  }
  xPosition = walkingLeft ? xPosition - 10 : xPosition + 10;
  theWalker.style.left = xPosition + "px";
}

timerID = setInterval(walk, 500);

// Bonus: Make him turn around when you click on him
theWalker.addEventListener("click", function(){
  this.classList.toggle("flip-img");
  walkingLeft = !walkingLeft;
});
```
