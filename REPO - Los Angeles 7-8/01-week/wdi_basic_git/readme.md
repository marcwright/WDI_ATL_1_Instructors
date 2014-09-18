#Basic Git

Here is a nice basic git tutorial we will use in class
First we will chat about git and where it came from then we will DO some git

###Step 0 - setup
Create an account on github

setup ssh keys

create local directory

###Step1 - make a commit
Create files inside local directory.

Now add these files to git and then push them to github.



	git init

	git add -a

	git commit -m "description of what changed"
	
Go to git hub and create a new repo "myrepo"

Follow the instructions on github...I'll guide you.

Now we should be ready to push our local code up to github.

	git push
	

So now you have your own repo great. So now what?

Let's make a change to your local code and commit it.

###EXERCISE FUN

	Break into teams and make some commits
	
	and follow each other
#note:

	git status
	
	roll back a commit



###Step 2 - git history

making a change and adding a commit.

push this commit to github

Now take a look at the git log ... this shows your commit history

<!-- ###Step 3 - How to Branch

So saw you want to experiment without changing original files?

Make a branch

	git checkout -b name-of-new-branch
	
Make some changes and commit them, then go back to master branch

	git checkout master

and see the original is untouched!

###Step 4 - Merge a Branch

So that's cool but how do we add those changes to the master branch?

from the master branch

	git merge name-of-branch-just-worked-on


 -->