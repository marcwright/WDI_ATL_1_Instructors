### git flow
[A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)
![](http://nvie.com/img/2009/12/Screen-shot-2009-12-24-at-11.32.03.png)


### git merge

Merging is Git's way of putting a forked history back together again. The git merge command lets you take the independent lines of development created by git branch and integrate them into a single branch.

### git commit --amend

The git commit --amend command is a convenient way to fix up the most recent commit. It lets you combine staged changes with the previous commit instead of committing it as an entirely new snapshot. It can also be used to simply edit the previous commit message without changing its snapshot.

But, amending doesn’t just alter the most recent commit—it replaces it entirely. To Git, it will look like a brand new commit, which is visualized with an asterisk (*) in the diagram above. It’s important to keep this in mind when working with public repositories.

```
# Edit hello.rb and main.rb
git add hello.rb
git commit

# Realize you forgot to add the changes from main.rb
git add main.rb
git commit --amend
```
### git checkout

The git checkout command serves three distinct functions: checking out files, checking out commits, and checking out branches. In this module, we’re only concerned with the first two configurations.

Checking out a commit makes the entire working directory match that commit. This can be used to view an old state of your project without altering your current state in any way. Checking out a file lets you see an old version of that particular file, leaving the rest of your working directory untouched.

```
  git checkout master
```
Return to the master branch. Branches are covered in depth in the next module, but for now, you can just think of this as a way to get back to the “current” state of the project.

```
  git checkout <commit> <file>
```
Check out a previous version of a file. This turns the <file> that resides in the working directory into an exact copy of the one from <commit> and adds it to the staging area.

```
  git checkout <commit>
```
Update all files in the working directory to match the specified commit. You can use either a commit hash or a tag as the <commit> argument. This will put you in a detached HEAD state.

Grab a File from Another Branch without Switching Branches

```
  git checkout <BRANCH> -- path/to/file.rb
```


### git stash

Sets changes you've made off to the side in a way that lets you bring them back later. Usage: you are about to checkout another branch which would crush your current changes, so you git stash them before doing your checkout.


### git reset 

Like git checkout, git reset is a versatile command with many configurations. It can be used to remove committed snapshots, although it’s more often used to undo changes in the staging area and the working directory. In either case, it should only be used to undo local changes—you should never reset snapshots that have been shared with other developers.

rollback to a previous commit 
```
git reset --soft <commit>
```
this will bring back changes in staging area

get rid of changes introduced by a previous commit 
```
git reset --hard <commit>
```
this will remove commits changes (CAREFUL)

move changes from staged to unstaged
```
git reset -- a.txt 

```


### tips

show all merged branches
```
git branch --merged
```

show all unmerged branches
```
git branch --no-merged
```
show all aliases created by zsh for git
```
alias | grep git
```

### Cool Hooks

Git hooks will run action before , during or after a commit or a push.

Don't forget to make git hooks files executables ( ```chmod +x``` )

#### Pre-commit Hook

This hook prevents debugging code to be committed

```ruby
#!/usr/bin/env ruby

exit 0 if ARGV.include?('--no-verify')

keywords = %w(binding.pry throw console.log debugger)
files_changed = %x(git diff-index --name-only HEAD --).split
files_changed.delete("README.md")
%x(git grep -q -E "#{keywords.join('|')}" #{files_changed.join(' ')})

if $?.exitstatus.zero? && files_changed.length > 0
  puts "# Check following lines:"
  puts files_changed
  files_changed.each do |file|
    keywords.each do |keyword|
      %x(git grep -q #{keyword} #{file})
      if $?.exitstatus.zero?
        line = %x(git grep -n #{keyword} #{file} | awk -F ":" '{print $2}').split.join(', ')
        puts "#\t\033[31m#{file}\033[0m contains #{keyword} at line \033[33m#{line}\033[0m."
      end
    end
  end
  exit 1
end
```