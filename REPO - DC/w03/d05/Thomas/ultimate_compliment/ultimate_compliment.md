# The Ultimate Compliment


## Mission…

Create your own version of [Emergency Compliment](http://emergencycompliment.com/), except make it WDI themed. When a user visits the site, they should be greeted with a WDI-themed compliment to cheer them up.

Create a new directory called `ultimate_compliment` that holds your Sinatra app. Within this folder, create the following files:

* `server.rb`
* `views/layout.erb`
* `views/compliment.erb`


## Step 1: generic compliment

When you visit the root (`"/"`) of your app, it should display a generic greeting and a randomly chosen compliment. The background color of the app should be randomized as well.

Here are some sample compliments and colors to use (feel free to substitute in your own):

```
compliments = [
  "Your instructors love you",
  "High five = ^5",
  "Is it Ruby Tuesday yet?",
  "It's almost beer o'clock",
  "The Force is strong with you"
]

colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]
```

## Step 2: personalized compliment

When you visit `"/:name"` (ie: `"/randy"`), the greeting should personalize itself to the provided name. There should still be a random compliment and background color.

## Step 3: The Ultimate Compliment!

It's Friday, have fun and go wild… create the most ostentatious complimenting system you can. We'll judge contestants at the end of the afternoon and vote on The Ultimate Compliment.

## Bonus: user submitted compliments

Allow a user to add to the list of compliments using a POST request. You can submit POST requests to the app using Postman.