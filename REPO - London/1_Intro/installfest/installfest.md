# Installfest

### Pre-install
1. Identify which version of OSX you're using - ideally you should have Mavericks or newer (10.9.2)
2. Ensure you've got Xcode installed - https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12
3. Ensure that you've uninstalled any antivirus software you may have, as it can prevent some of the tools from installing properly

### Install and connect to HipChat
1. Sign up to [HipChat](https://www.hipchat.com/)
2. Install the OSX app and keep it running


### Install Google Chrome
1. Go to [https://google.com/chrome](https://google.com/chrome)
2. Click on `Download Chrome`
3. Go to the Downloads folder and run the `googlechrome.dmg` package


### Install Command Line Tools
1. Run from the command line: `xcode-select --install`
2. Choose `install tools` from the prompt and `agree` to the terms
3. If you recieve a message saying "Can't install the software because it is not currently available from the Software Update server"... it's probably because the command line tools are already installed...
4. Agree to the license by typing `sudo xcodebuild -license`
5. Press enter, then `q`
6. Then on the next prompt, type `agree`


### Install Sublime Text 2
1. Download and install [Sublime Text 2](http://www.sublimetext.com/) - version 2.0.2 is current
2. Make a symlink for Sublime Text, allowing us to launch it from the command line:
`sudo ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /bin/subl`
3. Install the [sublime package manager](https://sublime.wbond.net/installation#st2)
4. add _reindent_ and _paste_and_indent_ shortcuts in Preferences/Key Bindings - User, restart sublime: 
  [
    { "keys": ["super+v"], "command": "paste_and_indent" },
    { "keys": ["super+shift+v"], "command": "paste" },
    { "keys": ["super+shift+r"],  "command": "reindent" }
  ]
5. NOT YET SURE IF THIS SHOULD BE IN INSTALLFEST or later:
Add sidebar enhancements, place SideBarEnhancements package (you can find zip in WDI_LDN_Curriculum/Intro/effective_text_editing) to Library/Application Support/Sublime Text 2/Packages
(to open this folder easily in Finder click Sublime menu > Preferences > Browse packages... )

6. AFTER INSTALLING ZSH:
  Add following to .zshrc to make sublime default text editor:
  export EDITOR='subl -w -n'
  export PAGER='less -f'



### Install Package Manager
1. The package manager allows us to install and update software (like Ruby, Git, MongoDB, etc) from the command line:
2. Open http://brew.sh/, scroll down to Install Homebrew and copy+paste the command into the terminal.
3. Ensure that Homebrew is raring to brew and fix any issues:
`/usr/local/bin/brew doctor`
4. Update Homebrew:
`/usr/local/bin/brew update`

(nb. the absolute paths will not be used after the next step, but might not be needed if they already have `/usr/local/bin` in their $PATH)


### Install Zsh
1. Type `/usr/local/bin/brew install zsh` Type `0` if the prompt ask you about .zshrc
2. Type `/usr/local/bin/zsh` . You should have a different prompt
3. Type `exit` to return to bash
5. Type `which zsh` to determine where your new shell has installed
5. Type `subl /etc/shells` and add `/YOUR/PATH/TO/zsh`.
6. In a new tab, type `chsh -s /YOUR/PATH/TO/zsh`, then close and reopen your terminal application to This will enable zsh by default.
7. Type `echo $SHELL`. this should return `/YOUR/PATH/TO/zsh` 


### install Oh-My-Zsh
1. Type `curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh`
2. Let's move Homebrew's directory further up the PATH, so that software loads from there by preference:
  * Open the zshrc file `subl ~/.zshrc`
  * Find the line that starts with export PATH=$PATH (usually near the end of the file)
  * Get rid of any $PATH part which is located just after the = sign
  * Move the /usr/local/bin part to the front of the statement (just after the = sign)
  * Add $PATH at the end of the line (just after the last colon)
  * While you're in here, disable auto-updating by removing the `#` in front of the setting (around line 18)
  * save the file


### Install Ruby Environment (Rbenv) and builder
1. Install rbenv (the Ruby version manager) and ruby-build (the Ruby version builder) from Homebrew:
`brew install ruby-build rbenv`
2. Ensure that rbenv is loaded whenever we open a command line session:
`echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc`
3. Move the rbenv environment higher in the load order:
`echo 'export PATH=$HOME/.rbenv/shims:$PATH' >> ~/.zshrc`
4. Quit the current terminal (Cmd+Q)
5. And then reopen the terminal application, ensuring there are no errors - you should be able to type `rbenv -v` and get a version number.


### Install a version of Ruby with ruby-build
1. OS X 10.9 comes with Ruby baked in, but it's version is not the latest one. We could upgrade that version of Ruby to a newer one, but what if we needed to run one version of Ruby for one app, and a different version for another?
2. Install Ruby 2.1.2. This is the latest version of Ruby 2.1:
`rbenv install 2.1.2`
3. This is required every time we install a new Ruby or install a gem with a binary:
`rbenv rehash`
3. Set the global Ruby to the one we've just installed, which is a sensible default:
`rbenv global 2.1.2`
4. Test you have the right version with `ruby -v`


### Skip gem rdoc generation
1. Whenever we install a gem, it also installs a bunch of documentation we probably don't want - the following commans allows us to avoid this:
`echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc`


### Install Bundler
1. Bundler manages Ruby gems per-project/application, and makes it trivial to install all the dependencies for an application:
`gem install bundler`
`rbenv rehash` (because we've installed a new binary)


### Install Wget
1. We will often download files from the internet in the command line… this is the tool to do that:
  
  `brew install wget`


### Install PostgreSQL
1. Download [PostgreSQL](http://postgresapp.com/)
2. Unzip the downloaded file and drag to `applications`
3. Choose `automatically start at login` in preferences, and don't `show welcome screen`
4. add to the PATH variable in .zshrc:
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"



### Install Git
1. This ensures we can upgrade Git more easily:
`brew install git`
2. Ensure you're not using "Apple Git" from the path `/usr/bin/git` by checking `which git` and `git --version`
3. Configure your name and email address for commits (be sure to use the email address you have registered with Github):
`git config --global user.name "Your Name"`
`git config --global user.email "you@example.com"`



### Globally ignore 'DS_Store' files
Since we never want to track .DS_Store files, we can make a global `.gitignore` file, and tell git to use it for all repositories:

```
  echo .DS_Store >> ~/.gitignore_global
  git config --global core.excludesfile ~/.gitignore_global
```


### Configure SSH access to Github
1. First, we need to check for existing SSH keys on your computer. Open up your Terminal and type:
`ls -al ~/.ssh`
Check the directory listing to see if you have files named either id_rsa.pub or id_dsa.pub. If you have either of those files you can skip to the step 'add your SSH key to Github'.
2. Generate a new SSH key
`ssh-keygen -t rsa -C "your_email@example.com"`
3. You'll be prompted for a file to save the key, and a passphrase. Press enter for both steps (default name, and no passphrase)
4. Then add your new key to the ssh-agent:
`ssh-add ~/.ssh/id_rsa`
5. Add your SSH key to GitHub by logging into Github, visiting `account settings` and clicking `SSH keys`. Click `Add SSH key`
6. Copy your key to the clipboard with the terminal command:
`pbcopy < ~/.ssh/id_rsa.pub`
7. On Github, create a descriptive title for your key, an paste into the `key` field - *do not add or remove and characters or whitespace to the key*
8. Click `Add key` and check everything works in the terminal by typing:
`ssh -T git@github.com`


### Clone repositories for assignments and classnotes
TODO: fill in details of the repositories...


### Move the hash symbol somewhere more convenient
1. Bind the `§` key to the hash symbol by creating/editing the default key binding dictionary:
`mkdir ~/Library/KeyBindings`
`subl ~/Library/KeyBindings/DefaultKeyBinding.dict`
2. Add the binding:
```
  {
    /* Map # to § key*/
    "§" = ("insertText:", "#");
  }
```
3. Restart your Mac for this to take effect.







