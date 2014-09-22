Command Line basics
===================

https://github.com/0nn0/terminal-mac-cheatsheet/wiki/Terminal-Cheatsheet-for-Mac-(-basics-)

The UNIX philosophy is a large number of very specific programs that do one thing
only. If you want to do something complex, you can chain programs together.

+ A path is how you refer to a file or directory. A path is a list of components (directory or file names) separated by a slash (/).  Examples (you've already used them):

	+ image files- url(../assets/photos/sample.jpg)
	+ src files- <link rel="stylesheet" href="css/style.css">
	+ even the url in your browser
	+ Also, check out file path from Command-I on desktop.
pwdop
+ As you can see, a path is just a list of components (A, B, file) separated by slashes (/).

+ '/A/B/file' is an **absolute** path. It is a **concise** description of how to find a file. An absolute path starts from the root directory and works its way down. It is in truth relative to the filesystem root directory /. No matter the context, no matter what terminal you paste this path into, it will always specify the same path and so the same file.

+ 'A/B/file' is a **relative** path. A relative path starts from some contextually-determined parent directory and works its way down from there.  It tells you to move down two directories and end with the file named “file”. It doesn’t tell you how to get to two directories above file: a relative path relies on **context** to provide its starting point. When you pair it with that starting point, you resolve it into an absolute path.

####PWD
	In a terminal context, the default parent directory for a relative path is the present working 	directory, which you can print using the pwd command.
	
	pwd (print working directory)
####Shortcuts
		Remember that you can tab for autocomplete (if it autocompletes then you're correct
		
		CTRL + U - clears the terminal line
		COMMAND + K - clears the screen
		
		fn + arrows goes to beginning or end of line
####Change Directory - cd
		cd Documents 				-> go to 'Documents' folder (relative path from where you are now)
		cd /Users/marcwright/Documents 	-> go to 'Documents' folder (with absolute path)
		cd ..  						-> go up one folder
		cd ../Desktop  				-> go up one folder then down to 'Desktop' folder
####List - ls
		ls                        -> list current folder
		ls Desktop                -> list 'Desktop' folder
		[-a] - Display hidden files
####Make Directory - mkdir
		mkdir project             -> create folder 'project' (relative path)
		mkdir /Users/tim/Documents/project    -> create folder 'project' (absolute path)
####Touch - to create a file
		touch index.html                      -> (relative path)
		touch /Users/tim/Documents/project    -> (absolute path)
		*you can make several files on same line with a space between
####Write from VIM
		open 'file'
		vim 'file'
		Hit 'i' to INSERT
		Hit ESC then :q to quit
		:q! - to quit without saving
		:wq - to write and quit
####Remove File
		rm (remove file)
		rm index.html		
####Remove Directory
		rmdir (remove directory)
		rmdir project
		'rm -R' - to remove a directory and contents

		less (file reader)
		less index.html           -> use '/' to search, and 'q' to quit

		pipe (chaining programs)
		ls | less                 -> pipe the output of 'ls' to the input of 'less'
####Move File
		mv (move file / rename file)
		mv index.html show.html   -> rename 'index.html' to 'show.html'
####Other
	history n - shows history (add a number instead of n)
	*you can hit up arrow for history
		
Help
----
+ use man or pass in a -h or --help switch to any program
try 'man git'
+ whatis 'mkdir' or 'rm'
+ Chrome Extension Devtools Terminal - open the terminal in the browser window
