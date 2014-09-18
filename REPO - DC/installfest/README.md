## WDI InstallFest Script

##### For Mac OS:

Paste this script into a Terminal prompt:

```
bash <(curl -sL https://raw.github.com/vanderhoop/installfest_script/dc_1/install.sh)
```

The script first runs any software updates and then checks for Xcode.

If Xcode is installed the script continues.

- We then clone the repo onto the student's machine
- Remove Macports or RVM
- Installs homebrew and some formulae
- Sets up git
- Installs Sublime and Sublime settings (package manager and base packages)
- Installs additional apps like Chrome, HipChat and Spectacle
- Sets up RBenv and installs bundler, pry and rails
- Adds solarized to Terminal
