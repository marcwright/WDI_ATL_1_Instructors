# Unobstrusive Javascript

As we do with css , we now want to move all the jaavscript out of the dom. Then we will write some code to tell javascript to "listen" to event(s) on some elements of the page.

The first thing to do is to create an object that will hold all the funcitons we need, in javscript an object is defined using `{}`, it's the same than a hash, pairs of keys-values, but the values can also be a function

## remove inline events

Let's have a look at the first event inside the html: 
```
  <button onclick="alert('You clicked on the button')">I'm a button</button>
```

To refactor this , we will create an object `myApp`

```
  var myApp = myApp || {}
```

Then we will attach functions to this object.
The first one will launch all the listeners, and by convention it's called `initialize`

```
myApp.initialize = function(){}
```

Then inside this function we add a matcher for the button and tell javascript to execute a method when a specific event happens on this button:

```
myApp.initialize = function(){
  var buttonAlert = document.getElementById("alert-window")
  buttonAlert.addEventListener("click", myApp.showAlert)
}
```

It doesnt work, because the javascript code is executed before the browser read all the page , so the element with id "alert-window" doesnt exists yet.

To avoid this , we will wrap the code inside initialize in the function `window.onload`. This tell the browser to only execute the code when all the page has been loaded.

```
myApp.initialize = function(){
  window.onload = function(){
    var buttonAlert = document.getElementById("alert-window")
    buttonAlert.addEventListener("click", myApp.showAlert)
  }
}
```

## this

In javascript ,  everytime you are in the context of an object, you can access the current object using this, It's especially useful when you want to change the behavior of the current object.

In the method `myApp.initialize`, `this` represent the object myApp, in 
`window.onload`, `this` represent the window object

## Use the event object

Now if we look at the image with the 2 events mouseover/mouseout:
```
<img src="normal.jpg" width="200" onmouseover="this.setAttribute('src', 'mouseover.jpg')" onmouseout="this.setAttribute('src', 'normal.jpg')">
```

we can refactor this to use a function the event mouseover or mouseout happen. We we use addEventListener, an object event will automatically be passed to the callback function, and this object contains everything we need to change the image

```
myApp.changeImage = function(event){
  imageUrl = event.type == "mouseover" ? 'mouseover.jpg' : 'normal.jpg'
  event.target.setAttribute('src', imageUrl)
}

var image = document.getElementById("mouseover-image")
image.addEventListener("mouseover", myApp.changeImage)
image.addEventListener("mouseout", myApp.changeImage)

```

In this example, in the function `changeImage`, the object `event` contains the event name as a string under the property `type` and the DOM element on which the event happened, under the property `target`


## Continue refactoring

For the list background-color on the list, first we define the properties that this feature need:

```
myApp.colours = ["red", "orange", "yellow", "green", "blue", "purple", "silver"];

myApp.rotateCount = 0
```

Then the event handler:

```
var buttonRotate = document.getElementById("disco-button")
    buttonRotate.addEventListener("click", myApp.rotate)
```


And the method to handle the event:

```
myApp.rotate = function(){
  var listItems = document.getElementsByTagName("li");
  for(var i = 0; i < myApp.colours.length; i++){
    var listItem = listItems[i];
    var index = (myApp.rotateCount+i) % myApp.colours.length;
    listItem.setAttribute("style", 'background-color:'+ myApp.colours[index]);  
  }
  myApp.rotateCount++
}

```

Take a look at how this method use other properties of the object myApp, like `myApp.colours` and `myApp.rotateCount`

The last bit to refactor is the greeting method,

```

var nameInput = document.getElementById("name");
    nameInput.addEventListener("keyup", myApp.updateGreeting);
```

And the method:

```
myApp.updateGreeting = function(){
  var caption = document.getElementById('greeting');
  var input = document.getElementById("name").value;
  if(input){
    caption.innerHTML = "Hello, " + input + " !";
  }else{
    caption.innerHTML = "Hello !";
  }
}
```§