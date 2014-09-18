# Practical Git

## Objective
- Students stop keeping multiple versions of their own files
- Students can use Git to get their old work back. 
- Students can use Git more to figure out what they've changed. 

## Lesson
- So a couple of people have said that they broke all their code yesterday, and they had to keep their own backup files to keep it safe. 
- And neither of those things should be true! 
- We should be using Git to handle both of these. 

## How do you want me to do this? 
- We're going to take a look at getting back to earlier versions, but there's a couple of approaches to take. 
  - I can either just give you the commands, and you can write them down and trust me on it. 
  - Or we can google for answers together, and figure it out step-by-step. 

## How often should I commit? 
- The answer always is "More than you currently are." 
  - Whenever you add a new feature
  - Whenever your code is working
  - Whenever you feel the urge to copy your program to a backup file
- It's like saving or passing a checkpoint in a game. 
  - So whenever you're about to take on a lot of enemies
  - Or about to do something risky
  - Or jump off a ledge you're not sure you should jump off. 

## Scenario 1: I've made some changes, and I don't want them any more.
- Make changes
- git status
  - READ THE MESSSAGE
  - git checkout modifiedfile.rb
  - Your changes are gone! 

## Scenario 2: I've staged something I don't want any more. 
- Make changes
- git add
- Two options! 
  - Just forgot something? Edit it, and re-add it. 
  - Don't want it staged any more? READ THE MESSAGE
  - git reset HEAD stagedfile.rb

## Scenario 3: I've made some changes, and committed in the meantime, and I want to get back to those earlier versions. 
- Think in Judo terms: don't be in that situation in the first place. 
  - If you think you might be doing that, create a new branch and do your work there. 
    - If it works out, you can merge your branch to master.
    - If it doesn't work out, you can switch back to your master branch and all is good. 
  - If you just want to see your older code, it's probably easiest to browse it on Github.
    - Do you want a demo, or can you see that one for yourself? 
- But sometimes that doesn't work out. Sometimes you do want to go back several steps. 
- Some git shortcuts: 
  - HEAD refers to the latest commit. 
  - HEAD^ refers to the commit before the latest commit. 
  - HEAD^^ refers to the commit two commits back. 
- Go back to an earlier version: 
  - git log --oneline and pick your commit hash. 
  - git checkout abc123
  - Lot of text! But it's telling you what you can do. 
  - Make changes, or commit, and everything's cool. 
- Just undo the last commit
  - git revert HEAD

