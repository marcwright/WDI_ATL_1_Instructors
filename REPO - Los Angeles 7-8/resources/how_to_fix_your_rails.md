#How to fix your Rails

at the your iterm2 prompt run "genstats"

```
$ genstats
GA General Assembly  Web Development Immersive
------------------------------------------
ruby 2.0.0p451 (2014-02-24 revision 45167) [universal.x86_64-darwin13]
Rails 4.0.4
git version 1.8.5.2 (Apple Git-48)
heroku-toolbelt/3.9.6 (x86_64-darwin10.8.0) ruby/1.9.3
psql (PostgreSQL) 9.3.4
Homebrew 0.9.5
------------------------------------------
```

##if you don't see Rails 4.0.4

...grab an instructor and follow these steps



caution on sudo

gem uninstall --all

gem install rails -v 4.0.4 

gem update --system

gem cleanup

cd ~/

bundle install

###note: you will have to reinstall other gems as well (i.e. genghisapp)



