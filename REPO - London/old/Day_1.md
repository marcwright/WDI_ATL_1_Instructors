# Day 1

## Agenda

| Time | Topic | Objectives
|:----:|-------|------------
|9:00 - 10:15|Introduction|Get to know each other & set course expectations
|10:15 - 10:45|Software Development Process Overview|Identify members of software teams and their process
|**10:45 - 11:00**|**Break**
|11:00 - 12:00|UNIX Basics|Navigate and create files efficiently
|**12:00 - 1:00**|**Lunch**
|1:00 - 2:00|Sublime Text Basics
|2:00 - 3:00|Project management with Trello
|**3:00 - 3:15**|**Break**
|3:15 - 5:00|Git & GitHub|Use GitHub to manage code and collaborate
|5:00 - 5:30|Class Closing, 1:1's, Start HW|Homework, Extra Resources


| Time | Topic | Objectives
|:----:|-------|------------
|9:00 - 10:15 | Introduction | Get to know each other & set course expectations

## Introduction
- Introduce the team, instructor, TAs, other staff  - 10mins
- Get students to talk to each other - Names, why are you here, what's your guilty pleasure? 2 mins each
- Surprise! Tell the class about the person next to you. 1 min each

## Class Culture
- Break into groups (4-ish) and get them to discuss what they want their training to be like - 5mins
- how do they want to treat each other?
- how do they want to work together?
- how do they want to be treated by the instructor team?
- how do they want to treat the instructor team?
- what do they want to do about mobiles/facebook?
- what do they want to do if someone misses classes?
- Discuss their answers - 15mins

## Class Structure/overview
- Daily flow - lecture/workshop/homework
- The "I" of WDI is "immersive" - there'll be little in the way of slideshows, and much in the way of diving through code
  - Type stuff to learn it - if you copy and paste commands across HipChat (though you're welcome to) you will learn less
- A whole lot of coding, during class and after, especially after with homework
- Projects to pull all the ideas together
- 1:1’s / Reflection Time
  - Encourage Blogging/Tweeting

## This Week...
- Unix & Sublime Basics
- Version control
- Introduction to Ruby
  - Basics (grammar, syntax, directives)
  - Beyond basics (Hashes, Arrays, Blocks)
  - One step beyond (Inheritance, mix-ins, exception handling)

## Give an overview of the rest of the day and write the agenda on the board


| Time | Topic | Objectives
|:----:|-------|------------
| 10:15 - 10:45|Software Development Process Overview|Identify members of software teams and their process

## Software Teams
- Who are the members of a software development team? ASK!
- Developers! (yebbut... what can developers do?)
  - Front end (html/css)
  - Back end (app & DB – Rails, for this course – but there are others)
  - both?
- Designers (can developers be designers?)
- Sysops – server management
- Project managers
- Clients! - bad software development teams forget the client is part of the team

### others
- Development Manager, Project Manager, Solutions Architect, Technical Architect, UI Designer, UX Designer, Functional Analyst, Lead Developer, Developer, DBA, Quality Assurance, Deployment, Trainer, Domain Experts...)
- Some teams have all of these... some have one or two...

* Project management methodologies
- Waterfall
- Agile
- BDD / TDD / Red-Green-Refactor / no tests...


| Time | Topic | Objectives
|:----:|-------|------------
| 11:00 - 12:00|UNIX Basics|Navigate and create files efficiently

## UNIX – what is it?
- “in the beginning was... the command prompt”

## Navigating the command prompt
- What is the Terminal / Command prompt
- Navigate directories / folders
- “ls”   “ls -a”    “ls -l”
- “cd”   “cd ..”   “cd ~”
- “pwd”
- Tab completion
- Keyboard shortcuts
  - |keypress|action|
    |--------|------|
    |Ctrl + A|  Go to the beginning of the line you are currently typing on
    |Ctrl + E|  Go to the end of the line you are currently typing on
    |Ctrl + L|  Clears the Screen, similar to the clear command
    |Ctrl + U|  Clears the line before the cursor position. If you are at the end of the line, clears the entire line.
    |Ctrl + H|  Same as backspace
    |Ctrl + R|  Let’s you search through previously used commands
    |Ctrl + C|  Kill whatever you are running
    |Ctrl + D|  Exit the current shell
    |Ctrl + Z|  Puts whatever you are running into a suspended background process. fg restores it.
    |Ctrl + W|  Delete the word before the cursor
    |Ctrl + K|  Clear the line after the cursor
    |Ctrl + T|  Swap the last two characters before the cursor
    |Esc + T|   Swap the last two words before the cursor
    |Alt + F|   Move cursor forward one word on the current line
    |Alt + B|	  Move cursor backward one word on the current line
    |Tab    |   Auto-complete files and folder names

## Managing files
- “touch” to create files
- “cp”
- “mv” to rename or move
- “rm”
- “mkdir”
- “rm -rf” - WARN!!


| Time | Topic | Objectives
|:----:|-------|------------
|1:00 - 2:00|Sublime Text Basics

## Text Editors – What are they, and what are they for?

## Sublime as a choice – it's a tool for the job, and the one we're going to use.
- Open up all the files in this directory with Sublime (subl .)
- Switch between tabs using (cmd+alt+arrow)
- Switch to a certain file using (cmd+p)
- Find text using (cmd+f)
- Close tabs using (cmd+w)
- Command palette (shift + cmd + p)
- multi-selection (alt-f3 / ctrl+cmd+g)

- Quit a program using (cmd+q)

