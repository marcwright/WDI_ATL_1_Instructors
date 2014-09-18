# Week 0

Priority for the week is to reassure students about the start of the course, ensure that their machines are all working, and that they are far enough through the pre-work. Typing speed should be a particular concern.

## Week 0, Day 1

Intro to WDI by producer

- Intro: Introductions
  - Intro to Instructor team
  - Introductions to each other
  - Expectation-setting
  - Classroom culture

- Intro: Installfest


# Week 1

Ease into the course. Day one is quite gentle - and then things start for real on Tuesday.

Make sure you have set expectations for the coming weeks, and be diligent about reinforcing the classroom culture and code of conduct. Introduce the idea of "Stuck for 15 mins? Ask the instructors!" - discourage them from trying for hours to find their own solutions... it's not an effective use of time.

Be observant for any cliques forming early among the students, and encourage mixing by enforcing a 'Day 2 Rule' of 'You must sit in a different chair, next to a different person'.
After day two, allow them to sit wherever they like (they're adults after all), but encourage mixing by highlighting the benefits of working with different people, and by using the 'lab partners' app regularly to allocate teams.

If there's any reference to how particularly hard any part of the course is (people have frequently, historically, been scared by tales of javascript week), then dismiss the claims as exaggerated, and reassure them that the topics are well planned, and by the time they get to that point of the course, they'll be very familiar with the concepts).

## Week 1, Day 1

Let them know that today (and most of this week) a lot of the content is designed to build on the pre-work material - so if they got far with the pre-work, they should find some of the material a good refresher.
The coding starts tomorrow in earnest - some students will very much have preferred to coded today... 


- Things I wish I new before I learnt to code
- Intro: UNIX Basics/Command Line
- Software Development Process Overview

break

- Intro: Networking/Internet Basics

lunch

- Intro: Effective text editing

break

- Into: Git & Github
  - After the lesson, ensure the students have the homework and classnotes repos forked and cloned, and have done one PR.

Homework: Day 1. Review resources. Git-real codeschool


## Week 1, Day 2

* Write on the board the 'Day 2 Rule' of 'You must sit in a different chair, next to a different person'.

```
    # pondering making it a Ruby 'joke'
    day_two do |you|
      puts "please sit somewhere else!" if [same_chair, same_person].include?(you)
    end
```

review yesterday

- Intro: Learning curve expectation
  * framing their level of expectation of work for the rest of the course. We will frequently refer back to the "learning curve diagram we drew" during tricky points of the course.

- Intro: Finding stuff out - RTFM, STFW

- Ruby: basics

break

- Ruby: Strings, Conditionals, Loops

lunch

- Ruby: Functions

break

- Ruby: Lab time. "Calc-It" lab
	- Calc-it review

Homework: extending calc-it


## Week 1, Day 3

