# Objective 

- Students can use Require.js to modularise their JS code
- Students understand why we use it. 

# Lesson 

## Setup

- So yesterday we saw some techniques for making our code nicer to work with. 
- We put it in namespaces or in closures to stop our code from trampling on other code. 
- But it's a bit... primitive compared to what we had in Ruby, isn't it? 
- We don't have modules or mixins or gems, or requirements. 

## Enter Require.js 
- Require.js lets us write our JS as modules, which are self-contained bits of code. 
- You can tell Require.js what your modules require, and it'll make sure they get loaded first. 
- This lets us keep our code separate - **loosely coupled** - and in smaller chunks. 
  - And it can also glue it all back together into one file for performance reasons later. 

## Let's jump in. 
1. Create a new folder in the classwork. 
2. Get a copy of Require.js: http://requirejs.org/docs/download.html