- subl configuration
  - custom themes / colour schemes
  - extensions - package manager, sidebar plugins

  - Package control
    ctrl+`
    import urllib2,os;pf='Package Control.sublime-package';ipp=sublime.installed_packages_path();os.makedirs(ipp) if not os.path.exists(ipp) else None;open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read())

    GitGutter
    Sidebar Extensions

- Fonts:
  http://www.tobias-jung.de/seekingprofont/
  http://sourceforge.net/projects/sourcecodepro.adobe/files/latest/download

- User settings change:
  {
    "color_scheme": "Packages/Color Scheme - Default/Solarized (Dark).tmTheme",
      "highlight_line": true,
    "highlight_modified_tabs": true,
    "translate_tabs_to_spaces": true,
    "trim_trailing_white_space_on_save": true,
    "highlight_active_indent_guide": true,
      "tab_size": 2,
    "font_face": "Source Code Pro Light",
    "font_size": 13,
    "caret_style": "phase"
  }


## Sublime and UNIX activity
- Open a new terminal window
- Navigate to your Desktop
- Create a new directory
- Create a new text file in that directory and open it with Sublime.
- Add some dummy text to the file. Save and close the file using keyboard shortcuts in Sublime.
- Rename the text file you just created.
- Open in Sublime again to check the content is still there.
- Delete the file you just created.
- Delete the directory you just created.


|2:00 - 3:00|Project management with Trello
- What is Trello - 10mins
  Trello is a collaboration tool that organizes your projects and ideas into boards. In one glance, Trello tells you what's being worked on, who's working on what, and where something is in a process.
  - from FogCreek... a "good" software company
- Other tools exist... Pivotal Tracker, Redmine, Basecamp, lots of others.
- The concept is of a card, with a summary on the front, and more detail on the back.
  - lots of Agile teams use a variation of this kind of card process - post-its; spreadsheets chopped up
- The benefits are that it can be shared, assigned, accessed anywhere...

- let's sign up (5 mins)
  - Register or Google account

- go through the features on the welcome board 20mins


- create a "portfolio project" board
  - add a card to create a portfolio site
  - add a card to add placeholder content


|**2:45 - 3:00**|**Break**



| Time | Topic | Objectives
|:----:|-------|------------
|3:00 - 5:00|Git & GitHub|Use GitHub to manage code and collaborate

## Intro to Git (3:00 - 3:30)

**Objectives:**

* Explain what Git and GitHub are
* Initialize a repo and make commits with Git
* Undo commits

**Activity:**

* Explain why students are learning to use a GitHub and provide context to how web developers use it.
* Using the whiteboard, explain what GitHub is and how local files are committed and pushed to the server.

git config --global user.name "Your Name"
git config --global user.email you@example.com

- ssh copying from Github
  cd ~
  ssh-keygen -t rsa
  cat ~/.ssh/id_rsa.pub | pbcopy

* Demonstrate using Git by having students follow along with you.
  * Create a new directory and a new text file.
  * Use “git init” to initialize a git repo
  * Use “git status” to see where your files are at
  * Use “git add .” to start tracking files
  * Use “git commit -m” to commit changes with a message
  * Use “git log” to see all commits that have been made
  * Configure user name and email
  * Add remote origin
  * Push to GitHub
  * View the files on GitHub
* Show how you would make changes and undo changes.
  * Make changes to your text file locally and push the changes to Github.
  * Undo commits using git log, git reset


## Git Exercise (3:30 - 3:45)

**Objectives:**

* Practice making commits to Github

**Activity:**

* Have students make changes to their local files and practice committing them to GitHub.
* They should practice editing their existing text file and adding new ones.

## Branching (3:45 - 4:15)

**Objectives:**

* Explain why you would use branching
* Create a new branch to make changes
* Merge changes back to master

**Activity:**

* Using the whiteboard, explain how branching works and why you would use it.
* While students follow along with you, create a branch and make changes to a few files. Demonstrate how to merge changes back into master


## Collaboration in GitHub (4:15 - 4:30)

**Objectives:**

* Manage collaborators in GitHub
* Pull from GitHub and make changes

**Activity:**

* Explain how GitHub makes it easy for software teams to collaborate on one code base.
* Pick a student to act as your collaborator
* Add them as a collaborator on Github
* Show how to pull
* Have them edit one of the files then commit and push to Github

## Building Your Portfolio Site (4:45 - 5:00)

**Objectives**

* Start building a portfolio site on GitHub

**Activity:**

* Explain the importance of having a portfolio online.
* While students follow along with you, create a portfolio site hosted on GitHub.
  * Create a new repository username.github.com
  * Make a “portfolio” directory
  * Initialize the repository
  * Sync it with GitHub
  * Create a readme.md file in the directory with some text contained in it
  * Push the changes

* Go back to our Trello board, and mark the tasks as complete :-)





| Time | Topic | Objectives
|:----:|-------|------------
| 5:00 - 5:30|Class Closing, 1:1's, Start HW|Homework, Extra Resources

## Homework - Extra Resources
- Point students to some of these these supplemental resources. They are grouped by topic, so students should review the material for the areas where they need more clarity or are curious.
- Software Development Process
  - [Waterfall](http://en.wikipedia.org/wiki/Waterfall_model)
  - [Scrum](http://bit.ly/14qzd)
  - [Agile Dev](http://en.wikipedia.org/wiki/Agile_software_development)

- Sublime
  * [5 Things You Didn't Know Sublime Could Do](http://www.netmagazine.com/features/5-things-you-didnt-know-sublime-text-2-could-do)

- Command line
  - [Find out what 'man' is](http://en.wikipedia.org/wiki/Man_page)

- Git & GitHub
  * [Git Immersion](http://gitimmersion.com/)
  * [learn.github.com](http://learn.github.com/)
  * [Pro Git](http://git-scm.com/book)


