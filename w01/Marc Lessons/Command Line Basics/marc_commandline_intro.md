#Command Line Basics
we are going to go over a subset of unix commands that you will be using most of your time here in class. I will also show you some other usefull commands, some tools and some neat tricks. 

https://github.com/0nn0/terminal-mac-cheatsheet/wiki/Terminal-Cheatsheet-for-Mac-(-basics-)

###At the end of today you will be able to:

- understand absolute v relative paths
- change into a directory
- use cd .. to navigate up a tree (absolute v relative path)
- make a directory
- create a file with "touch"
- remove a directory
- list directory contents (horizontal / vertical)
- use tab completion
- how to get help (manpages)
- understand vim and nano

Either start with start wars excercise or after going through simple commands.



####UNIX Prologue
Bell labs UNIX intro

The UNIX Os was originally created at Bell Labs by Ken Thompson and Dennis Ritchie back in 1969. It was released to the public in 1975. Apple Computer transitioned its origianal home grown operating system over to a BSD variant of UNIX in 2000 know as OSX. In 2007 OSX became a certified UNIX.

Blaw Blaw Blaw...so what are UNIX machines and why does it matter?

Workstation machines and super computers run Linux. It's built to be more robust, reliable and powerful. It's not built for the masses its built for systems that need to NOT FAIL. BSOD are NOT welcome.

[Take a peek at the top 500 super computers in the world.](http://www.top500.org/lists/2014/06/)

You won't find Windos.

Most of the internets servers run a varient of UNIX called Linux
Many of the commands you will learn here are available on these other systems.

The UNIX philosophy is a large number of very specific programs that do one thing
only. If you want to do something complex, you can chain programs together.

####Paths
+ A path is how you refer to a file or directory. A path is a list of components (directory or file names) separated by a slash (/).  Examples (you've already used them):

	+ image files- url(../assets/photos/sample.jpg)
	+ src files- <link rel="stylesheet" href="css/style.css">
	+ even the url in your browser
	+ Also, check out file path from Command-I on desktop.
pwdop
+ As you can see, a path is just a list of components (A, B, file) separated by slashes (/).

+ '/A/B/file' is an **absolute** path. It is a **concise** description of how to find a file. An absolute path starts from the root directory and works its way down. It is in truth relative to the filesystem root directory /. No matter the context, no matter what terminal you paste this path into, it will always specify the same path and so the same file.

+ 'A/B/file' is a **relative** path. A relative path starts from some contextually-determined parent directory and works its way down from there.  It tells you to move down two directories and end with the file named “file”. It doesn’t tell you how to get to two directories above file: a relative path relies on **context** to provide its starting point. When you pair it with that starting point, you resolve it into an absolute path.

###Make Directory - mkdir
		mkdir project             -> create folder 'project' (relative path)
		mkdir /Users/tim/Documents/project    -> create folder 'project' (absolute path)
###Touch - to create a file
		touch index.html                      -> (relative path)
		touch /Users/tim/Documents/project    -> (absolute path)
		*you can make several files on same line with a space between

###more commands
- Remember that you can tab for autocomplete (if it autocompletes then you're correct)
		
		CTRL + U - clears the terminal line
		CTRL + L - clears the line
		COMMAND + K - clears the screen to $
- option arrows to skip around for history
- history n - to specifiy a certain # of previous commands
- Contol + a and Control + e for beginning and end of line
- open [file]
- open .
- subl . (open all the files in sublime - we will do this A LOT)
- ls and ls -la (hidden files)
- sudo - Run command with the security privileges of the superuser (Super User DO)

###even more commands
- man --- learn about a command---man [name_of_command]
- git --help, then command for command specifics
- top --- display running proccess and information (it's just cool)
- ps --- see all running processes with ids
- kill --- kill [id number]
- mdfind --- cooler than regular find --- mdfind [fileName]
- cal --- displays a calendar
- date --- the date-nuf said

####Write from VIM
		open 'file'
		vim 'file'
		Hit 'i' to INSERT
		Hit ESC then :q to quit
		:q! - to quit without saving
		:wq - to write and quit

