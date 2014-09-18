	# Installing Tools

1. [HipChat][hipchat]
* Google Chrome
	* `sudo apt-get install libxss1`
	* `wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb`
	* `sudo dpkg -i google-chrome*.deb`
* [Install Ruby + Rails](http://gorails.com/setup/ubuntu/13.10) (Be sure to read the below instructions before going to the linked guide.)
	* In the linked guide when you get to generating you SSH key, as you're generating the key it requests a location to create the files, use the example the prompt provides.
		*If you create a psscode when generating the key, you will be prompted for the passcode when testing the connection.
	* Skip the portion of the guide for installing MySQL
	* In the final steps there are three different commands that start with `rails new` use the third one `rails new myapp -d postgresql`
	* After completing the linked guide run the following commands
		1. `git config --global alias.st "status -sb -uall"`
		* `git config --core.editor "subl"`
		* `git config --global core.editor "subl"`
		* `git config --global core.excludefile "~/.gitignore_global"`
		* `gem update --system`
		* `gem install bundler rails pry --no-document`
* Setup [Github Account][github]
* Set up Bash Profile
	* `mkdir ~/bin`
	* Open your .gitconfig file `subl ~/.gitconfig` and verify it matches the following [.gitconfig](https://gist.github.com/jkonowitch/6664550)
	* Open your .gitignore-global file `subl ~/.gitignore-global` and copy the following to it [.gitignore-global](https://gist.github.com/jkonowitch/6664554)
	* Open your bash profile `subl ~/.bashrc` and add the contents of the following to the end of the file [.bashrc](https://gist.github.com/JustinGA/10768609)
	* Customize icon if you want! (we set up as ♬)
* [Sublime Text 2][subl]
    1. [Package Manger][pkg]
    3. [Sublime Text > Preferences > Settings-User](https://gist.github.com/jkonowitch/6664557)

[chrome]:   https://www.google.com/intl/en/chrome/browser/
[dotfiles]: ../Instructor_Tools/dotfiles
[gconfig]:  http://git-scm.com/book/en/Customizing-Git-Git-Configuration
[gignore]:  https://help.github.com/articles/ignoring-files
[github]:   https://github.com/
[pkg]:      http://wbond.net/sublime_packages/package_control/installation
[subl]:     http://www.sublimetext.com/
[hipchat]:  https://www.hipchat.com/downloads#linux
[rails]:	http://gorails.com/setup/ubuntu/13.10