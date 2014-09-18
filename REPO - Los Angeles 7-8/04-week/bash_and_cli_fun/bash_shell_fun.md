#Bash Shell Fun
(aka ... how to make your prompt do cool stuff)

**Lesson Goals:**

Today you are going to learn how to modify your command prompt as well as use tools to help better use the cli.

- step 1: use iterm2
- step 2: copy Alfonso's GA .bash_profile as your own.
- step 3: explore some stuff

**first things first** stop using the stock terminal program provided by Apple.

We are downloading iterm2. Why? Because it's fracking awesome!!!

[iterm2](http://iterm2.com/features.html)

**iterm2 preferences:**

once downloaded open the preferences for iterm (command+,)

**set working directory:**

go to profiles/general

working directory - "reuse previous session's directory"

**set scrollback:**

go to go to profiles/general/Terminal

Look for "Scrollback Buffer" and check the box ON

**set transparency:**

go to profiles/general/window

Look for "Window Appearance" and set Transparency to 40% 

	command+u

##Other Shells:

Shells are like dimensions in the universe there are many.

- zsh (Z-shell)
- tcsh (TC-shell)
- bash
- ksh (Korn shell)
- csh (C shell)
- sh (Bourne shell)

[compare shells](http://en.wikipedia.org/wiki/Comparison_of_command_shells)

Which on is best? Depends on Whom you're talking to?

##Bash:

For the sake of this conversation we will stick with the Bash shell

**When started as your login shell**, Bash executes the commands in your dot files in this order...

- /etc/profile (if it exists)
- ~/.bash_profile
- ~/.bash_login
- ~/.profile

**When started as an interactive shell (but not a login shell)**

- ~/.bashrc (if it exists)

**When you logout of your computer**

- Bash reads and executes ~/.bash_logout (if it exists)


So let's play with fonso's bash_profile

[fonso's bash](https://github.com/thefonso/dotfiles/blob/master/.bash_profile)

#cool Git

Time to make git cool. We will configur and create shortcuts for working with git by configuring your .gitconfig file.

at your prompt type...

	ls -a

**you should see listed .gitconfig**

open it in sublime

	subl ~/.gitconfig
	
Now take a peek at fonso's file

[Fonso's .gitconfig](https://github.com/thefonso/dotfiles/blob/master/_gitconfig)

Copy that fracker and put it in yours....this will be your default.

NOTE:

	[user]
		name = your_github_name
		email = your_github_email


## =====================
## Project - 5mins
## =====================

But fonso your file sucks I want my own aliases

[ok fine then use this page to do todays project](http://githowto.com/aliases)

( team up in fours ) create some aliases of your own

we will demo them in 5mins



## =====================
## Resources
## =====================

[pimp your iterm2](http://sage.ucsc.edu/xtal/iterm_tab_customization.html)

[Bash shell hacking guide](http://www.tldp.org/LDP/Bash-Beginners-Guide/Bash-Beginners-Guide.pdf)

http://en.wikipedia.org/wiki/Bas_(Unix_shell)

[Bash cheat sheet](http://cli.learncodethehardway.org/bash_cheat_sheet.pdf)

[Prompt Statement variables](http://ss64.com/bash/syntax-prompt.html)

[Bash Prompts](https://dougbarton.us/Bash/Bash-prompts.html)

[Unix Shells](http://faculty.plattsburgh.edu/jan.plaza/computing/help/shells.html)



 
 




