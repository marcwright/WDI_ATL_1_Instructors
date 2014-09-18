#mongodb install instructions
	
	brew update

	brew install mongodb

place in .bash_profile

	export PATH=<mongodb-install-directory>:$PATH

create the data directory

	mkdir -p /data/db

set permissions for the data directory

	whoami [yourusername]
	
then enter...

	sudo chown YOURUSERNAME /data/db
	
run mongodb

	mongodb
	
stop mongodb

	control+c
	
get the preferences pane

Control+trackpad-click  (right click) to install

[mongodb preferences pane](http://blog.mongodb.org/post/28925264384/macosx-preferences-pane-for-mongodb)

Note: To Mountain Lion users. This application is presently not on the app store and therefore it is not signed. You can still install it but don't be surprised to have an alert about it.

