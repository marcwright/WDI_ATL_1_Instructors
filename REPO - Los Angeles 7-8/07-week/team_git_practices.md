#Team Git Practices

###Lesson Objectives
* Explain *what* branching is, *why* you would branch, and *how* to branch.
* Be able to branch, merge, and resolve conflicts when working in a team.



### What we did in class...
1. Talked about how teams use Git and GitHub & about why VCS and Git are used
2. Talked about branching and go over branching commands
3. Undoing changes and Reset
4. Mer and Richard demo with branching, pull requests, and merging
5. Lab Time - Pair up and create your own feature branches etc. recreate Mer’s demo with a partner
6. Team communication - good ways to give constructive feedback - PQP - Sandwhich

### Your In-Class Lab...
* Jack and Sally are working together...
* Sally creates a repo and adds Jack as a collaborator
* Jack copies the clone URL from the GitHub repository, and in his Terminal runs ```git clone <cloneURL>```
* Jack and Sally both create their own individual branches
* They both write their own code while on their own branches 
* Of course, they both ```git add``` and ```git commit``` after writing their code
* Jack git pushes to his branch (```git push origin jacksbranch```) and then goes to GitHub and sends a pull request to Sally
* On GitHub, Sally reviews the pull request and merges the request
* Jack then switches to the master branch and does a ```git pull```
* He then switches back to his branch and does ```git merge master```
* If they happen to have merge conflicts, ```subl .``` to resolve conflicts


###Branching Commands
```
git branch - This lists your available branches.

git branch branchname - This creates a new branch.

git branch -v  - To see the last commit on each branch.

git checkout -b branchname - This creates and immediately switchs to a branch.
git checkout branchname - Switches you to another branch.

git branch -d branchname - This deletes a branch.

git merge branchname - This merges a branch onto the branch you're sitting on (If you're on the master branch, it mersges branchname into master).
```


