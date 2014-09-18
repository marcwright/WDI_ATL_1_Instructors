#Cats, Dogs & Pandas?

Warmup to practice manipulating the DOM & Events with jQuery. You should use jQuery for all of the following.

###Step 1

Using JavaScript:

* Create a cat image with a class of "cat" and add it to the body.
* Create a dog image with a class of "dog" and add it to the body.
* Create a panda image with a class of "panda" and add it to the body.

###Step 2

When the mouse moves within the body, console.log the x and y coordinates. [The docs on mousemove](http://api.jquery.com/mousemove/) may be helpful here.

###Step 3

Instead of using console.log, replace the text of the h1 with the current coordinates of the mouse.

###Step 4

When the mouse moves, change the css of each of your images so that the margin-left and margin-top change along with the x and y coordinates of your mouse. [Read the docs on css](http://api.jquery.com/css/). Try dividing the x and y coordinates by a factor (anywhere from 6 - 20) before setting your margin, and make this factor different for each image.

###Step 5

Have it so that when you click on any image, it either adds or removes the ".border" class

###Step 6

Have it so that when you click on the body, it freezes position of the images. [Check out off](http://api.jquery.com/off/)

###Step 7

If I click on an image now, for some reason it is freezing the position of all the images. All I want it to do is add or remove the border though. How do I stop that from happening? Hint: Check out Event Propagation.

###Bonus

Emulate the effect on the background color found on [this site](http://color.hailpixel.com/)