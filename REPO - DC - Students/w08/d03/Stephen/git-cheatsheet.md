# Git Teams Cheatsheet

## 1. Branches

A branch gives you your own copy of the repo to work on. Always work on your own branch!!

**Show all** branches, an your current working branch:

```
$ git branch
* greg
  master
```

**Create** a new branch:

```
git branch new_branch_name
```

**Change** between branches:

```
git checkout branch_name
```

**Delete** a branch:

```
git branch -d branch_name
```

## 2. Stashing

When you have uncomitted files, Git won't let you switch branches. If you want to stow away your working changes temporarily, use `git stash`. Think of the Git Stash as a closet you can pack your working changes into, then pull them back out later.

Git stash only packs up changes tracked in your staging area. You'll need to add changes before stashing:

**Add all changes** (new and untracked):

```
git add .
git add -u
```

**Stash** all changes:

```
git stash
```

**Restore** all changes:

```
git stash pop
```

Not that the Git stash is a first-in/last-out queue. Each time changes are stashed, they're added to the end of the stash queue. Each time a stash is popped, the last item in the queue is reapplied.

## 3. Pulling

You'll always need to pull down from the remote onto your "master" branch. Branch "master" should always reflect the current working state of the project based on all team submissions.

You should NEVER WORK DIRECTLY ON MASTER. Master is only used to pull and push files to the remote.

**Pull down** from the remote:

```
git checkout master
git pull
```

## 4. Rebase, Merge & Push

When you want to sync your branch with new files pulled down onto master, you should first *rebase* your working branch onto the latest files from master.

Rebase will copy new changes from master onto your branch, and then replay your changes and commits ontop of the rebased code.

After you've rebased your working branch with new files from master, you can safely merge your commits back onto master, and then push up.

**The Rebase/Merge process**:

 * commit all working changes on your branch.
 * checkout master, then pull.
 * checkout your branch, then rebase onto master.
 * resolve any merge conflicts.
 * checkout master, merge in your branch.
 * push master back to remote.
 * switch back to your branch.
 
**Command line**:

```
git checkout my_branch
git add .
git commit -m 'Adding all of my changes to my branch.'

git checkout master
git pull
git checkout my_branch
git rebase master

# Resolve any merge conflicts!

git checkout master
git merge my_branch
git push

git checkout my_branch
```

# 5. Merge Conflicts

If you and a teammate have both worked on the same file, you will encounter a merge conflict. If you've followed rebase/merge proceedures, you should encounter this merge conflict on YOUR BRANCH, not on master. This is good, all conflicts want to be resolved on branches, and not within the main working codebase.

If you encounter a merge conflict while rebasing, Git will provide a list of all file names in which a conflict occurred. You'll need to open each of those files individually and resolve conflicts.

**A conflict looks like this**:

```
<<<<<<< Updated upstream
.product {
  background-color: rgba(165, 119, 0, 0.5);
=======
.product div {
  color: rgba(165, 119, 0, 0.5);
>>>>>>> Stashed changes
  height: 200px;
  width: 200px;
}
```

Notice how the conflicting lines are blocked out: there's an "Updated upstream" block, and then a "Stashed changes" block. A line row ("=======") separates the two blocks. These two blocks represent the two conflicting states of this comitted code. Your job is to decide which block to keep. You'll need to reconcile the two code states, and then commit the resolved changes.

**Resolved merge conflict**:

```
.product {
  background-color: rgba(165, 119, 0, 0.5);
  color: rgba(165, 119, 0, 0.5);
  height: 200px;
  width: 200px;
}
```

Then we have to commit this resolution:

```
git add .
git commit -m 'Fixing merge conflict.'
```

Now we can proceed with merging our branch back into master, and then pushing up to the remote.