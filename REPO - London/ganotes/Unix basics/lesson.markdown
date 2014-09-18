Objective: 
- Students are able to use a computer on the command line to list, create, remove, and manage files 
- Students understand directory structures
- Students understand that everything is a file
- Students understand how programs work and what daemons are
- Students understand where programs are configured
- Students understand how to get help


Outline: 

- What's an operating system? 
  - OSX
  - Windows
  - DOS
  - iOS
- What does an operating system do? 
  - Handles input and output
  - Lets you access devices
  - Runs programs, more than one at a time
  - Manages memory
  - Deals with networking
  - Draws things to the screen
- How can we interact with computers? 
  - Graphically
  - Textually
- Why are we doing things with text in 2014? 
  - It's easier to access remote computers that way
  - Text is still very powerful
  - Text is really easy to automate
  - "Small pieces, loosely joined". 
  - Text is easy to version-control (config files)
  - There's less to go wrong

# Workshop: working with the filesystem
- Open a terminal window
- See that ~? That's a prompt. 
- We can type things at the prompt. 
- If things go well, it generally won't tell you
  `touch foo.txt`
  `chmod 644 foo.txt`
  `rm foo.txt`
  None of these have any output. 
- Structure of the filesystem
  - In Unix, everything is a file, even disk drives and network interfaces and the internal state of the system
    `pwd`
    `ls /`
  - /etc: config files
  - /var: variable files (such as logs, caches, etc) 
  - /home: where your files live
  - /usr: system programs in /usr/bin, documentation in /usr/share/doc, etc. 
  - /bin: System-critical programs live in here. Bin for binary. 
- Let's make a new directory, tmp.
  - `mkdir tmp`
  - `cd tmp`
  - `ls`
  - `ls -a`
    - Look at that . and ..!
  - `touch empty.txt`
  - `echo "Some output text" > example.txt`
  - ls -l

  - What does this output mean? 
    - What are permissions?
    - What are users and groups? 
      - `whoami`
      - `groups`
    - File size
    - ctime
    - filename

  - cp example.txt explame2.txt
  - mv explame2.txt example2.txt

- Grab a file from the internet: 
  - wget <weblog url>
  - head access.log
  - grep 404 access.log
  - grep 404 access.log | awk '{print $7}'
  - grep 404 access.log | awk '{print $7}' | sort 
  - grep 404 access.log | awk '{print $7}' | sort | uniq -c

- What are these programs, anyway? 
  - `whatis wget`
  - `man wget`
  - When you type 'wget' the computer runs it, and the program exits when it's retrieved the whole file. 
  - What if it doesn't exit? What's that kind of program? 
  - Whenever a program runs, it's known as a 'process'. Each process has a number, and each process has a parent, and an owner. 
    - Some owners can do more than others... generally this comes down to permissions. 
  - The top level parent is a program called 'init'. 
  - `pstree`
  - `ps aux`
  - `top`

- Daemons
  - Programs that run all the time are known as daemons. You often see them with a 'd' at the end of their name because of this. 
  - Also known as 'services' these days. 
  - A web server is a daemon. So's a database. So's the system logger. So is a mail server. 
  - Generally these programs sit around waiting for something to happen (like a user connects), then process that. 
  - Most of them log to /var/log
  - There are a number of ways to control them. 
    - The old-fashioned way: /etc/init.d/apache start
    - The newer way: service apache start


- Where's this stuff configured? 
  - /etc
  - Generally plain text
  - You probably have to be root to edit. 

- Root? What? 
  - When you login, you login as a user
  - Users can have different permissions
  - For instance, if you're on a shared server, you can't read your colleagues' files by default. 
  - The superuser is called 'root'
  - Generally, only the superuser is allowed to edit system files, and start and stop daemons. 
  - But you can temporarily ask for super-user permissions using sudo. ("Super User Do".)
  - eg. "touch /root/test.txt" (permission denied); "sudo touch /root/test.txt" (works). 

- Places for help
  - Man pages if you know the program you want
  - Config files are often well-commented. 
  - Stack Overflow/superuser
  - Colleagues.
