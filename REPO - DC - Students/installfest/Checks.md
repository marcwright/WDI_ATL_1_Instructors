## Checkpoints to see if you computer is configured correctly

Most necessary:

* When you type `ruby --version` into your terminal, you get `ruby  1.9.3` or above
* When you type `git --version` into your terminal, you get `git version 1.9.1` or above
* When you type `pry` into your terminal, it changes the prompt to `[1] pry(main)>`
	* to exit pry, simply use the `exit` command
* When you type `rails --version` into your terminal, you get `Rails 4.1.0` or above

Sublime Text:

* When you type `subl` into your terminal, it opens up Sublime Text
* When you have Sublime open and press (Mac) `CMD+Shift+P` or (Ubuntu) `Ctrl+Shift+P` and type `install`, you get the option to `Package Control: Install Package`

Files:

* When you type `subl ~/.bash_profile`, Sublime Text 2 opens up a file with ASCII bubble text that says "BASH PROFILE"
* When you type `ls -a ~/` into your terminal, you are presented with a list of files (many of which begin with a period). This list should include `.gitconfig` and `.gitignore_global` 

Homebrew:

* When you type `brew doctor`, you get `Your system is ready to brew.`
	*  if upon running brew doctor you are advised to run brew update, and upon running brew update receive errors regarding file permissions, run the following command: `sudo chown -R YOUR_USER_NAME:admin /usr/local` and afterwards run `brew update` followed by `brew doctor`
 

Optional:

* (Mac) You have Spectacle installed on your computer and can use it to manage your windows
* (Before we begin GitHub) Your ssh keys are set up (see https://help.github.com/articles/generating-ssh-keys for instructions)
* When you type `bower --version` into your terminal, you get `1.3.2` or above
* When you type `grunt --version` into your terminal, you get `grunt-cli v0.1.13` or above
* When you type `node --version` into your terminal, you get `v0.10.26` or above
* When you type `npm --version` into your terminal, you get `1.4.3` or above
