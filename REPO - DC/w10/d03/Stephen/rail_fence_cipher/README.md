## Rail Fence Cipher

You're going to implement a __Rail Fence Cipher__, also known as a "ZigZag" Cipher.

####Directions

1. Take 5 - 10 minutes to read the [Rail Fence Cipher wikipedia page](http://en.wikipedia.org/wiki/Rail_fence) until you can explain the concept in plain English. 

1. Open the `SpecRunner.html` file found in the `js` directory. To make the Jasmine test pass, you'll write your code in `js/src/rail_fence_cipher.js.`

1. Write an `encode` function that takes a single string and encodes it using a Rail Fence Cipher with 3 rails. __Note:__ You can assume no spaces and all input is valid.

```javascript
encode("WEAREDISCOVEREDFLEEATONCE") // => "WECRLTEERDSOEEFEAOCAIVDEN"
```
#### Bonus

* Once your test passes, write an encode function were you can specify the number of rails you want.
* Hungry for more? Write a decode function.

#### Just for fun

When you are successful writing an encode function, open up the `index.html` file. In the console, call the `play` function and pass in as an argument the encoded output of "YOUKNOWNOTHING"