- Homework review
  * Dicuss the general feeling about their completion of the homework. Note a few sticking points for review in a second (any areas that a majority of the class were stuck with)
  * Get a volunteer up to present their work - if no-one voluteers, pick someone based on who was vocal in the previous discussion
  * Run through their app and then code; poke and prod the UI to find the limits, then go through the code to correct any errors.
  * __When they leave the desk to return to their seat - thank them, congratulate them and tell everyone to give them a round of APPLAUSE (don't leave them to slink back to their chair in silence)__

- Ruby: Debugging Ruby
- Ruby: Arrays

break

- Ruby: Symbols & Hashes

lunch

- Ruby: Blocks and enumeration

break

- Ruby: Lab time. 'Lab Partners' Lab

Homework: MTA lab

## Week 1, Day 4

- Homework review
  - The 'MTA Homework' may require a long review. Allow an hour or so to be safe.

break

- Ruby: Object Oriented Programming

lunch

- Ruby: Lab time. Property rental app lab

break

- Ruby: Review of the concepts of OO

Homework: Extend the rental lab


## Week 1, Day 5

- Homework review
- Ruby: Happitails code-along.
  * Take a measure of the class at this point - do they need a guiding hand with a code-along, or could they (at a preference) do in groups of up-to three.
  * Whether it's a code-along or not, congratulate them during the review about what they've produced during the last couple of hours - compare that to what they would have been able to do at the start of the week.

lunch

- Spare/extra lesson time (command line, git, etc)
- Intro: Reflection

break

- Reprise the week

Weekend Homework: GA Stock Exchange (or maybe an 'asset library' homework - so no API lookup)

To the Pub!


# Week 2

Lots more new knowledge to impart, and lots of introductory topics to cover. Beware of the mood of the class, and don't be afraid of reviewing the plans for the days if they need it.

## Week 2, Day 1

- Homework review

- HTML/CSS: HTML intro
  Need to ensure that the pre-work was actually completed. If they *do* know the stuff, then this lesson should just be revision (and some might be a bit bored).
  Ensure that everyone knows how to create an HTML document, structure basic tags, and open it in the browser.

break

- HTML/CSS: HTML intro continued

lunch

- HTML/CSS: CSS

break

- HTML/CSS: CSS continued, Box Model

Homework: Ecardly - PSD to HTML/CSS


## Week 2, Day 2

- Homework review
- Databases

break

- Databases

lunch

- CS: Binary + Hex intro #TODO: review lesson plan

- Databases

break

- Databases: 'Facebook' lab

Homework: Advanced SQL on W3Schools and DB Q&A


## Week 2, Day 3

- Homework review
- Sinatra: Intro

break

- Sinatra: Calc demo app

lunch

- Sinatra: Stock lab

break

- Sinatra: 'Links' code-along. Routing demo.

Homework: Calc-it in sinatra


## Week 2, Day 4

- Homework review
- Sinatra: Movies with database code-along.

break

- Sinatra: Movies with database code-along.

lunch

- Ruby: Inheritance, Modules + Mixins #TODO: alter lesson plan - ten minute reference to inheritance, and then into modules

break

- Sinatra: REST
  - intro to the concepts of REST to prepare for the homework
  - Work through the general idea of REST and mapping resources to routes, and the actions to operations in the DB.
    - This should tie nicely into last night's homework, where some people may have solved it with seperate 'get' and 'post' methods to two different paths for calculating the answers (though others will have used just one method)
  - Start from a skeleton Sinatra app, and then build out the 'index', 'new', and 'create' actions.

Homework: Continue 'To-do' app - complete the 'show', 'edit', 'update' and 'delete' actions and views.


## Week 2, Day 5

- Homework review

break

- Ruby: PlingPlangPlong code test and benchmarking

lunch

- reflection
- review the week

break

start on homework

Weekend Homework: Memetube


# Week 3

Week 3 is the "Rails Week". On Tuesday - the first day of Rails - make a big fuss about how nice it's going to be when we first intro Rails (draw smiley faces on the board, whoop and cheer in scrum, etc). 

Monday is an opportunity to ensure concepts from the previous two weeks are consolidated - if there's anything they need to revise, or any lessons that got skipped for any reason, here's a chance to cover them again.

If desired, it could be useful to spend time covering database abstraction - to get students a greater appreciation of the help than ActiveRecord is going to give them, and also to get some practical experience of inheritance.
The 'db_base.rb' file, and the 'Sinatra Cookbook' app cover this.


## Week 3, Day 1

- Homework review
- Sinatra: cookbook lab

lunch

- Sinatra: cookbook lab

break

- Sinatra: cookbook lab

Homework: Extend Sinatra Cookbook


## Week 3, Day 2

- Homework review
- Rails: Intro to Rails - rolling

break

- Rails: Intro to Rails cont - a stroll around the structure

Lunch

- Rails: Routing and views
- Rails: View helpers

break

- Rails: Lab time. Routing and views - Pop Fanzine of choice

Homework: MTA on Rails


## Week 3, Day 3

- Homework review
- Rails: Models

break

- Rails: Migrations

lunch

- Planets app code-along - model planets and their attributes

break

- Rails: Lab time. Planets app continued

Homework: Countries app - model countries and their attributes


## Week 3, Day 4

- Homework review
- Rails: Debugging Rails - logs, better-errors, Rails panel

break

- Rails: Associations

lunch  

- Rails: Associations lab
 * Have the students add associations to the countries app from yesterday - either change primary language to be an association (but that means removing the existing form fields and DB column) or add 'economy' (communist, capitalist) or 'hemisphere' (whatever it is, make it just a one-to-many - no many-to-many, and no self-referential association. (though they can elect to add their own extra associations in homework if they want to play)

- Rails: View partials

break

- Carry on with our 'countries app' associations, and chopping the views into partials


## Week 3, Day 5

- Homework review
- Rails: Asset Pipeline

break

- Rails: Deploying to heroku

lunch

- reflection

break

- reprise

Homework: Cookbook on Rails
  * Try to arrange for time after the reprise to get a headstart on the homework, with the instructors around until end-of-play.


# Week 4

This is the build-up to 'project 1', and the chance for both the students and the instructional team to get aware of the spread of acquired knowledge across the group.

To practice repeatedly working on one application over time, the previous weekend's homework is used repeatedly in the first half of the week, for students to go back to and incorporate new topics.
Students will get exposed to the fact that incomplete functionality can effect future development, and that new changes can break pre-existing working code.

The Wednesday night homework is used to get a measure of how much each student can accomplish in one evening, so can be extrapolated to give an expectation for the amount of work that can be completed in four days (Monday-Thursday of Week 5).
Make this clear to the students, so that they don't work themselves silly trying to get a "complete" app on Wednesday, but rather, they see how much they can do in four hours.

Give the project options on Thursday night, and allow them the evening to cogitate on the implications of each - and encourage them to discuss together in the evening. When making project choices on Friday, have a discussion first about the general scope of each, and make it clear that there is no *easy* choice or *hard* choice, but just three different fully-functional Rails apps, which happen to have slightly different focuses.


## Week 4, Day 1

- Homework review
- Rails: Validations

break

- Rails: Lab time. Add validations to Cookbook

lunch

- Rails: Advanced Finders - Joins & Include

- Rails: Filters & Callbacks

break

- Rails: Lab time. Cookbook - validations, filters, etc.
  - An opportunity for students who didn't get the weekend homework finished to polish their cookbooks, while everyone tries to incorporate the lessons from the day.

Homework: Extend cookbook


## Week 4, Day 2

- Homework review
- Rails: Authentication
  
break

- Rails: Lab time. Add authentication to Cookbook

lunch

- Rails: Authorisation
- Rails: Authorisation with CanCan Gem

break

- Rails: Lab time. Cookbook authorization and authentication 

Homework: Codeschools Rails Best Practices #TODO: Find something better than this - the students generally complain about it :-( 


## Week 4, Day 3

- Homework review
- Rails: Searching with Ransack

break

- Rails: Lab time. Searching cookbook

lunch

- Rails: File uploads with Carrierwave
- Rails: Lab time. Uploading images to Cookbook

break

- Start on Homework

Homework: WDIMDB


## Week 4, Day 4

- Homework review

break

- Ruby: 10 lines, no more

lunch

- Rails: Pagination

- Intro: Trello - project management tools

break

- Ruby: Turing Teen - 'Bob' TDD exercise


Homework: Finish "10 lines" & think about project definitions
  * At the end of the day, spend time going through the project definitions one-by-one, then publish them in hipchat.
  * Encourage the students to spend the evening thinking about the three choices; the pros and cons of each, but not to make any hasty choice.
  * Don't suggest that any is particularly harder or easier, but that rather, they each have different focus, but all have exactly the same core functionality and deliverables.


## Week 4, Day 5

- Homework review
  * Go over all remaining '10 lines' so that everyone has presented theirs
  * Ruby: 'Bob' exercise review.

- Rails: Acts as list

- Reprise

break

- Reflection

Project choices
  - Make sure that everyone has made their mind up about which project they want to do.
  - To dissuade hesitation, allocate corners of the room to the different choices (putting an instructor in each), and on a command, have them move to that part of the room, or have them write their name and choice on paper/post-it to be collected by instructors.
  - Note who has chosen which. If any students are struggling, and have chosen otherwise, suggest to them that they work on the music app. It has a smaller scope, and is easy to explain functionality to them, and to manage their delivery.

lunch

Project time all afternoon
 - Start with a group brainstorming - all the people doing each project choice should discuss together for an hour. Then an instructor should join the group to offer comments on their observations.

Homework: Project 1!
  - Over the weekend, discourage coding - although don't "forbid" anything.


# Week 5

Project 1 week - check in with all the students on Monday to make sure their planning is on track, and keep on top of the expectations for delivery on Friday. Assign one instructor to keep an eye on each topic group. Reiterate the principle of "Stuck for 15 mins? Ask the instructors!"

Homework all week is to work on their projects - remind them how much time they would spend in the evening if *we* were assigning topics, so try to keep up that pace in the evenings to make as much progress as possible.

Make it clear that the large part of their model functionality is working in the console by Tuesday evening - TicTacToe games should be playable, and classrooms should be bookable.
If there's any concern that progress isn't being made toward this, help them along in broad terms (for instance, simplify associations for the Schedule Planner, or run an example of how to design a TicTacToe game model with associated Players and Moves).

Keep lesson topics for the mornings only, and make the lessons on Monday and Tuesday things that they can incorporate into their projects if they get a chance.
Wednesday's lessons are better being tangental or interesting, unrelated topics - as they almost certainly won't have time to include them in their projects.


## Week 5, Day 1

- Rails: Environment variables and s3 uploads

break

- Rails: Scopes

lunch

- Project work review
  - Check in on weekend planning, and set expectations for the day

Project time all afternoon


## Week 5, Day 2

- Rails: Sending email

- Project work review

lunch

Project time all afternoon


## Week 5, Day 3

- Project work review

Lunch

Project time all afternoon


## Week 5, Day 4

Project time all day
  - Discuss with the other instructors the general expectation of each student's work, and organise presentation order to be (in general) with the least functional project first, and the most functional last.
  Interleave the projects so that two of the same theme are not presented subsequently (if at all possible)


## Week 5, Day 5

Project final prep

Project presentations
  - Arrange the room differently to introduce a different feeling to the day - it's a special day, so make it so
    - move all the desks against the walls. This prevents students from sitting behind their laptops (and using them while others present)
    - Sit the instructors in a row at the far end of the room - like an interview panel - further away from the presenter than the rest of the students. 
      - This guarentees that if the instructors can hear, the whole class can hear. 
      - Also, no students can read over your shoulder 
      - And, you can see every other student's reaction to the presentations
  - After the presentations are complete:
    - The group needs to be sincerely congratulated for their hard work. Praise their efforts, dedication, and outcomes. Declare how impressive it is to see such achievement after only four weeks of study. SOUND SINCERE!
    - Some things to mention: 
      - That some of the work is almost on par with some final project work we've seen.
      - Speculate how much more room there is to improve over the next two-thirds of the course.
      - Reinforce the learning curve that was set in week one - that the majority of new learning has been covered, and from now on, it's new techniques and tools, but they're generally variations of what we now know.
      - The next seven weeks' practice will be practice, practice, practice of those first weeks' knowledge.
    - Make a few bottles of champagne (or equivalent) appear - and something for the non-drinkers. And toast their achievement.
    - End on the news (which they will have probably assumed) that there's no homework for the weekend.

No homework over the weekend.


# Week 6

Week 6 is JS week - and experience has show it to be a delicate topic to deliver. There's a balance to strike between getting students through the concepts, and confusing them with strange new syntax.

Frequently refer to how it's "just the same" as what they've been doing in Ruby - just different :-)
Revert back to the gently-gently encouragement of week 1 when they make small typo errors, and syntax gaffes.


## Week 6, Day 1

- Javascript: JS intro and codealong

break

- Javascript: JS intro and lab

lunch

- Javascript: Working with the DOM basics and events

break

- Javascript: Calc-it lab

Homework


## Week 6, Day 2

- Javascript: Unobtrusive JavaScript

break

- Javascript: Unobtrusive lab - convert the calculator to something unobtrusive

lunch

- Javascript: jQuery

- Javascript: jQuery lab

Homework: GA ATM


## Week 6, Day 3

- Homework review

- Javascript: AJAX

break

- Javascript: AJAX

lunch

- Project reviews
  - While we feedback about their performance in Project 1, allocate the class some 'Exercism' code tests to complete.

Homework: Javascript. Simple chat site (sinatra/jQuery)


## Week 6, Day 4

Homework review

- Javascript: HTML5 APIs

- Javascript: HTML5 stock planner lab

lunch

- Javascript: Working with external code - SoundManager 2

- Javascript: SoundManager lab

Homework: No homework! Night off.


## Week 6, Day 5

- How do I compare to other developers (chat) # TODO: write an outline

- Rails: Rails Remote Forms
  * We've done some JS, and learnt manual AJAX
  * Now we need to spend a little time looking at the "Rails way" of incorporating JS.

break

- Rails: Rails Remote forms

lunch

- Reflection

- Reprise: review the week

- Todo app with JS, or JS in Project1

Homework: Continue Todo app with JS, or JS in Project1


# Week 7

Week 7 is now over the half-way mark of the course, and we should have a good idea of what sort of outcomes each student should be looking for. If there's anyone who is a particular concern, that they may not reach junior web dev capabilities, it's urgent to raise it with the producer (if you haven't already).

The content for the week if very flexible - it consists of a combination of exposure to lots of useful libraries and gems, and of concepts that will help them into the final few weeks.


## Week 7, Day 1

Homework review

break

- Rails: HAML
  - It's not essential that the learn HAML (and certainly not before project 2), as there's very little chance they'll end up as a Rails developer. But the general idea of HTML abstraction; with HAML, SLIM or anything else, is something they *will* need to know about as a junior developer.

lunch

- Rails: SASS
  - Similarly to HAML, the teaching of SASS is because it's in Rails, but the lesson is more about introducing the idea of dynamic CSS rather than the specifics of one solution.

break

- Rails: Lab time. Convert Planets App to HAML/SASS

Homework: finish planets app conversion


## Week 7, Day 2

Homework review

- Rails: Devise

break

- Rails: Devise in Todo

lunch

Rails: Devise and Oauth - Authenticate with Google

- Rails: Oauth facebook/twitter/github

- Homework: continue oAuth


## Week 7, Day 3

Homework review

- Ruby: TDD with rspec

break

- Ruby: TDD Lab. Coin change code test - pair program

lunch

- HTML/CSS: Responsive Design

break

- Project 2 Definitions
  - Allocate project teams (groups of three, ideally) based on performance in Project 1. Organise the groups so that they consist of one of the most successful project 1 scores, one of the least high, and one middling. Re-arrange if you're concerned about personalities that might clash, and ensure that there's a spread of front-end/back-end/organisational skills in each group (as much as possible).
  - If you're asked about the group choices, the answer is "they're random draws, then we just make sure that no group is full of all front-end skills, etc"
  - Ensure that there's enough project definitions for all teams - you should not have two teams do the same project. Ideally, have one more project than teams, so that everyone gets a 'choice'.

Homework: Consider project choices
  - Show the whole class all the project choices, then let them go away for the evening to weigh up the pros-and-cons of each.

## Week 7, Day 4

- Javascript: Waypoints JS

break

- HTML/CSS: Responsive lab

lunch

- Project choice with Ruby golf contest
  - Pick projects by having a 'code golf' competition. The ranking in the code golf determines the choices of projects.

project time
  - Starting with project 2. The teams need to be sure that by the weekend, they are happy with their planning, and with how they're going to use git.
  - Inform them to beware of not taking notice of the given MVP.
  - Let them know that "we'd anticipate that the scope of the project to be about the same scale as project 1; rather than being able to get lots more done because there's three of them. Because we'd expect them to spend a lot of time discussing solutions and tripping each other up".
    - This pre-frames them for the troubles of team work - and sets them up with a realistic, but easily achievable goal (we really don't want anyone - or any group - going into the last quarter of the course feeling like they'd failed a project)
  - Get the producer to set up private Hipchat groups for each group (for groups of three), so they can converse easily and privately between themselves. Ensure the instructional team are also invited to each group.

## Week 7, Day 5

- Javascript: Google maps

- HTML/CSS: Micro UX

lunch

project time


# Week 8

The focus of Week 8 is the team project. Ensure the groups are all on top of git on Monday, and have made progress on the core functionality of their app over the weekend.

Lessons are related gems and libraries - with the most relevant on Monday (to allow time to incorporate them during the week).

## Week 8, Day 1

- Rails: Rails controller rendering options

- Rails: Activemodel serializers

break

- Geolocate

lunch

Project time all afternoon


## Week 8, Day 2

- Javascript: jQuery UI

- Rails: High Voltage
  - or another gem that offers some use to them

lunch

Project time all afternoon


## Week 8, Day 3

- Javascript: Underscore
  - It's worth introducing Underscore this week, so that come Week 9, it's one less topic to cover for front-end JS frameworks, and they pretty much all use it.

Project time rest of day


## Week 8, Day 4

Project time all day
  * By this point the students will want to do nothing but project work - if you try to teach, they'll just ignore you and continue to Hipchat in their groups.
  * So to be nice, give them the full day on the project.
  * This also gives the team a chance to push the groups along to ensure they deliver as much as possible.


## Week 8, Day 5

Project time all morning
  * The students should be warned (ideally several times over the few days in advance) that this morning is a **very bad time** to be adding functionality.
  * It should be finishing touches and presentation preparation

lunch

Project presentations   
 - Make the order of the presentations random - have the previous group draw the next project.
 - After the presentations finish. Congratulate them on their efforts, and praise how much of an improvement they are on project 1.
 - Typically, we'd expect (if our group-picking went as planned), that the spread of quality and completion of projects we saw in project 1 should be compressed; and all five projects should be a lot closer together in project 2. So remind them that "we'd expected them to do about as much as a group as they did individually, but that we've been bowled over with how much more they've done"


# Week 9    

This is the "JS Frontend Framework" week. Choose something (Angular, Ember, Backbone, Hoodie...) and explore with the students the ideas around front-end JS frameworks.

We typically spend 2.5 days on the topic (half a day is needed for project 2 feedback), and if necessary (or desired) another day during week 10.

- For reference, historically we've taught:
  * Ember: It was a very complicated topic, not wholly grasped within the three days it was covered during WDI2.
  * Backbone: Taught twice.
    - In WDI4, the first day intro to Backbone went very well, but the next day's topics we're more slowly taken (also due to a night out the day before). So it took an extra day of "Backbone on Rails" during week 10 to get the majority of the functionality seen to the students.
    - In WDI5, the second day was straight to Rails (or other API) integration, with the third morning on routes and advanced topics. This was much better received in this order.
  * Angular: Introduced in WDI7, and very well received. 
    - So much so that the several students used it in the Week-9 hackathon 

The inclination at the moment is to try Angular - a topic we know in less depth than either Ember or Backbone, but one which seems (from online tutorials) to give a very familiar (to Rails-familiar devs) environment, and the learning slope to 'success' for beginners is quite shallow.

The homework for the next weekend is the Computer Science lesson preparation, so the instructional team will have allocated topics in advance, and given students the opportunity to suggest preferential topics of their own.

## Week 9, Day 1
  
- Javascript: JS Front-End Framework

## Week 9, Day 2

- Javascript: JS Front-End Framework

## Week 9, Day 3

- Javascript: JS Front-End Framework

Lunch

- Project 2 feedback
  * While the instructional team is feeding back to each project group, students should work on code tests (exercism exercises or similar)


## Week 9, Day 4

- Ruby: Gem creation

Lunch

- Hackathon


## Week 9, Day 5

- Hackathon

Lunch

- Hackathon presentations

- Homework: Prepare "Computer Science" lesson for week 11


## Week 10, Day 1
## Week 10, Day 2
## Week 10, Day 3
## Week 10, Day 4
## Week 10, Day 5

## Week 11, Day 1
## Week 11, Day 2
## Week 11, Day 3
## Week 11, Day 4
## Week 11, Day 5

## Week 12, Day 1
## Week 12, Day 2
## Week 12, Day 3
## Week 12, Day 4
## Week 12, Day 5








