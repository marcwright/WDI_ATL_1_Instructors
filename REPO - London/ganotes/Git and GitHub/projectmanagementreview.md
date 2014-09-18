# Working as a team with Git: a review

- So we've seen git a bit, and we've used Github for homework submissions. 
- And also to keep up with the class notes. 
- But this is the first time you've used it as part of a group to collaborate. 
- None of this is set in stone; you get to decide what makes sense for your group. 
- Git is a tool, or an instrument; if I'm playing classical music on my guitar and you're playing thrash metal, neither of us is right or wrong. 
  - But if I'm playing classical on a double-necked electric and you're playing thrash on a nylon-strung classical guitar, maybe we're working against ourselves...


# Getting started: initial setup. 
- The scenario: you want to work with a couple of other programmers on a project. 
- One of you should set up a git repo on Github. The others should clone it.
  - And the person who set it up should make sure you can push to it. 
- The others in your group now clone that repo. 
  - They can then do their work in it, and then push to that repo. 

# Your daily routine
- Take a look at Github, and see what's changed. 
  - Review a diff: https://github.com/ga-students/WDI_LDN_4_Work/commit/57c4ee6f96245f331041d289722fddefabd0e552 _s
    - Keeps you updated with what others are doing. 
    - Helps spot bugs
    - Try to understand what they're doing. 
  - `git pull` on master to get their changes. 
    - Did it merge cleanly? 
    - If not, fix it up. 
  - Work work work...
  - Go home clean! 
    - Push at the end of the day. 

# Work work work...
- So what actually is work work work? 
- You probably don't have to worry about production/dev branches for this project. So 'master' is your main code base. 
  - But you might want to use feature branches. Especially if something is going to take more than a day or two, and you're going to work with someone else. 
  - You can have your own local branches that don't get pushed to github. 
  - Branches can be short-lived. 
- So you clone your repo, and you're ready to get started. 
  - Make a branch for your work. Maybe include the Trello card ID in the branch name. 
  - Do your work. Commit when it makes sense.
    - That is, when `git diff` shows you some self-contained work that doesn't rely on later stuff.
    - It's good practice to `git diff` before committing anyway, to double-check what you're going to commit. 
    - You can use `git diff` and `git add` to build up a changeset. 
  - When you're done, merge it down to your master branch. `git merge --no-ff`. 
  - Git push to share your changes with the world. 
- If you want to collaborate on branches, you'll need a tracking branch.
  - Read the docs.
  - But it just means that git understands that your branch called 'foo' is related to the branch 'foo' on the remote. 

# Other tips
- Talk to each other
- Don't be afraid to throw code away. 
  - Git branches make it easy to experiment. 
- If it's not written down, you'll forget.
  - Bugs
  - Ideas
- Documentation helps
  - How do you get a project up and running? 
  - Readme.md
