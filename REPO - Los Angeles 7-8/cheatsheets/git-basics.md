Git
===

Git is a verson control system (or source control management). It lets you keep
files safe in a vault, track changes to files, and swap changes with other people.


	git init .                -> create a new git repository in the current directory
	
	git status                -> show me the status of this repository (changes, new
	                              files, deleted files)
	
	git log                   -> show me all the commits in the repository
	
	git diff                  -> show me the changes I've made since the last commit
	
	git add file1 file2...    -> add files to the staging area
	
	git reset HEAD file1      -> remove file1 from the staging area
	
	git commit -m message     -> create a commit from the stating area with 'message'
	
	git commit -am message    -> add all tracked and changed files to a commit with 'message'
	
	git pull origin master    -> pull changes from github (the 'master' branch from
	                              the 'origin' remote )
	
	git push origin master    -> push your changes to github


Help
----

There is a free book that will teach you everything you might need to know
about Git [here](http://git-scm.com/book).