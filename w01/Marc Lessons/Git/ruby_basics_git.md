###Ruby Basics

** Objectives ** 

#### Concepts
- Identify some key aspects of Ruby
- Describe the different types in Ruby (numbers, strings, etc.)

#### Mechanics
- Run Ruby code using pry
- Perform basic operations on strings and numbers
- Reference the Ruby docs to learn more about Ruby
- Manipulate strings using concatenation & interpolation
- Assign values to variables
- Run a Ruby program from the terminal
- Get input from the user from the terminal using `gets`
- Print output to the terminal using `puts`

** Activity **

#### What is Ruby?
  * Created by Yukihiro "Matz" Matsumoto in 1993
  * It was the birthstone of one of his colleagues
  * Created to make programmers happy

"Programmers often feel joy when they can concentrate on the creative side of programming, so Ruby is designed to make programmers happy." — Yukihiro "Matz" Matsumoto

"Often people, especially computer engineers, focus on the machines. They think, ‘By doing this, the machine will run faster. By doing this, the machine will run more effecively.’ They are focusing on machines. But in fact we need to focus on humans, on how humans care about doing programming or operating the application of the machines." — Yukihiro "Matz" Matsumoto 

  * Dynamic and Dynamically typed (vs. statically typed)

  * Interpreted
    * Code -> Compile -> Machine code
      * Typically faster
    * Code -> Interpreter -> Machine code
      * More dynamic (you can change stuff at runtime)
    * Execute instructions directly, without previously compiling a program into machine-language instructions. 
    * translates each statement into a sequence of one or more subroutines already compiled into machine code

  * Automatic Memory Management
    * Garbage Collection

  * Not going to understand these tradeoffs, but it's important that you hear them

####Information Technology:

* All computer programs are about data. Moving and transforming data.
* Example: Twitter.
* Since every computer program is about data, it makes sense that we start here and understand the basic types of data the computer understands
  * Data types help us represent entities in the real world

**Pry** *(Codealong)*

Understand the basic data types of Ruby, some idea about their use cases and dot notation:
- show ruby-doc.org to explore methods

* Favorite animal

- Strings
  - upcase
  - downcase
  - capitalize
  - reverse
  - length
- Numbers
  - Math
  - even?
- Floats
- Boolean
  - Comparators

* Variables:
  * What is a variable?
  * Naming conventions
      * Snake_Case vs. CamelCase
* Constants

**Everything is an expression, get used to noticing the return value**
* Expression: Something which evaluates to a value. Example: 1+2/x

Example - 2 + 2 vs “2” + “2”

* basic arithmetic & operators Math (+ - / * % += -=) (%, +=, -=)
* concatenation
* string interpolation
* Boolean expressions
  * Equality ( ==, !=, >, <)
  * Boolean operators ( && , ||, !)

**Running a program**

- Create file open and run it
- puts and gets
  - `gets.chomp`

* Name my pet
  * name
  * species

###Activity: Talkative Robot App

**Objective:** Practice/integrate learnings

1. Create a new ruby file in your work folder
2. Ask user's name
3. Ask user's age
4. Print "Hi, _name_ who is _age_ years old!"
5. Print ""You will be 75 years old in _years_ years."
6. Print "It is true/false that your name is Engelbert Humperdinck.
7. Print "Goodbye!"

# Break

### Intro to Git - ASCII Font

http://patorjk.com/software/taag/#p=display&f=Sub-Zero&t=hello%20world

**Objectives:**

- Explain what Git is and why we use it
- Make commits to a git repository
- Explain what a branch is and why we would use one

**Activity:**

* Explain why students are learning to use a Git and provide context to how web developers use it.
  * Version Control ( also SVN, Subversion)
  * Something that is taken for granted once you start using it - but imagining life without it makes it easy to remember why it is used
  * Makes experimentation risk-free
  * easy to undo
  * easy to fork
  * combines the "what" (code) with the "why" (commit message)
  * multiple people can work on the same code at the same time and sort of the differences later
  * Fast forward/rewind through software's evolution
  * Coordinating with teams
  * Controlling releases
  * Initialize a repo and make commits with Git

### Making Commits

* Using the whiteboard, explain what Git is and how it works
 * snapshots (commits)

* The 3 main sections of a Git Project
  * Working Directory
  * Staging Area
  * Git directory (repository)

* Demonstrate using Git by having students follow along with you.
  * Create a new directory and a new text file.
  * Use “git init” to initialize a git repo
  * Use “git status” to see where your files are at
  * Use “git add .” to start tracking files
  * Use “git commit -m” to commit changes with a message
  * Use “git log” to see all commits that have been made

* Show how you would make changes and undo changes.
  * Undo commits using git log, git reset (undoes snapshots), git reset --hard

* branches (different composition of snapshots - ie different cuts)

http://ndpsoftware.com/git-cheatsheet.html#loc=index;

# Break

### Github

** Objectives **

- Explain the difference between Git and Github

		Git is a revision control system, a tool to manage your source code history. GitHub is a hosting service for Git repositories. So they are not the same thing: Git the tool, GitHub the service for projects that uses Git.
			
		Also, you don't have to use a remote service like github if all you want is version control - local git is just fine for that. Remote repositories are for backup and collaboration.

- Explain the difference between a fork, clone

		Yes Fork is a clone on the server side. It emerged because, you cannot push to others' copies without their permission. What they do is make a copy of it for you (fork), where you will have write permission as well.

		In the future if the actual owner or others users with a fork like your changes they can pull it back to their own repo. Alternatively you can send them a "pull-request".

- Explain the difference between a fetch, merge and pull

		In the simplest terms, git pull does a git fetch followed by a git merge

- Diagram and explain how contributing to an open source project on Github works (or our homework submission process)

** Activity **

* Github
  * Make changes to your text file locally and push the changes to Github.

- Set up your fork of class repo
- Make a change and submit a pull request